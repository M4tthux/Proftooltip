#!/usr/bin/env node
/**
 * ProfTooltip — deterministic skill-level verifier
 *
 * For every crafting recipe that has a spell_id, fetch the Wowhead Classic
 * spell XML and read the authoritative "learnedat" value (the skill level at
 * which the recipe becomes available). Compare it to our stored `skill`:
 *   - match      → mark skill_verified: true
 *   - mismatch   → correct skill = learnedat, mark skill_verified: true, log it
 *   - no learnedat / fetch fail → leave skill_verified as-is, log reason
 *
 * No data is invented: the skill always comes from Wowhead, never from memory.
 * Idempotent: recipes already skill_verified:true are skipped (no refetch).
 *
 * Usage:
 *   node verify_skills.js                 → all crafting professions
 *   node verify_skills.js engineering     → one profession
 *   node verify_skills.js --force         → re-verify even already-verified
 */

const fs   = require('fs');
const path = require('path');

const DB_DIR = path.join(__dirname, 'database');
const FILES = ['alchemy', 'blacksmithing', 'leatherworking', 'tailoring', 'cooking', 'first_aid', 'engineering'];

const CONCURRENCY = 2;          // gentle: Wowhead 403-throttles bursts (~400 req)
const PACE_MS = 500;            // min gap between dispatches per worker
const RETRIES = 6;
const UA = { 'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
             'Accept-Language': 'en-US,en;q=0.9' };

function sleep(ms) { return new Promise(r => setTimeout(r, ms)); }

async function fetchLearnedAt(spellId) {
  const url = `https://www.wowhead.com/classic/spell=${spellId}`;
  for (let attempt = 1; attempt <= RETRIES; attempt++) {
    try {
      const res = await fetch(url, { headers: UA });
      if (res.status === 403 || res.status === 429) {
        // rate-limited → long cooldown, then retry (don't count as a hard fail yet)
        if (attempt === RETRIES) return { learnedat: null, reason: `fetch_fail:HTTP ${res.status}` };
        await sleep(15000 * attempt);
        continue;
      }
      if (!res.ok) throw new Error(`HTTP ${res.status}`);
      const txt = await res.text();
      // The page embeds the spell data object inline as: g_spells[<id>], {"...":..,"learnedat":N,..,"id":<id>,..}
      // (inside an _.extend(...) call). Other g_spells[<id>].prop = ... assignments exist too —
      // anchor on the ", {" form to grab the data object specifically.
      const anchor = txt.indexOf(`g_spells[${spellId}], {`);
      if (anchor === -1) return { learnedat: null, reason: 'spell_block_not_found' };
      const block = txt.slice(anchor, anchor + 2000);
      if (!new RegExp(`"id":${spellId}\\b`).test(block)) return { learnedat: null, reason: 'id_mismatch' };
      const m = block.match(/"learnedat":(\d+)/);
      return { learnedat: m ? parseInt(m[1], 10) : null, reason: m ? null : 'no_learnedat' };
    } catch (e) {
      if (attempt === RETRIES) return { learnedat: null, reason: `fetch_fail:${e.message}` };
      await sleep(400 * attempt);
    }
  }
}

async function runPool(items, worker) {
  const results = new Array(items.length);
  let idx = 0;
  async function next() {
    while (idx < items.length) {
      const i = idx++;
      results[i] = await worker(items[i], i);
      await sleep(PACE_MS); // be polite — stay under the 403 throttle
    }
  }
  await Promise.all(Array.from({ length: CONCURRENCY }, next));
  return results;
}

async function verifyFile(base, force) {
  const file = path.join(DB_DIR, `${base}.json`);
  const db = JSON.parse(fs.readFileSync(file, 'utf8'));
  const recs = db.recipes || db;
  const entries = Object.entries(recs);

  const todo = entries.filter(([, r]) => r.spell_id && (force || !r.skill_verified));
  const noSpell = entries.filter(([, r]) => !r.spell_id);

  process.stdout.write(`\n[${base}] ${entries.length} recipes — ${todo.length} to verify, ${noSpell.length} without spell_id\n`);

  const corrections = [];
  const unresolved = [];
  let verified = 0, done = 0;

  await runPool(todo, async ([itemId, r]) => {
    const { learnedat, reason } = await fetchLearnedAt(r.spell_id);
    done++;
    if (done % 25 === 0) process.stdout.write(`  [${base}] ${done}/${todo.length}\n`);
    if (learnedat === null) {
      unresolved.push({ itemId, name: r.name, spell_id: r.spell_id, reason });
      return;
    }
    if (learnedat !== r.skill) {
      corrections.push({ itemId, name: r.name, old: r.skill, new: learnedat });
      r.skill = learnedat;
    }
    r.skill_verified = true;
    r.skill_source = 'wowhead-learnedat';
    verified++;
  });

  for (const [itemId, r] of noSpell) unresolved.push({ itemId, name: r.name, spell_id: null, reason: 'no_spell_id' });

  // refresh meta
  db._meta = db._meta || {};
  const stillUnverified = entries.filter(([, r]) => !r.skill_verified).length;
  db._meta.skill_verification = {
    method: 'Wowhead Classic spell XML learnedat',
    verified_count: entries.filter(([, r]) => r.skill_verified).length,
    unverified_count: stillUnverified,
    corrections: corrections.length,
  };

  fs.writeFileSync(file, JSON.stringify(db, null, 2), 'utf8');

  process.stdout.write(`  [${base}] ✅ verified=${verified}  corrected=${corrections.length}  unresolved=${unresolved.length}  stillUnverified=${stillUnverified}\n`);
  return { base, total: entries.length, verified, corrections, unresolved };
}

async function main() {
  const args = process.argv.slice(2);
  const force = args.includes('--force');
  const target = args.find(a => !a.startsWith('--'));
  const files = target ? FILES.filter(f => f === target.toLowerCase()) : FILES;

  const summary = [];
  for (const base of files) summary.push(await verifyFile(base, force));

  const report = {
    generated: new Date().toISOString(),
    professions: summary.map(s => ({
      profession: s.base,
      total: s.total,
      verified_this_run: s.verified,
      corrections: s.corrections,
      unresolved: s.unresolved,
    })),
    totals: {
      corrections: summary.reduce((a, s) => a + s.corrections.length, 0),
      unresolved: summary.reduce((a, s) => a + s.unresolved.length, 0),
    },
  };
  fs.writeFileSync(path.join(__dirname, 'SKILL_VERIFICATION_REPORT.json'), JSON.stringify(report, null, 2), 'utf8');
  process.stdout.write(`\n==== DONE — corrections=${report.totals.corrections} unresolved=${report.totals.unresolved} ====\n`);
  process.stdout.write(`Report → SKILL_VERIFICATION_REPORT.json\n`);
}

main().catch(e => { console.error('Fatal:', e); process.exit(1); });
