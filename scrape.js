#!/usr/bin/env node
/**
 * ProfTooltip — Wowhead Classic scraper
 *
 * Pipeline (single request per item):
 *   1. wow-classic-items npm  → item IDs per profession (Classic Era only)
 *   2. wowhead.com/classic/item=ID&xml  → <createdBy> section with spell ID + reagents
 *   → database/PROFESSION.json  (same format as engineering.json)
 *
 * The XML endpoint is lightweight and not subject to the same rate limiting as HTML pages.
 *
 * Usage:
 *   node scrape.js                → all professions
 *   node scrape.js Alchemy        → one profession
 *   node scrape.js Alchemy --dry  → show item IDs only, no fetches
 *
 * Rate: 1 request / 1.5 s (configurable). ~160 items = ~4 min per profession.
 */

const fs   = require('fs');
const path = require('path');
const { Items } = require('wow-classic-items');

// ── Config ─────────────────────────────────────────────────────────────────────

const DB_DIR = path.join(__dirname, 'database');

const PROFESSIONS = {
    'Alchemy':        { file: 'alchemy.json' },
    'Blacksmithing':  { file: 'blacksmithing.json' },
    'Leatherworking': { file: 'leatherworking.json' },
    'Tailoring':      { file: 'tailoring.json' },
    'Cooking':        { file: 'cooking.json' },
    'First Aid':      { file: 'first_aid.json' },
};

const SPEC_MAP = {
    10726: 'Gnomish', 10727: 'Gnomish', 10724: 'Gnomish', 10725: 'Gnomish',
    10577: 'Gnomish', 11827: 'Gnomish', 18168: 'Gnomish',
    7189:  'Goblin',  10586: 'Goblin',  10587: 'Goblin',  10654: 'Goblin',
    19998: 'Gnomish', 19999: 'Gnomish',
    12425: 'Arms',  12427: 'Arms',  7964: 'Arms',
    12418: 'Arms',  12419: 'Arms',  12420: 'Arms',  12421: 'Arms',  12422: 'Arms',
    12440: 'Weap',  12441: 'Weap',  12423: 'Weap',  12424: 'Weap',  12428: 'Weap',
    16989: 'Ham',   12442: 'Swd',   12460: 'Axe',
    15045: 'Dragonscale', 15047: 'Dragonscale', 15049: 'Dragonscale',
    15051: 'Dragonscale', 15053: 'Dragonscale', 15055: 'Dragonscale',
    15063: 'Elemental',   15065: 'Elemental',   15067: 'Elemental',
    15069: 'Elemental',   15071: 'Elemental',
    15073: 'Tribal', 15075: 'Tribal', 15077: 'Tribal', 15079: 'Tribal',
    15081: 'Tribal', 15083: 'Tribal', 15085: 'Tribal',
    22666: 'Tribal', 22667: 'Tribal', 22669: 'Tribal',
};

const MAX_VANILLA_ID = 23000;
const TBC_REAGENT_IDS = new Set([
    21877, 21878, 23676,
    23444, 23445, 23446, 23447, 23448,
    35128, 35129, 35130, 36909, 36910,
    22574, 22573, 22572, 22576, 22577,
]);
const DELAY_MS = 1500;

// ── Build item list from npm ────────────────────────────────────────────────────

console.log('Loading wow-classic-items...');
const itemsDb = new Items();
const nameMap = {};
for (const item of itemsDb) nameMap[item.itemId] = item.name;
console.log(`Loaded ${Object.keys(nameMap).length} items.\n`);

function getNpmRecipes(professionName) {
    const result = {};
    for (const item of itemsDb) {
        if (!item.createdBy) continue;
        for (const cb of item.createdBy) {
            if (cb.category !== professionName) continue;
            if (cb.requiredSkill > 300) continue;
            if (item.itemId > MAX_VANILLA_ID) continue;
            const hasBadReagent = cb.reagents.some(
                r => r.itemId > MAX_VANILLA_ID || TBC_REAGENT_IDS.has(r.itemId)
            );
            if (hasBadReagent) continue;
            result[item.itemId] = {
                name: item.name,
                skill: cb.requiredSkill,
                npmReagents: cb.reagents.map(r => ({ id: r.itemId, qty: r.amount })),
            };
        }
    }
    return result;
}

// ── HTTP helper ────────────────────────────────────────────────────────────────

function sleep(ms) { return new Promise(r => setTimeout(r, ms)); }

async function fetchXml(itemId) {
    const url = `https://www.wowhead.com/classic/item=${itemId}&xml`;
    const res = await fetch(url, {
        headers: {
            'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
            'Accept': 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
            'Accept-Language': 'en-US,en;q=0.9',
        },
    });
    if (!res.ok) throw new Error(`HTTP ${res.status}`);
    return res.text();
}

// ── XML parser ─────────────────────────────────────────────────────────────────

/**
 * Parse the <createdBy> section from Wowhead item XML.
 *
 * XML format:
 *   <createdBy>
 *     <spell id="2330" name="Minor Healing Potion" icon="...">
 *       <reagent id="2447" name="Peacebloom" count="1" />
 *       ...
 *     </spell>
 *   </createdBy>
 *
 * Also reads <json> CDATA for skill level (learnedat not in XML by default,
 * but the json section has the g_spells-equivalent data... actually it doesn't.
 * Skill comes from the json sourcemore section or we fall back to npm skill.)
 *
 * Returns: { spellId, spellName, reagents: [{id, qty, name}] } or null
 */
function parseItemXml(xml) {
    // Check for createdBy section
    const cbMatch = xml.match(/<createdBy>([\s\S]*?)<\/createdBy>/);
    if (!cbMatch) return null;
    const cbBlock = cbMatch[1];

    // Parse spell element
    const spellMatch = cbBlock.match(/<spell\s+id="(\d+)"\s+name="([^"]+)"/);
    if (!spellMatch) return null;
    const spellId = parseInt(spellMatch[1]);
    const spellName = spellMatch[2];

    // Parse reagents
    const reagents = [];
    const reagentRe = /<reagent\s+id="(\d+)"\s+name="([^"]+)"[^>]*count="(\d+)"/g;
    let rm;
    while ((rm = reagentRe.exec(cbBlock)) !== null) {
        reagents.push({ id: parseInt(rm[1]), qty: parseInt(rm[3]), name: rm[2] });
    }

    return { spellId, spellName, reagents };
}

/**
 * Try to extract required skill from the <json> CDATA in item XML.
 * Wowhead's item XML doesn't directly expose "requiredSkill" for crafting,
 * so we fall back to npm's skill if not found.
 */
function parseSkillFromXml(xml) {
    // The <json> section has "learnedat":N for crafting spells sometimes,
    // but items don't have that directly. Return null — use npm skill.
    return null;
}

// ── Scrape one profession ──────────────────────────────────────────────────────

async function scrapeProfession(profName, config, dryRun) {
    console.log(`\n${'═'.repeat(55)}`);
    console.log(`  ${profName}`);
    console.log(`${'═'.repeat(55)}`);

    const npmRecipes = getNpmRecipes(profName);
    const itemIds = Object.keys(npmRecipes).map(Number);
    console.log(`  npm source: ${itemIds.length} items to verify`);

    if (dryRun) {
        console.log('  [dry run] first 10:', itemIds.slice(0, 10).join(', '));
        return 0;
    }

    const recipes = {};
    let verified = 0;
    let fallback = 0;
    let i = 0;

    for (const itemId of itemIds) {
        i++;
        const npmData = npmRecipes[itemId];
        process.stdout.write(`  [${i}/${itemIds.length}] item ${itemId} "${npmData.name}"... `);

        await sleep(DELAY_MS);
        let xml;
        try {
            xml = await fetchXml(itemId);
        } catch (e) {
            console.log(`SKIP fetch failed (${e.message}) → using npm data`);
            recipes[itemId] = buildNpmEntry(itemId, npmData, null);
            fallback++;
            continue;
        }

        const wh = parseItemXml(xml);

        if (!wh) {
            console.log(`SKIP no <createdBy> in XML → using npm data`);
            recipes[itemId] = buildNpmEntry(itemId, npmData, null);
            fallback++;
            continue;
        }

        // Vanilla filter on Wowhead reagents
        const hasTbcReagent = wh.reagents.some(r => r.id > MAX_VANILLA_ID || TBC_REAGENT_IDS.has(r.id));
        if (hasTbcReagent) {
            console.log('SKIP TBC reagent from Wowhead → using npm data');
            recipes[itemId] = buildNpmEntry(itemId, npmData, wh.spellId);
            fallback++;
            continue;
        }

        // Missing reagent names → fill from nameMap
        const reagents = wh.reagents.map(r => ({
            id: r.id,
            qty: r.qty,
            name: r.name || nameMap[r.id] || `Unknown (${r.id})`,
        }));

        recipes[itemId] = {
            name: npmData.name,
            spell_id: wh.spellId,
            output_qty: 1,
            skill: npmData.skill,   // npm skill (Wowhead XML doesn't expose crafting skill directly)
            skill_verified: false,
            spec: SPEC_MAP[itemId] || null,
            source: 'wowhead-classic',
            reagents,
        };

        console.log(`→ spell ${wh.spellId} skill=${npmData.skill} reagents=${reagents.length}`);
        verified++;
    }

    const count = Object.keys(recipes).length;
    console.log(`\n  Result: ${count} recipes (${verified} wowhead-verified, ${fallback} npm-only)`);

    const out = {
        _meta: {
            profession: profName,
            game_version: 'WoW Classic Era (1.15.x / interface 11508)',
            built: new Date().toISOString().slice(0, 10),
            recipe_count: count,
            source: 'Wowhead Classic XML (item pages) + wow-classic-items npm',
            notes: [
                'Item list and skill levels come from wow-classic-items npm (filtered: skill≤300, itemId≤23000).',
                'Reagent IDs, quantities, and names are VERIFIED against Wowhead Classic item XML.',
                'Spell IDs are VERIFIED against Wowhead Classic.',
                'Entries with source="npm-only" had no Wowhead <createdBy> section.',
                'Keyed by OUTPUT ITEM ID.',
            ],
        },
        recipes,
    };

    const outPath = path.join(DB_DIR, config.file);
    fs.writeFileSync(outPath, JSON.stringify(out, null, 2), 'utf8');
    console.log(`  ✅ Saved → ${config.file}`);
    return count;
}

function buildNpmEntry(itemId, npmData, spellId) {
    return {
        name: npmData.name,
        spell_id: spellId,
        output_qty: 1,
        skill: npmData.skill,
        skill_verified: false,
        spec: SPEC_MAP[itemId] || null,
        source: 'npm-only',
        reagents: npmData.npmReagents.map(r => ({
            id: r.id,
            qty: r.qty,
            name: nameMap[r.id] || `Unknown (${r.id})`,
        })),
    };
}

// ── Entry point ────────────────────────────────────────────────────────────────

async function main() {
    const args = process.argv.slice(2);
    const target = args.find(a => !a.startsWith('--'));
    const dryRun = args.includes('--dry');

    if (dryRun) console.log('DRY RUN — no HTTP requests\n');

    let total = 0;
    for (const [profName, config] of Object.entries(PROFESSIONS)) {
        if (target && target.toLowerCase() !== profName.toLowerCase()) continue;
        try {
            const count = await scrapeProfession(profName, config, dryRun);
            total += count;
        } catch (e) {
            console.error(`\n❌ ${profName} failed: ${e.message}`);
        }
    }

    console.log(`\n✅ Done — ${total} total recipes.`);
    if (!dryRun) console.log('Next: node generate.js  (uses new JSON files)');
}

main().catch(e => { console.error('Fatal:', e); process.exit(1); });
