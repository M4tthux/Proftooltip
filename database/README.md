# ProfTooltip — Reference Database

This folder is the **source of truth** for ProfTooltip's profession data.
Build it once from verified sources, then use it locally — **no Wowhead / internet
fetching needed afterwards**. The addon's `ProfTooltip/db/*.lua` files should be
regenerated *from here*, not edited by hand.

One file per profession, in **JSON** (chosen because it's easy to validate, diff,
and auto-convert into the addon's `.lua` tables — you don't need to read or edit it
by hand).

## Status

| Profession | File | Status |
|---|---|---|
| Alchemy | `alchemy.json` | ✅ Built — reagents + spell IDs verified vs Wowhead Classic (108 recipes) |
| Blacksmithing | `blacksmithing.json` | ✅ Built — reagents + spell IDs verified vs Wowhead Classic (240 recipes) |
| Engineering | `engineering.json` | ✅ Built — reagents verified vs Wowhead Classic. Skill levels NOT yet verified. (164 recipes) |
| Leatherworking | `leatherworking.json` | ✅ Built — reagents + spell IDs verified vs Wowhead Classic (233 recipes) |
| Tailoring | `tailoring.json` | ✅ Built — 226/227 verified vs Wowhead Classic |
| Cooking | `cooking.json` | ✅ Built — 81/82 verified vs Wowhead Classic |
| First Aid | `first_aid.json` | ✅ Built — reagents + spell IDs verified vs Wowhead Classic (13 recipes) |
| Enchanting | `enchanting.json` | ✅ Built — reverse index (reagent → enchants), 21 reagents / 201 uses, from Wowhead Classic + warcraft.wiki.gg |

## What "verified" means here

- **Reagent IDs + quantities**: checked against Wowhead Classic (`fr.wowhead.com/classic/spell=…`).
- **`skill_verified: false`**: the required skill level was carried over from the old
  addon data and has **not** been confirmed yet — treat it as provisional.
- **`source: "addon-unverified"`**: a few recipes weren't in the verified source; their
  reagents are carried from the old addon and still need a Wowhead check.
- **Scope**: WoW Classic Era only (1.15.x / interface 11508). TBC/WotLK recipes are
  intentionally excluded.

## File format

```jsonc
{
  "_meta": { ...provenance, notes, counts... },
  "recipes": {
    "<output_item_id>": {       // keyed by the crafted item's ID
      "name": "Iron Grenade",
      "spell_id": 3962,          // crafting spell on Wowhead
      "output_qty": 2,           // how many the recipe makes
      "skill": 175,              // required skill (provisional until skill_verified)
      "skill_verified": false,
      "spec": null,              // specialization: Gnomish / Goblin / etc.
      "source": "wowhead-classic",
      "reagents": [ { "id": 3575, "qty": 1, "name": "Iron Bar" }, ... ]
    }
  }
}
```

## Known issues fixed by this reference (vs the old addon data)

- Removed **88** TBC/WotLK engineering recipes that don't exist in Classic Era.
- Corrected **36** engineering recipes with wrong reagents/quantities.
- See `../ENGINEERING_DB_REPORT.md` for the full diff.

## How to rebuild

```bash
node scrape.js          # fetch all professions from Wowhead Classic (1.5s/request, ~4min each)
node scrape.js Alchemy  # fetch one profession
node generate.js        # convert JSON → Lua for all professions
node sync.js            # copy addon to WoW installation folder
```

## Enchanting — special format

Enchanting produces no output item, so `enchanting.json` is a **reverse index** keyed
by **reagent item ID** → `{ skill, name, uses: [enchant names] }`. `generate.js` detects
this via `format: "reagent-index"` and emits the matching `ProfTooltip_Enchanting` table.
There is no `scrape.js` path for it — the source data is maintained by hand in the JSON.

## TODO

- Verify Engineering skill levels (set `skill_verified: true` once done).
