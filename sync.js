#!/usr/bin/env node
/**
 * ProfTooltip — Sync addon to WoW Classic Era installation
 * Copies ProfTooltip/ → WoW AddOns folder
 *
 * Usage: node sync.js
 */

const fs   = require('fs');
const path = require('path');

const SRC = path.join(__dirname, 'ProfTooltip');
const DST = 'C:/Program Files (x86)/World of Warcraft/_classic_era_/Interface/AddOns/ProfTooltip';

function copyDir(src, dst) {
    fs.mkdirSync(dst, { recursive: true });
    for (const entry of fs.readdirSync(src, { withFileTypes: true })) {
        const s = path.join(src, entry.name);
        const d = path.join(dst, entry.name);
        if (entry.isDirectory()) {
            copyDir(s, d);
        } else {
            fs.copyFileSync(s, d);
            console.log(`  ${entry.name}`);
        }
    }
}

if (!fs.existsSync(DST)) {
    console.error(`❌ WoW AddOns folder not found:\n   ${DST}`);
    process.exit(1);
}

console.log('Syncing ProfTooltip → WoW AddOns...');
copyDir(SRC, DST);
console.log('✅ Done. Reload WoW (/reload) or restart the game.');
