-- ============================================================
--  ProfTooltip – Ores & Bars database
--  Source: wowhead.com/classic
--
--  Format:
--    [itemId] = { skill, name, uses = { "Profession – usage" } }
--  Ores also list what bar they smelt into.
-- ============================================================

ProfTooltip_Ores = {

    -- ── Ores ─────────────────────────────────────────────────

    [2770] = {
        skill = 1,   name = "Copper Ore",
        uses = { "Smelts into Copper Bar", "Mining (smelting skill 1)" },
    },
    [2771] = {
        skill = 65,  name = "Tin Ore",
        uses = { "Smelts into Tin Bar", "Alloyed with Copper for Bronze Bar" },
    },
    [2772] = {
        skill = 75,  name = "Iron Ore",
        uses = { "Smelts into Iron Bar", "Blacksmithing – mid-tier armor & weapons" },
    },
    [3858] = {
        skill = 100, name = "Silver Ore",
        uses = { "Smelts into Silver Bar", "Alchemy – transmutes", "Blacksmithing – jewelry" },
    },
    [3859] = {
        skill = 125, name = "Gold Ore",
        uses = { "Smelts into Gold Bar", "Alchemy – transmutes", "Engineering – Gyrochronatom" },
    },
    [7911] = {
        skill = 155, name = "Mithril Ore",
        uses = { "Smelts into Mithril Bar", "Blacksmithing – heavy armor", "Engineering – mid-tier parts" },
    },
    [10620] = {
        skill = 230, name = "Thorium Ore",
        uses = { "Smelts into Thorium Bar", "Blacksmithing – endgame gear", "Engineering – endgame parts" },
    },
    [11370] = {
        skill = 230, name = "Dark Iron Ore",
        uses = { "Smelts into Dark Iron Bar (requires Black Forge in BRD)", "Blacksmithing – Dark Iron gear" },
    },
    [19774] = {
        skill = 300, name = "Ooze Covered Thorium Vein",
        uses = { "Thorium Ore source" },
    },
    -- Gems from mining
    [818]  = { skill = 1,   name = "Malachite",     uses = { "Engineering – Copper Modulator" } },
    [1210] = { skill = 65,  name = "Tigerseye",     uses = { "Engineering – Tigerseye Band (LW)" } },
    [1529] = { skill = 65,  name = "Jade",           uses = { "Blacksmithing – Bronze Warhammer" } },
    [1206] = { skill = 100, name = "Moss Agate",     uses = { "Engineering – Standard Scope" } },
    [1705] = { skill = 125, name = "Lesser Moonstone", uses = { "Blacksmithing – jewelry" } },
    [3864] = { skill = 155, name = "Citrine",        uses = { "Blacksmithing – jewelry" } },
    [7909] = { skill = 155, name = "Aquamarine",     uses = { "Blacksmithing – jewelry", "Alchemy – transmutes" } },
    [12800] = { skill = 230, name = "Azerothian Diamond", uses = { "Blacksmithing – Plans: Ebon Shiv" } },
    [12364] = { skill = 230, name = "Arcane Crystal", uses = { "Alchemy – Transmute Arcanite (with Thorium Bar)" } },
    [12363] = { skill = 230, name = "Huge Emerald",  uses = { "Blacksmithing – Signet of the Quiet Forest" } },
    [12799] = { skill = 230, name = "Blue Sapphire", uses = { "Blacksmithing – jewelry" } },
    [12361] = { skill = 230, name = "Large Opal",    uses = { "Blacksmithing – jewelry" } },

    -- ── Bars ─────────────────────────────────────────────────

    [2840] = {
        skill = 1,   name = "Copper Bar",
        uses = {
            "Blacksmithing – beginner armor & weapons",
            "Engineering – Copper Tube, Bolts, Bombs",
            "Alchemy – (Philosopher's Stone)",
        },
    },
    [2841] = {
        skill = 65,  name = "Tin Bar",
        uses = { "Alloyed with Copper Bar to make Bronze Bar" },
    },
    [2842] = {
        skill = 65,  name = "Silver Bar",
        uses = {
            "Blacksmithing – Silver Skeleton Key",
            "Engineering – Silver Contact",
            "Alchemy – Philosopher's Stone",
        },
    },
    [2841] = {
        skill = 65,  name = "Bronze Bar",
        uses = {
            "Blacksmithing – Bronze-tier armor & weapons",
            "Engineering – Bronze Tube, Framework, Bombs",
        },
    },
    -- Note: Bronze Bar has item ID 2841 same as Tin — Bronze is crafted, ID = 2841... 
    -- Correct: Bronze Bar = 2841, Tin Bar = 2845
    [2845] = {
        skill = 65,  name = "Tin Bar",
        uses = { "Alloyed with Copper to make Bronze Bar" },
    },
    [2841] = {  -- Bronze Bar correct ID
        skill = 65,  name = "Bronze Bar",
        uses = {
            "Blacksmithing – Bronze-tier armor & weapons",
            "Engineering – Bronze Tube, Framework, Bombs",
        },
    },
    [3575] = {
        skill = 75,  name = "Iron Bar",
        uses = {
            "Blacksmithing – Iron Shield Spike, Iron armor",
            "Engineering – Iron Grenade, Iron Strut",
            "Alchemy – Philosopher's Stone",
        },
    },
    [3576] = {
        skill = 100, name = "Gold Bar",
        uses = {
            "Engineering – Gyrochronatom",
            "Alchemy – transmute material",
        },
    },
    [3577] = {
        skill = 125, name = "Steel Bar",
        uses = {
            "Blacksmithing – Steel-tier weapons & armor",
            "Engineering – Gyromatic Micro-Adjustor",
        },
    },
    [3860] = {
        skill = 155, name = "Mithril Bar",
        uses = {
            "Blacksmithing – Mithril armor & weapons, Mithril Spurs",
            "Engineering – Mithril Tube, Casing, Unstable Trigger",
        },
    },
    [6037] = {
        skill = 155, name = "Truesilver Bar",
        uses = {
            "Blacksmithing – Truesilver armor, Champion's Bracers",
            "Engineering – Truesilver Transformer",
        },
    },
    [12359] = {
        skill = 230, name = "Thorium Bar",
        uses = {
            "Blacksmithing – endgame armor, Arcanite rebar",
            "Engineering – Thorium Widget, Thorium Tube, Thorium Shells",
            "Alchemy – Transmute Arcanite (with Arcane Crystal)",
        },
    },
    [11371] = {
        skill = 230, name = "Dark Iron Bar",
        uses = {
            "Blacksmithing – Dark Iron gear (requires Thorium Brotherhood rep)",
        },
    },
    [12360] = {
        skill = 300, name = "Arcanite Bar",
        uses = {
            "Blacksmithing – Arcanite Reaper, Sulfuron Hammer components",
            "Engineering – Force Reactive Disk",
        },
    },
}
