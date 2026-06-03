-- ============================================================
--  ProfTooltip – Blacksmithing recipes (vanilla/Era 1.12)
--  Source: wowhead.com/classic + warcraft.wiki.gg
--
--  spec: nil    = any blacksmith
--        "Arms" = Armorsmith
--        "Weap" = Weaponsmith
--        "Ham"  = Hammersmith (sub-spec)
--        "Axe"  = Axesmith (sub-spec)
--        "Swd"  = Swordsmith (sub-spec)
--
--  Key item IDs reference:
--    Rough Stone=2835  Coarse Stone=2836  Heavy Stone=2838
--    Solid Stone=7912  Dense Stone=12365
--    Copper Bar=2840   Silver Bar=1695    Gold Bar=3577 (*)
--    Bronze Bar=2841   Iron Bar=3575      Steel Bar=3577 (*)
--    (*) NOTE: Gold Bar and Steel Bar share ID 3577 in the DB query;
--        they are distinguished by name only in this file.
--    Mithril Bar=3860  Truesilver Bar=6037  Thorium Bar=12359
--    Arcanite Bar=12360  Dark Iron Bar=11371
--    Rough Grinding Stone=3470  Coarse Grinding Stone=3478
--    Heavy Grinding Stone=3482  Solid Grinding Stone=7966 (item)
--    Dense Grinding Stone=12644
-- ============================================================

ProfTooltip_Blacksmithing = {

    -- ══════════════════════════════════════════════════════
    --  APPRENTICE  (skill 1–75)
    -- ══════════════════════════════════════════════════════

    [2864] = {
        name = "Rough Sharpening Stone", skill = 1, spec = nil,
        components = { { id = 2835, qty = 1, name = "Rough Stone" } },
    },
    [2863] = {
        name = "Rough Weightstone", skill = 1, spec = nil,
        components = { { id = 2835, qty = 1, name = "Rough Stone" } },
    },
    [2880] = {
        name = "Weak Flux", skill = 1, spec = nil,
        components = { { id = 2835, qty = 3, name = "Rough Stone" } },
    },
    [3470] = {
        name = "Rough Grinding Stone", skill = 1, spec = nil,
        components = { { id = 2835, qty = 2, name = "Rough Stone" } },
    },
    [6218] = {
        name = "Copper Rod", skill = 1, spec = nil,
        components = { { id = 2840, qty = 1, name = "Copper Bar" } },
    },
    [2855] = {
        name = "Copper Bracers", skill = 1, spec = nil,
        components = { { id = 2840, qty = 4, name = "Copper Bar" } },
    },
    [2856] = {
        name = "Copper Chain Vest", skill = 25, spec = nil,
        components = { { id = 2840, qty = 8, name = "Copper Bar" } },
    },
    [2858] = {
        name = "Copper Chain Belt", skill = 25, spec = nil,
        components = { { id = 2840, qty = 6, name = "Copper Bar" } },
    },
    [2892] = {
        name = "Copper Mace", skill = 30, spec = nil,
        components = { { id = 2840, qty = 10, name = "Copper Bar" } },
    },
    [2893] = {
        name = "Copper Claymore", skill = 40, spec = nil,
        components = { { id = 2840, qty = 12, name = "Copper Bar" } },
    },
    [2860] = {
        name = "Copper Chain Boots", skill = 40, spec = nil,
        components = { { id = 2840, qty = 8, name = "Copper Bar" } },
    },
    [2861] = {
        name = "Copper Chain Pants", skill = 55, spec = nil,
        components = { { id = 2840, qty = 10, name = "Copper Bar" } },
    },
    [2862] = {
        name = "Copper Chain Helm", skill = 60, spec = nil,
        components = { { id = 2840, qty = 10, name = "Copper Bar" } },
    },
    [2894] = {
        name = "Copper Battle Axe", skill = 65, spec = nil,
        components = { { id = 2840, qty = 14, name = "Copper Bar" } },
    },

    -- ══════════════════════════════════════════════════════
    --  JOURNEYMAN  (skill 75–150)
    -- ══════════════════════════════════════════════════════

    [2887] = {
        name = "Coarse Sharpening Stone", skill = 75, spec = nil,
        components = { { id = 2836, qty = 1, name = "Coarse Stone" } },
    },
    [2886] = {
        name = "Coarse Weightstone", skill = 75, spec = nil,
        components = { { id = 2836, qty = 1, name = "Coarse Stone" } },
    },
    [3478] = {
        name = "Coarse Grinding Stone", skill = 75, spec = nil,
        components = { { id = 2836, qty = 2, name = "Coarse Stone" } },
    },
    [3481] = {
        name = "Rough Bronze Bracers", skill = 75, spec = nil,
        components = { { id = 2841, qty = 3, name = "Bronze Bar" } },
    },
    [2895] = {
        name = "Bronze Sword", skill = 90, spec = nil,
        components = { { id = 2841, qty = 5, name = "Bronze Bar" } },
    },
    [2874] = {
        name = "Patterned Bronze Bracers", skill = 100, spec = nil,
        components = {
            { id = 2841, qty = 6, name = "Bronze Bar" },
            { id = 2880, qty = 1, name = "Weak Flux" },
        },
    },
    [6339] = {
        name = "Silver Rod", skill = 100, spec = nil,
        components = {
            { id = 1695, qty = 6, name = "Silver Bar" },
            { id = 3470, qty = 1, name = "Rough Grinding Stone" },
        },
    },
    [3483] = {
        name = "Rough Bronze Leggings", skill = 100, spec = nil,
        components = { { id = 2841, qty = 4, name = "Bronze Bar" } },
    },
    [3484] = {
        name = "Heavy Bronze Mace", skill = 105, spec = nil,
        components = {
            { id = 2841, qty = 8, name = "Bronze Bar" },
            { id = 3470, qty = 2, name = "Rough Grinding Stone" },
        },
    },
    [3490] = {
        name = "Silvered Bronze Breastplate", skill = 115, spec = nil,
        components = {
            { id = 2841, qty = 12, name = "Bronze Bar" },
            { id = 1695, qty = 2,  name = "Silver Bar" },
        },
    },
    [3488] = {
        name = "Silvered Bronze Boots", skill = 110, spec = nil,
        components = {
            { id = 2841, qty = 10, name = "Bronze Bar" },
            { id = 1695, qty = 2,  name = "Silver Bar" },
        },
    },
    [3480] = {
        name = "Bronze Shield Spike", skill = 120, spec = nil,
        components = { { id = 2841, qty = 6, name = "Bronze Bar" } },
    },
    [3492] = {
        name = "Heavy Sharpening Stone", skill = 130, spec = nil,
        components = { { id = 2838, qty = 1, name = "Heavy Stone" } },
    },
    [3491] = {
        name = "Heavy Weightstone", skill = 130, spec = nil,
        components = { { id = 2838, qty = 1, name = "Heavy Stone" } },
    },
    [3482] = {
        name = "Heavy Grinding Stone", skill = 130, spec = nil,
        components = { { id = 2838, qty = 2, name = "Heavy Stone" } },
    },
    [3852] = {
        name = "Green Iron Helm", skill = 130, spec = nil,
        components = {
            { id = 3575, qty = 10, name = "Iron Bar" },
            { id = 3482, qty = 2,  name = "Heavy Grinding Stone" },
        },
    },
    [3853] = {
        name = "Green Iron Shoulders", skill = 135, spec = nil,
        components = {
            { id = 3575, qty = 8, name = "Iron Bar" },
            { id = 3482, qty = 2, name = "Heavy Grinding Stone" },
        },
    },
    [3854] = {
        name = "Green Iron Bracers", skill = 135, spec = nil,
        components = {
            { id = 3575, qty = 6, name = "Iron Bar" },
            { id = 3482, qty = 1, name = "Heavy Grinding Stone" },
        },
    },
    [3855] = {
        name = "Green Iron Leggings", skill = 140, spec = nil,
        components = {
            { id = 3575, qty = 10, name = "Iron Bar" },
            { id = 3482, qty = 2,  name = "Heavy Grinding Stone" },
        },
    },
    [3856] = {
        name = "Green Iron Boots", skill = 140, spec = nil,
        components = {
            { id = 3575, qty = 8, name = "Iron Bar" },
            { id = 3482, qty = 2, name = "Heavy Grinding Stone" },
        },
    },
    [6042] = {
        name = "Iron Counterweight", skill = 140, spec = nil,
        components = { { id = 3575, qty = 6, name = "Iron Bar" } },
    },
    [3486] = {
        name = "Green Iron Gauntlets", skill = 145, spec = nil,
        components = {
            { id = 3575, qty = 8, name = "Iron Bar" },
            { id = 3478, qty = 2, name = "Coarse Grinding Stone" },
        },
    },
    [5536] = {
        name = "Fiery War Axe", skill = 150, spec = nil,
        components = {
            { id = 3575, qty = 16, name = "Iron Bar" },
            { id = 7068, qty = 1,  name = "Elemental Fire" },
        },
    },
    [6340] = {
        name = "Golden Rod", skill = 150, spec = nil,
        components = {
            { id = 3577, qty = 2,  name = "Gold Bar" },
            { id = 7971, qty = 2,  name = "Iridescent Pearl" },
            { id = 3562, qty = 2,  name = "Thick Grinding Stone" },
        },
    },

    -- ══════════════════════════════════════════════════════
    --  EXPERT  (skill 150–200)
    -- ══════════════════════════════════════════════════════

    [5543] = {
        name = "Iron Shield Spike", skill = 155, spec = nil,
        components = { { id = 3575, qty = 8, name = "Iron Bar" } },
    },
    [7945] = {
        name = "Iron Buckle", skill = 155, spec = nil,
        components = { { id = 3575, qty = 3, name = "Iron Bar" } },
    },
    [7966] = {
        name = "Solid Sharpening Stone", skill = 155, spec = nil,
        components = { { id = 7912, qty = 1, name = "Solid Stone" } },
    },
    [7965] = {
        name = "Solid Weightstone", skill = 155, spec = nil,
        components = { { id = 7912, qty = 1, name = "Solid Stone" } },
    },
    [7936] = {
        name = "Iron Plate Shorts", skill = 155, spec = nil,
        components = { { id = 3575, qty = 16, name = "Iron Bar" } },
    },
    [7937] = {
        name = "Iron Plate Boots", skill = 165, spec = nil,
        components = { { id = 3575, qty = 16, name = "Iron Bar" } },
    },
    [7939] = {
        name = "Iron Plate Helm", skill = 165, spec = nil,
        components = { { id = 3575, qty = 18, name = "Iron Bar" } },
    },
    [5546] = {
        name = "Steel Plate Helm", skill = 165, spec = nil,
        components = {
            { id = 3577, qty = 16, name = "Steel Bar" },
            { id = 3575, qty = 4,  name = "Iron Bar" },
        },
    },
    [5540] = {
        name = "Hardened Iron Shortsword", skill = 165, spec = nil,
        components = {
            { id = 3575, qty = 14, name = "Iron Bar" },
            { id = 3577, qty = 6,  name = "Steel Bar" },
        },
    },
    [5542] = {
        name = "Golden Iron Destroyer", skill = 175, spec = nil,
        components = {
            { id = 3575, qty = 18, name = "Iron Bar" },
            { id = 3577, qty = 2,  name = "Gold Bar" },
        },
    },
    [10009] = {
        name = "Massive Iron Axe", skill = 160, spec = nil,
        components = { { id = 3575, qty = 20, name = "Iron Bar" } },
    },
    [9994] = {
        name = "Mithril Spurs", skill = 180, spec = nil,
        components = { { id = 3860, qty = 6, name = "Mithril Bar" } },
    },
    [11130] = {
        name = "Truesilver Rod", skill = 200, spec = nil,
        components = {
            { id = 6037,  qty = 1, name = "Truesilver Bar" },
            { id = 7910,  qty = 2, name = "Star Ruby" },
            { id = 12644, qty = 2, name = "Dense Grinding Stone" },
        },
    },
    [7957] = {
        name = "Dense Sharpening Stone", skill = 195, spec = nil,
        components = { { id = 12365, qty = 1, name = "Dense Stone" } },
    },
    [7956] = {
        name = "Dense Weightstone", skill = 195, spec = nil,
        components = { { id = 12365, qty = 1, name = "Dense Stone" } },
    },
    [12644] = {
        name = "Dense Grinding Stone", skill = 195, spec = nil,
        components = { { id = 12365, qty = 2, name = "Dense Stone" } },
    },
    [7963] = {
        name = "Mithril Scale Bracers", skill = 185, spec = nil,
        components = { { id = 3860, qty = 8, name = "Mithril Bar" } },
    },
    [7962] = {
        name = "Mithril Gauntlets", skill = 195, spec = nil,
        components = { { id = 3860, qty = 10, name = "Mithril Bar" } },
    },

    -- ══════════════════════════════════════════════════════
    --  ARTISAN – General  (skill 200–300)
    -- ══════════════════════════════════════════════════════

    [7969] = {
        name = "Mithril Belt", skill = 200, spec = nil,
        components = { { id = 3860, qty = 10, name = "Mithril Bar" } },
    },
    [7960] = {
        name = "Mithril Boots", skill = 200, spec = nil,
        components = { { id = 3860, qty = 12, name = "Mithril Bar" } },
    },
    [7959] = {
        name = "Mithril Coif", skill = 205, spec = nil,
        components = { { id = 3860, qty = 14, name = "Mithril Bar" } },
    },
    [11128] = {
        name = "Arcanite Rod", skill = 275, spec = nil,
        components = {
            { id = 12360, qty = 1,  name = "Arcanite Bar" },
            { id = 12644, qty = 4,  name = "Dense Grinding Stone" },
            { id = 11130, qty = 1,  name = "Truesilver Rod" },
        },
    },
    [12396] = {
        name = "Truesilver Breastplate", skill = 250, spec = "Arms",
        components = {
            { id = 6037,  qty = 24, name = "Truesilver Bar" },
            { id = 7076,  qty = 2,  name = "Essence of Earth" },
        },
    },
    [12414] = {
        name = "Imperial Plate Belt", skill = 265, spec = nil,
        components = { { id = 12359, qty = 20, name = "Thorium Bar" } },
    },
    [12415] = {
        name = "Imperial Plate Bracers", skill = 265, spec = nil,
        components = { { id = 12359, qty = 20, name = "Thorium Bar" } },
    },
    [12416] = {
        name = "Imperial Plate Chest", skill = 270, spec = nil,
        components = { { id = 12359, qty = 28, name = "Thorium Bar" } },
    },
    [12405] = {
        name = "Thorium Bracers", skill = 250, spec = nil,
        components = { { id = 12359, qty = 10, name = "Thorium Bar" } },
    },
    [12406] = {
        name = "Thorium Boots", skill = 250, spec = nil,
        components = { { id = 12359, qty = 16, name = "Thorium Bar" } },
    },
    [12397] = {
        name = "Thorium Gun", skill = 250, spec = nil,
        components = {
            { id = 12359, qty = 18, name = "Thorium Bar" },
            { id = 15992, qty = 4,  name = "Dense Blasting Powder" },
        },
    },
    [12409] = {
        name = "Thorium Helm", skill = 265, spec = nil,
        components = {
            { id = 12359, qty = 24, name = "Thorium Bar" },
            { id = 7076,  qty = 1,  name = "Essence of Earth" },
        },
    },
    [12410] = {
        name = "Thorium Armor", skill = 260, spec = nil,
        components = { { id = 12359, qty = 30, name = "Thorium Bar" } },
    },
    [12407] = {
        name = "Thorium Leggings", skill = 265, spec = nil,
        components = {
            { id = 12359, qty = 26, name = "Thorium Bar" },
            { id = 7077,  qty = 1,  name = "Heart of Fire" },
        },
    },
    [12408] = {
        name = "Imperial Plate Shoulders", skill = 265, spec = nil,
        components = { { id = 12359, qty = 26, name = "Thorium Bar" } },
    },
    [12411] = {
        name = "Imperial Plate Helm", skill = 265, spec = nil,
        components = { { id = 12359, qty = 28, name = "Thorium Bar" } },
    },
    [12413] = {
        name = "Thorium Shield Spike", skill = 270, spec = nil,
        components = { { id = 12359, qty = 20, name = "Thorium Bar" } },
    },

    -- ── Armorsmith ────────────────────────────────────────

    [7961] = {
        name = "Ornate Mithril Helm", skill = 250, spec = "Arms",
        components = {
            { id = 3860, qty = 18, name = "Mithril Bar" },
            { id = 6037, qty = 2,  name = "Truesilver Bar" },
        },
    },
    [12418] = {
        name = "Ornate Mithril Shoulders", skill = 255, spec = "Arms",
        components = {
            { id = 3860, qty = 20, name = "Mithril Bar" },
            { id = 6037, qty = 4,  name = "Truesilver Bar" },
        },
    },
    [12420] = {
        name = "Ornate Mithril Gloves", skill = 255, spec = "Arms",
        components = {
            { id = 3860, qty = 20, name = "Mithril Bar" },
            { id = 6037, qty = 4,  name = "Truesilver Bar" },
        },
    },
    [12421] = {
        name = "Ornate Mithril Boots", skill = 260, spec = "Arms",
        components = {
            { id = 3860, qty = 22, name = "Mithril Bar" },
            { id = 6037, qty = 5,  name = "Truesilver Bar" },
        },
    },
    [12419] = {
        name = "Ornate Mithril Pants", skill = 265, spec = "Arms",
        components = {
            { id = 3860, qty = 24, name = "Mithril Bar" },
            { id = 6037, qty = 6,  name = "Truesilver Bar" },
        },
    },
    [12422] = {
        name = "Ornate Mithril Breastplate", skill = 275, spec = "Arms",
        components = {
            { id = 3860, qty = 28, name = "Mithril Bar" },
            { id = 6037, qty = 8,  name = "Truesilver Bar" },
            { id = 7971, qty = 2,  name = "Iridescent Pearl" },
        },
    },
    [12425] = {
        name = "Stronghold Gauntlets", skill = 280, spec = "Arms",
        components = {
            { id = 12359, qty = 24, name = "Thorium Bar" },
            { id = 7076,  qty = 2,  name = "Heart of Fire" },
            { id = 7080,  qty = 2,  name = "Elemental Water" },
        },
    },
    [12427] = {
        name = "Invulnerable Mail", skill = 300, spec = "Arms",
        components = {
            { id = 12360, qty = 6,  name = "Arcanite Bar" },
            { id = 12359, qty = 30, name = "Thorium Bar" },
            { id = 7082,  qty = 4,  name = "Essence of Air" },
        },
    },

    -- ── Weaponsmith ───────────────────────────────────────

    [12423] = {
        name = "Moonsteel Broadsword", skill = 225, spec = "Weap",
        components = {
            { id = 3860,  qty = 12, name = "Mithril Bar" },
            { id = 1529,  qty = 2,  name = "Jade" },
            { id = 3864,  qty = 2,  name = "Citrine" },
        },
    },
    [12424] = {
        name = "Phantom Blade", skill = 230, spec = "Weap",
        components = {
            { id = 3860,  qty = 12, name = "Mithril Bar" },
            { id = 6037,  qty = 4,  name = "Truesilver Bar" },
            { id = 1529,  qty = 2,  name = "Jade" },
        },
    },
    [12428] = {
        name = "Ebon Shiv", skill = 235, spec = "Weap",
        components = {
            { id = 3860,  qty = 12, name = "Mithril Bar" },
            { id = 5498,  qty = 2,  name = "Shadow Gem" },
        },
    },
    [12440] = {
        name = "Truesilver Champion", skill = 265, spec = "Weap",
        components = {
            { id = 6037,  qty = 12, name = "Truesilver Bar" },
            { id = 3860,  qty = 6,  name = "Mithril Bar" },
            { id = 7910,  qty = 2,  name = "Star Ruby" },
        },
    },
    [12441] = {
        name = "Runic Hammer", skill = 265, spec = "Weap",
        components = {
            { id = 12359, qty = 30, name = "Thorium Bar" },
            { id = 12360, qty = 2,  name = "Arcanite Bar" },
        },
    },

    -- ── Hammersmith ───────────────────────────────────────

    [16989] = {
        name = "Sulfuron Hammer", skill = 300, spec = "Ham",
        components = {
            { id = 17010, qty = 8,  name = "Sulfuron Ingot" },
            { id = 12360, qty = 10, name = "Arcanite Bar" },
            { id = 18372, qty = 25, name = "Core Leather" },
            { id = 18371, qty = 10, name = "Fiery Core" },
            { id = 18370, qty = 10, name = "Lava Core" },
        },
    },

    -- ── Swordsmith ────────────────────────────────────────

    [12442] = {
        name = "Arcanite Reaper", skill = 300, spec = "Swd",
        components = {
            { id = 12360, qty = 8,  name = "Arcanite Bar" },
            { id = 7082,  qty = 2,  name = "Essence of Air" },
        },
    },

    -- ── Axesmith ──────────────────────────────────────────

    [12460] = {
        name = "Dawn's Edge", skill = 300, spec = "Axe",
        components = {
            { id = 12360, qty = 8,  name = "Arcanite Bar" },
            { id = 7079,  qty = 2,  name = "Essence of Earth" },
        },
    },

    -- ── Dark Iron (notable drop / world-boss recipes) ─────

    [11605] = {
        name = "Dark Iron Bracers", skill = 230, spec = nil,
        components = { { id = 11371, qty = 12, name = "Dark Iron Bar" } },
    },
    [11606] = {
        name = "Dark Iron Boots", skill = 235, spec = nil,
        components = { { id = 11371, qty = 20, name = "Dark Iron Bar" } },
    },
    [17047] = {
        name = "Dark Iron Gauntlets", skill = 275, spec = nil,
        components = { { id = 11371, qty = 24, name = "Dark Iron Bar" } },
    },
    [17046] = {
        name = "Dark Iron Leggings", skill = 280, spec = nil,
        components = { { id = 11371, qty = 36, name = "Dark Iron Bar" } },
    },
    [17051] = {
        name = "Dark Iron Helm", skill = 280, spec = nil,
        components = {
            { id = 11371, qty = 40, name = "Dark Iron Bar" },
            { id = 11382, qty = 4,  name = "Black Diamond" },
        },
    },
    [17052] = {
        name = "Dark Iron Reaver", skill = 280, spec = nil,
        components = {
            { id = 11371, qty = 30, name = "Dark Iron Bar" },
            { id = 12360, qty = 2,  name = "Arcanite Bar" },
        },
    },
    [17049] = {
        name = "Dark Iron Plate", skill = 300, spec = nil,
        components = { { id = 11371, qty = 50, name = "Dark Iron Bar" } },
    },
}
