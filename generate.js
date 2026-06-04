#!/usr/bin/env node
/**
 * ProfTooltip — Lua DB generator
 * Source: database/*.json (Wowhead-verified via scrape.js)
 * Scope: WoW Classic Era only (skill ≤ 300)
 *
 * Usage:
 *   node generate.js              → regenerate all professions
 *   node generate.js Alchemy      → regenerate one profession
 */

const fs = require('fs');
const path = require('path');

// ── Config ────────────────────────────────────────────────────────────────────

const OUT_DIR  = path.join(__dirname, 'ProfTooltip/db');
const DB_DIR   = path.join(__dirname, 'database');

const PROFESSIONS = {
    'Alchemy':        { json: 'alchemy.json',        luaVar: 'ProfTooltip_Alchemy',        file: 'recipes_alchemy.lua' },
    'Blacksmithing':  { json: 'blacksmithing.json',  luaVar: 'ProfTooltip_Blacksmithing',  file: 'recipes_blacksmithing.lua' },
    'Engineering':    { json: 'engineering.json',    luaVar: 'ProfTooltip_Engineering',    file: 'recipes_engineering.lua' },
    'Leatherworking': { json: 'leatherworking.json', luaVar: 'ProfTooltip_Leatherworking', file: 'recipes_leatherworking.lua' },
    'Tailoring':      { json: 'tailoring.json',      luaVar: 'ProfTooltip_Tailoring',      file: 'recipes_tailoring.lua' },
    'Cooking':        { json: 'cooking.json',        luaVar: 'ProfTooltip_Cooking',        file: 'recipes_cooking.lua' },
    'First Aid':      { json: 'first_aid.json',      luaVar: 'ProfTooltip_FirstAid',       file: 'recipes_first_aid.lua' },
    'Enchanting':     { json: 'enchanting.json',     luaVar: 'ProfTooltip_Enchanting',     file: 'recipes_enchanting.lua', format: 'reagent-index' },
};

// ── Generator ─────────────────────────────────────────────────────────────────

function generateFromJson(profName, luaVar, jsonPath, outputFile) {
    if (!fs.existsSync(jsonPath)) {
        console.warn(`⚠️  ${profName}: ${path.basename(jsonPath)} not found — run: node scrape.js ${profName}`);
        return 0;
    }

    const json = JSON.parse(fs.readFileSync(jsonPath, 'utf8'));
    const recipes = json.recipes;
    const sorted = Object.entries(recipes).sort((a, b) => (a[1].skill ?? 0) - (b[1].skill ?? 0));

    const source = json._meta?.source || 'database JSON';
    const lines = [];
    lines.push(`-- ${profName} recipes — Source: ${source}`);
    lines.push(`-- WoW Classic Era (Interface 11508)`);
    lines.push('');
    lines.push(`${luaVar} = {`);
    lines.push('');

    for (const [id, r] of sorted) {
        const specStr = r.spec ? `"${r.spec}"` : 'nil';
        const reagents = r.reagents || r.components || [];
        lines.push(`    [${id}] = { name = "${r.name}", skill = ${r.skill ?? 0}, spec = ${specStr},`);
        lines.push(`        components = {`);
        for (const c of reagents) {
            const pad = ' '.repeat(Math.max(1, 7 - String(c.id).length));
            lines.push(`            { id = ${c.id},${pad}qty = ${String(c.qty).padStart(2)}, name = "${c.name}" },`);
        }
        lines.push(`        },`);
        lines.push(`    },`);
    }

    lines.push('}');

    const outPath = path.join(OUT_DIR, outputFile);
    fs.writeFileSync(outPath, lines.join('\n'), 'utf8');
    console.log(`✅ ${outputFile} — ${sorted.length} recipes`);
    return sorted.length;
}

// ── Enchanting generator (reagent-index format) ─────────────────────────────────
// Enchanting has no output items, so its DB is keyed by REAGENT ID → { skill, name,
// uses }. We emit ProfTooltip_Enchanting in that same shape, sorted by skill tier.

function generateEnchanting(profName, luaVar, jsonPath, outputFile) {
    if (!fs.existsSync(jsonPath)) {
        console.warn(`⚠️  ${profName}: ${path.basename(jsonPath)} not found`);
        return 0;
    }

    const json = JSON.parse(fs.readFileSync(jsonPath, 'utf8'));
    const reagents = json.reagents || {};
    const sorted = Object.entries(reagents).sort((a, b) => (a[1].skill ?? 0) - (b[1].skill ?? 0));

    const source = json._meta?.source || 'database JSON';
    const lines = [];
    lines.push(`-- ${profName} reagents — Source: ${source}`);
    lines.push(`-- WoW Classic Era (Interface 11508)`);
    lines.push(`-- Format: reagent item ID → { skill, name, uses = { list of enchants } }`);
    lines.push('');
    lines.push(`${luaVar} = {`);
    lines.push('');

    for (const [id, r] of sorted) {
        lines.push(`    [${id}] = { skill = ${r.skill ?? 0}, name = "${r.name}",`);
        lines.push(`        uses = {`);
        for (const u of (r.uses || [])) {
            lines.push(`            "${u}",`);
        }
        lines.push(`        },`);
        lines.push(`    },`);
    }

    lines.push('}');

    const outPath = path.join(OUT_DIR, outputFile);
    fs.writeFileSync(outPath, lines.join('\n'), 'utf8');
    console.log(`✅ ${outputFile} — ${sorted.length} reagents`);
    return sorted.length;
}

// ── Main ──────────────────────────────────────────────────────────────────────

const target = process.argv[2];

let total = 0;
for (const [profName, { json, luaVar, file, format }] of Object.entries(PROFESSIONS)) {
    if (target && target !== profName) continue;
    const jsonPath = path.join(DB_DIR, json);
    total += format === 'reagent-index'
        ? generateEnchanting(profName, luaVar, jsonPath, file)
        : generateFromJson(profName, luaVar, jsonPath, file);
}

console.log(`\nDone (${total} total recipes). Sync to WoW with: node sync.js`);
