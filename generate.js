#!/usr/bin/env node
/**
 * ProfTooltip — Lua DB generator
 * Source: wow-classic-items npm (reagents + skill verified)
 * Scope: WoW Classic Era only (skill ≤ 300)
 *
 * Usage:
 *   node generate.js              → regenerate all professions
 *   node generate.js Alchemy      → regenerate one profession
 */

const { Items } = require('wow-classic-items');
const fs = require('fs');
const path = require('path');

// ── Config ────────────────────────────────────────────────────────────────────

const OUT_DIR = path.join(__dirname, 'ProfTooltip/db');

// Profession → Lua variable name + output filename
const PROFESSIONS = {
    'Alchemy':        { luaVar: 'ProfTooltip_Alchemy',        file: 'recipes_alchemy.lua' },
    'Blacksmithing':  { luaVar: 'ProfTooltip_Blacksmithing',  file: 'recipes_blacksmithing.lua' },
    'Leatherworking': { luaVar: 'ProfTooltip_Leatherworking', file: 'recipes_leatherworking.lua' },
    'Tailoring':      { luaVar: 'ProfTooltip_Tailoring',      file: 'recipes_tailoring.lua' },
    'Cooking':        { luaVar: 'ProfTooltip_Cooking',        file: 'recipes_cooking.lua' },
    'First Aid':      { luaVar: 'ProfTooltip_FirstAid',       file: 'recipes_first_aid.lua' },
    // Engineering uses verified JSON source instead (see below)
};

// Specialization map: item ID → spec string
// Items not listed here get spec = nil
const SPEC_MAP = {
    // Engineering — Gnomish
    10726: 'Gnomish', 10727: 'Gnomish', 10724: 'Gnomish', 10725: 'Gnomish',
    10577: 'Gnomish', // Gnomish Mortar (trainer says Gnomish)
    11827: 'Gnomish', 18168: 'Gnomish', // Force Reactive Disk — actually both?
    // Engineering — Goblin
    7189:  'Goblin',  10586: 'Goblin',  10587: 'Goblin',  10654: 'Goblin',
    // Engineering — Gnomish (high-end)
    19998: 'Gnomish', 19999: 'Gnomish',
    // Blacksmithing — Armorsmith
    12425: 'Arms', 12427: 'Arms',
    7964:  'Arms', 12418: 'Arms', 12419: 'Arms', 12420: 'Arms', 12421: 'Arms', 12422: 'Arms',
    // Blacksmithing — Weaponsmith
    12440: 'Weap', 12441: 'Weap', 12423: 'Weap', 12424: 'Weap', 12428: 'Weap',
    // Blacksmithing — Hammersmith
    16989: 'Ham',
    // Blacksmithing — Swordsmith
    12442: 'Swd',
    // Blacksmithing — Axesmith
    12460: 'Axe',
    // Leatherworking — Dragonscale
    15045: 'Dragonscale', 15047: 'Dragonscale', 15049: 'Dragonscale',
    15051: 'Dragonscale', 15053: 'Dragonscale', 15055: 'Dragonscale',
    // Leatherworking — Elemental
    15063: 'Elemental', 15065: 'Elemental', 15067: 'Elemental',
    15069: 'Elemental', 15071: 'Elemental',
    // Leatherworking — Tribal
    15073: 'Tribal', 15075: 'Tribal', 15077: 'Tribal', 15079: 'Tribal',
    15081: 'Tribal', 15083: 'Tribal', 15085: 'Tribal',
    22666: 'Tribal', 22667: 'Tribal', 22669: 'Tribal',
};

// Vanilla Classic Era item ID ceiling — nothing above this exists in vanilla 1.12
// (AQ40/Naxx items peak around 22000; TBC starts ~22000+)
const MAX_VANILLA_ID = 23000;

// Explicit TBC/WotLK reagent IDs that fall below the ceiling (edge cases)
const TBC_REAGENT_IDS = new Set([
    21877, 21878,          // Netherweave Cloth, Bolt of Netherweave (TBC First Aid)
    23676,                 // Moongraze Stag Tenderloin (Blood Elf starting zone, TBC)
    // Fel Iron, Adamantite, Khorium, Cobalt, Saronite
    23444, 23445, 23446, 23447, 23448,
    35128, 35129, 35130, 36909, 36910,
    // Motes of TBC
    22574, 22573, 22572, 22576, 22577,
]);

// ── Build item name lookup ────────────────────────────────────────────────────

console.log('Loading wow-classic-items...');
const itemsDb = new Items();
const nameMap = {};
for (const item of itemsDb) {
    nameMap[item.itemId] = item.name;
}
console.log(`Loaded ${Object.keys(nameMap).length} items.`);

// ── Generator ─────────────────────────────────────────────────────────────────

function buildRecipes(professionName) {
    const recipes = {};

    for (const item of itemsDb) {
        if (!item.createdBy || item.createdBy.length === 0) continue;

        for (const cb of item.createdBy) {
            if (cb.category !== professionName) continue;
            if (cb.requiredSkill > 300) continue; // skip TBC+

            // Skip if output item or any reagent is above vanilla ID ceiling
            if (item.itemId > MAX_VANILLA_ID) continue;
            const hasTbcReagent = cb.reagents.some(r =>
                r.itemId > MAX_VANILLA_ID || TBC_REAGENT_IDS.has(r.itemId)
            );
            if (hasTbcReagent) continue;

            const spec = SPEC_MAP[item.itemId] || null;
            const reagents = cb.reagents.map(r => ({
                id: r.itemId,
                qty: r.amount,
                name: nameMap[r.itemId] || `Unknown (${r.itemId})`,
            }));

            recipes[item.itemId] = {
                name: item.name,
                skill: cb.requiredSkill,
                spec,
                components: reagents,
            };
        }
    }

    return recipes;
}

function recipesToLua(profName, luaVar, recipes) {
    const sorted = Object.entries(recipes).sort((a, b) => a[1].skill - b[1].skill);
    const lines = [];

    lines.push(`-- ${profName} recipes - Source: wow-classic-items npm`);
    lines.push(`-- WoW Classic Era (Interface 11508)`);
    lines.push('');
    lines.push(`${luaVar} = {`);
    lines.push('');

    for (const [id, r] of sorted) {
        const specStr = r.spec ? `"${r.spec}"` : 'nil';
        lines.push(`    [${id}] = { name = "${r.name}", skill = ${r.skill}, spec = ${specStr},`);
        lines.push(`        components = {`);
        for (const c of r.components) {
            const pad = ' '.repeat(Math.max(1, 7 - String(c.id).length));
            lines.push(`            { id = ${c.id},${pad}qty = ${String(c.qty).padStart(2)}, name = "${c.name}" },`);
        }
        lines.push(`        },`);
        lines.push(`    },`);
    }

    lines.push('}');
    return lines.join('\n');
}

// ── Engineering from verified JSON ────────────────────────────────────────────

function generateFromJson(jsonPath, luaVar, outputFile) {
    const json = JSON.parse(fs.readFileSync(jsonPath, 'utf8'));
    const recipes = json.recipes;
    const sorted = Object.entries(recipes).sort((a, b) => a[1].skill - b[1].skill);

    const lines = [];
    lines.push(`-- Engineering recipes - Source: Wowhead Classic (verified JSON)`);
    lines.push(`-- WoW Classic Era (Interface 11508)`);
    lines.push('');
    lines.push(`${luaVar} = {`);
    lines.push('');

    for (const [id, r] of sorted) {
        const specStr = r.spec ? `"${r.spec}"` : 'nil';
        lines.push(`    [${id}] = { name = "${r.name}", skill = ${r.skill}, spec = ${specStr},`);
        lines.push(`        components = {`);
        for (const c of r.reagents) {
            const pad = ' '.repeat(Math.max(1, 7 - String(c.id).length));
            lines.push(`            { id = ${c.id},${pad}qty = ${String(c.qty).padStart(2)}, name = "${c.name}" },`);
        }
        lines.push(`        },`);
        lines.push(`    },`);
    }

    lines.push('}');

    const outPath = path.join(OUT_DIR, outputFile);
    fs.writeFileSync(outPath, lines.join('\n'), 'utf8');
    console.log(`✅ ${outputFile} — ${sorted.length} recipes (from JSON)`);
}

// ── Main ──────────────────────────────────────────────────────────────────────

const target = process.argv[2]; // optional: filter to one profession

// Engineering from verified JSON
const engJson = path.join(__dirname, 'database/engineering.json');
if (!target || target === 'Engineering') {
    if (fs.existsSync(engJson)) {
        generateFromJson(engJson, 'ProfTooltip_Engineering', 'recipes_engineering.lua');
    } else {
        console.warn('⚠️  database/engineering.json not found, skipping Engineering');
    }
}

// All other professions from npm
for (const [profName, { luaVar, file }] of Object.entries(PROFESSIONS)) {
    if (target && target !== profName) continue;

    const recipes = buildRecipes(profName);
    const count = Object.keys(recipes).length;

    if (count === 0) {
        console.warn(`⚠️  ${profName}: 0 recipes found`);
        continue;
    }

    const lua = recipesToLua(profName, luaVar, recipes);
    const outPath = path.join(OUT_DIR, file);
    fs.writeFileSync(outPath, lua, 'utf8');
    console.log(`✅ ${file} — ${count} recipes`);
}

console.log('\nDone. Sync to WoW with: node sync.js');
