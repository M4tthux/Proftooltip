-- ============================================================
--  ProfTooltip – Leatherworking recipes (vanilla/Era)
--  Source: wowhead.com/classic + warcraft.wiki.gg
--  WoW Classic Era 1.12.1 (Interface 11508)
--
--  spec: nil           = any leatherworker (General)
--        "Dragonscale" = Dragonscale specialization
--        "Elemental"   = Elemental specialization
--        "Tribal"      = Tribal specialization
--
--  Key = item ID of the crafted item (NOT the recipe/pattern ID)
-- ============================================================

ProfTooltip_Leatherworking = {

    -- ══════════════════════════════════════════════════════
    --  ARMOR KITS  (any level — trainer)
    -- ══════════════════════════════════════════════════════

    [2304] = { name = "Light Armor Kit", skill = 1, spec = nil,
        components = {
            { id = 2318, qty = 1, name = "Light Leather" },
        },
    },
    [2302] = { name = "Medium Armor Kit", skill = 75, spec = nil,
        components = {
            { id = 2319, qty = 4, name = "Medium Leather" },
        },
    },
    [4234] = { name = "Heavy Armor Kit", skill = 125, spec = nil,
        components = {
            { id = 4304, qty = 5, name = "Heavy Leather" },
        },
    },
    [8406] = { name = "Thick Armor Kit", skill = 175, spec = nil,
        components = {
            { id = 7288, qty = 5, name = "Thick Leather" },
        },
    },
    [15564] = { name = "Rugged Armor Kit", skill = 225, spec = nil,
        components = {
            { id = 8172, qty = 5, name = "Rugged Leather" },
        },
    },

    -- ══════════════════════════════════════════════════════
    --  LEATHER CONVERSION  (trainer)
    -- ══════════════════════════════════════════════════════

    [2319] = { name = "Medium Leather", skill = 50, spec = nil,
        components = {
            { id = 2318, qty = 4, name = "Light Leather" },
        },
    },
    [4304] = { name = "Heavy Leather", skill = 100, spec = nil,
        components = {
            { id = 2319, qty = 5, name = "Medium Leather" },
        },
    },
    [7288] = { name = "Thick Leather", skill = 150, spec = nil,
        components = {
            { id = 4304, qty = 6, name = "Heavy Leather" },
        },
    },
    [8172] = { name = "Rugged Leather", skill = 200, spec = nil,
        components = {
            { id = 7288, qty = 6, name = "Thick Leather" },
        },
    },

    -- ══════════════════════════════════════════════════════
    --  HIDE CURING  (trainer)
    -- ══════════════════════════════════════════════════════

    [4240] = { name = "Cured Light Hide", skill = 1, spec = nil,
        components = {
            { id = 783,  qty = 1, name = "Light Hide" },
            { id = 2321, qty = 1, name = "Salt" },
        },
    },
    [4241] = { name = "Cured Medium Hide", skill = 50, spec = nil,
        components = {
            { id = 4232, qty = 1, name = "Medium Hide" },
            { id = 2321, qty = 1, name = "Salt" },
        },
    },
    [4242] = { name = "Cured Heavy Hide", skill = 100, spec = nil,
        components = {
            { id = 4233, qty = 1, name = "Heavy Hide" },
            { id = 2321, qty = 2, name = "Salt" },
        },
    },
    [7287] = { name = "Cured Thick Hide", skill = 150, spec = nil,
        components = {
            { id = 4235, qty = 1, name = "Thick Hide" },
            { id = 2321, qty = 3, name = "Salt" },
        },
    },
    [8170] = { name = "Cured Rugged Hide", skill = 200, spec = nil,
        components = {
            { id = 8169, qty = 1, name = "Rugged Hide" },
            { id = 2321, qty = 3, name = "Salt" },
        },
    },

    -- ══════════════════════════════════════════════════════
    --  APPRENTICE  (skill 1–75)
    -- ══════════════════════════════════════════════════════

    [4231] = { name = "Handstitched Leather Belt", skill = 1, spec = nil,
        components = {
            { id = 2318, qty = 4, name = "Light Leather" },
        },
    },
    [4229] = { name = "Handstitched Leather Bracers", skill = 1, spec = nil,
        components = {
            { id = 2318, qty = 4, name = "Light Leather" },
        },
    },
    [4228] = { name = "Handstitched Leather Cloak", skill = 1, spec = nil,
        components = {
            { id = 2318, qty = 5, name = "Light Leather" },
        },
    },
    [4226] = { name = "Handstitched Leather Boots", skill = 1, spec = nil,
        components = {
            { id = 2318, qty = 6, name = "Light Leather" },
        },
    },
    [4225] = { name = "Handstitched Leather Gloves", skill = 1, spec = nil,
        components = {
            { id = 2318, qty = 5, name = "Light Leather" },
        },
    },
    [4227] = { name = "Handstitched Leather Pants", skill = 1, spec = nil,
        components = {
            { id = 2318, qty = 8, name = "Light Leather" },
        },
    },
    [4224] = { name = "Handstitched Leather Vest", skill = 1, spec = nil,
        components = {
            { id = 2318, qty = 8, name = "Light Leather" },
        },
    },
    [4223] = { name = "Handstitched Leather Headband", skill = 1, spec = nil,
        components = {
            { id = 2318, qty = 6, name = "Light Leather" },
        },
    },
    [4222] = { name = "Handstitched Leather Shoulderpads", skill = 1, spec = nil,
        components = {
            { id = 2318, qty = 6, name = "Light Leather" },
        },
    },
    -- Embossed set (skill 20)
    [4258] = { name = "Embossed Leather Belt", skill = 20, spec = nil,
        components = {
            { id = 2318, qty = 3,  name = "Light Leather" },
            { id = 4240, qty = 1,  name = "Cured Light Hide" },
        },
    },
    [4253] = { name = "Embossed Leather Bracers", skill = 20, spec = nil,
        components = {
            { id = 2318, qty = 3,  name = "Light Leather" },
            { id = 4240, qty = 1,  name = "Cured Light Hide" },
        },
    },
    [4254] = { name = "Embossed Leather Cloak", skill = 20, spec = nil,
        components = {
            { id = 2318, qty = 4,  name = "Light Leather" },
            { id = 4240, qty = 1,  name = "Cured Light Hide" },
        },
    },
    [4255] = { name = "Embossed Leather Gloves", skill = 20, spec = nil,
        components = {
            { id = 2318, qty = 4,  name = "Light Leather" },
            { id = 4240, qty = 1,  name = "Cured Light Hide" },
        },
    },
    [4256] = { name = "Embossed Leather Boots", skill = 20, spec = nil,
        components = {
            { id = 2318, qty = 6,  name = "Light Leather" },
            { id = 4240, qty = 1,  name = "Cured Light Hide" },
        },
    },
    [4257] = { name = "Embossed Leather Pants", skill = 20, spec = nil,
        components = {
            { id = 2318, qty = 6,  name = "Light Leather" },
            { id = 4240, qty = 1,  name = "Cured Light Hide" },
        },
    },
    [4259] = { name = "Embossed Leather Vest", skill = 20, spec = nil,
        components = {
            { id = 2318, qty = 6,  name = "Light Leather" },
            { id = 4240, qty = 1,  name = "Cured Light Hide" },
        },
    },
    [4260] = { name = "Embossed Leather Headband", skill = 20, spec = nil,
        components = {
            { id = 2318, qty = 5,  name = "Light Leather" },
            { id = 4240, qty = 1,  name = "Cured Light Hide" },
        },
    },
    [4261] = { name = "Embossed Leather Shoulderpads", skill = 20, spec = nil,
        components = {
            { id = 2318, qty = 5,  name = "Light Leather" },
            { id = 4240, qty = 1,  name = "Cured Light Hide" },
        },
    },
    -- Fine Leather set (skill 40–45)
    [4262] = { name = "Fine Leather Belt", skill = 40, spec = nil,
        components = {
            { id = 2318, qty = 4,  name = "Light Leather" },
            { id = 2320, qty = 2,  name = "Coarse Thread" },
        },
    },
    [4263] = { name = "Fine Leather Bracers", skill = 40, spec = nil,
        components = {
            { id = 2318, qty = 4,  name = "Light Leather" },
            { id = 2320, qty = 2,  name = "Coarse Thread" },
        },
    },
    [4264] = { name = "Fine Leather Cloak", skill = 40, spec = nil,
        components = {
            { id = 2318, qty = 5,  name = "Light Leather" },
            { id = 2320, qty = 2,  name = "Coarse Thread" },
        },
    },
    [4265] = { name = "Fine Leather Gloves", skill = 40, spec = nil,
        components = {
            { id = 2318, qty = 5,  name = "Light Leather" },
            { id = 2320, qty = 2,  name = "Coarse Thread" },
        },
    },
    [4266] = { name = "Fine Leather Boots", skill = 45, spec = nil,
        components = {
            { id = 2318, qty = 6,  name = "Light Leather" },
            { id = 2320, qty = 2,  name = "Coarse Thread" },
        },
    },
    [4267] = { name = "Fine Leather Pants", skill = 45, spec = nil,
        components = {
            { id = 2318, qty = 8,  name = "Light Leather" },
            { id = 2320, qty = 2,  name = "Coarse Thread" },
        },
    },
    [4268] = { name = "Fine Leather Vest", skill = 45, spec = nil,
        components = {
            { id = 2318, qty = 10, name = "Light Leather" },
            { id = 2320, qty = 2,  name = "Coarse Thread" },
        },
    },
    [4269] = { name = "Fine Leather Headband", skill = 45, spec = nil,
        components = {
            { id = 2318, qty = 6,  name = "Light Leather" },
            { id = 2320, qty = 2,  name = "Coarse Thread" },
        },
    },
    [4270] = { name = "Fine Leather Shoulderpads", skill = 45, spec = nil,
        components = {
            { id = 2318, qty = 6,  name = "Light Leather" },
            { id = 2320, qty = 2,  name = "Coarse Thread" },
        },
    },

    -- ══════════════════════════════════════════════════════
    --  JOURNEYMAN  (skill 75–150)
    -- ══════════════════════════════════════════════════════

    -- Dark Leather set (skill 100–120) — trainer
    [4284] = { name = "Dark Leather Belt", skill = 100, spec = nil,
        components = {
            { id = 2319, qty = 3,  name = "Medium Leather" },
            { id = 4241, qty = 1,  name = "Cured Medium Hide" },
            { id = 4470, qty = 1,  name = "Fine Thread" },
        },
    },
    [4285] = { name = "Dark Leather Bracers", skill = 100, spec = nil,
        components = {
            { id = 2319, qty = 3,  name = "Medium Leather" },
            { id = 4241, qty = 1,  name = "Cured Medium Hide" },
            { id = 4470, qty = 1,  name = "Fine Thread" },
        },
    },
    [4286] = { name = "Dark Leather Cloak", skill = 100, spec = nil,
        components = {
            { id = 2319, qty = 4,  name = "Medium Leather" },
            { id = 4241, qty = 1,  name = "Cured Medium Hide" },
            { id = 4470, qty = 1,  name = "Fine Thread" },
        },
    },
    [4287] = { name = "Dark Leather Gloves", skill = 100, spec = nil,
        components = {
            { id = 2319, qty = 4,  name = "Medium Leather" },
            { id = 4241, qty = 1,  name = "Cured Medium Hide" },
            { id = 4470, qty = 1,  name = "Fine Thread" },
        },
    },
    [4288] = { name = "Dark Leather Boots", skill = 100, spec = nil,
        components = {
            { id = 2319, qty = 5,  name = "Medium Leather" },
            { id = 4241, qty = 1,  name = "Cured Medium Hide" },
            { id = 4470, qty = 1,  name = "Fine Thread" },
        },
    },
    [4289] = { name = "Dark Leather Pants", skill = 100, spec = nil,
        components = {
            { id = 2319, qty = 6,  name = "Medium Leather" },
            { id = 4241, qty = 1,  name = "Cured Medium Hide" },
            { id = 4470, qty = 1,  name = "Fine Thread" },
        },
    },
    [4291] = { name = "Dark Leather Vest", skill = 100, spec = nil,
        components = {
            { id = 2319, qty = 8,  name = "Medium Leather" },
            { id = 4241, qty = 1,  name = "Cured Medium Hide" },
            { id = 4470, qty = 1,  name = "Fine Thread" },
        },
    },
    [4290] = { name = "Dark Leather Headband", skill = 100, spec = nil,
        components = {
            { id = 2319, qty = 5,  name = "Medium Leather" },
            { id = 4241, qty = 1,  name = "Cured Medium Hide" },
            { id = 4470, qty = 1,  name = "Fine Thread" },
        },
    },
    [4292] = { name = "Dark Leather Shoulderpads", skill = 100, spec = nil,
        components = {
            { id = 2319, qty = 5,  name = "Medium Leather" },
            { id = 4241, qty = 1,  name = "Cured Medium Hide" },
            { id = 4470, qty = 1,  name = "Fine Thread" },
        },
    },
    [4293] = { name = "Toughened Leather Gloves", skill = 100, spec = nil,
        components = {
            { id = 2319, qty = 10, name = "Medium Leather" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    -- Barbaric / Guardian set (skill 105–130) — trainer
    [5088] = { name = "Barbaric Leggings", skill = 105, spec = nil,
        components = {
            { id = 2319, qty = 12, name = "Medium Leather" },
            { id = 4241, qty = 2,  name = "Cured Medium Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [5089] = { name = "Guardian Cloak", skill = 110, spec = nil,
        components = {
            { id = 2319, qty = 14, name = "Medium Leather" },
            { id = 4241, qty = 1,  name = "Cured Medium Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [5090] = { name = "Barbaric Belt", skill = 110, spec = nil,
        components = {
            { id = 2319, qty = 10, name = "Medium Leather" },
            { id = 4241, qty = 2,  name = "Cured Medium Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [5091] = { name = "Barbaric Bracers", skill = 110, spec = nil,
        components = {
            { id = 2319, qty = 8,  name = "Medium Leather" },
            { id = 4241, qty = 1,  name = "Cured Medium Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [5092] = { name = "Guardian Leather Bracers", skill = 115, spec = nil,
        components = {
            { id = 2319, qty = 8,  name = "Medium Leather" },
            { id = 4241, qty = 2,  name = "Cured Medium Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [5093] = { name = "Barbaric Shoulder Pads", skill = 115, spec = nil,
        components = {
            { id = 2319, qty = 10, name = "Medium Leather" },
            { id = 4241, qty = 2,  name = "Cured Medium Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [5094] = { name = "Barbaric Gloves", skill = 115, spec = nil,
        components = {
            { id = 2319, qty = 8,  name = "Medium Leather" },
            { id = 4241, qty = 2,  name = "Cured Medium Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [5095] = { name = "Barbaric Boots", skill = 120, spec = nil,
        components = {
            { id = 2319, qty = 10, name = "Medium Leather" },
            { id = 4241, qty = 2,  name = "Cured Medium Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [5096] = { name = "Barbaric Harness", skill = 120, spec = nil,
        components = {
            { id = 2319, qty = 14, name = "Medium Leather" },
            { id = 4241, qty = 2,  name = "Cured Medium Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [5097] = { name = "Barbaric Helm", skill = 120, spec = nil,
        components = {
            { id = 2319, qty = 12, name = "Medium Leather" },
            { id = 4241, qty = 2,  name = "Cured Medium Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [5098] = { name = "Guardian Pants", skill = 125, spec = nil,
        components = {
            { id = 2319, qty = 12, name = "Medium Leather" },
            { id = 4241, qty = 2,  name = "Cured Medium Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [5099] = { name = "Guardian Helm", skill = 125, spec = nil,
        components = {
            { id = 2319, qty = 12, name = "Medium Leather" },
            { id = 4241, qty = 2,  name = "Cured Medium Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [5100] = { name = "Guardian Belt", skill = 125, spec = nil,
        components = {
            { id = 2319, qty = 10, name = "Medium Leather" },
            { id = 4241, qty = 2,  name = "Cured Medium Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [5101] = { name = "Guardian Gloves", skill = 125, spec = nil,
        components = {
            { id = 2319, qty = 10, name = "Medium Leather" },
            { id = 4241, qty = 2,  name = "Cured Medium Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [5102] = { name = "Guardian Boots", skill = 125, spec = nil,
        components = {
            { id = 2319, qty = 10, name = "Medium Leather" },
            { id = 4241, qty = 2,  name = "Cured Medium Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [5103] = { name = "Guardian Shoulder Pads", skill = 125, spec = nil,
        components = {
            { id = 2319, qty = 10, name = "Medium Leather" },
            { id = 4241, qty = 2,  name = "Cured Medium Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [5104] = { name = "Guardian Vest", skill = 130, spec = nil,
        components = {
            { id = 2319, qty = 14, name = "Medium Leather" },
            { id = 4241, qty = 2,  name = "Cured Medium Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },

    -- ══════════════════════════════════════════════════════
    --  EXPERT  (skill 150–225)
    -- ══════════════════════════════════════════════════════

    -- Hillman's set (trainer)
    [7289] = { name = "Hillman's Cloak", skill = 150, spec = nil,
        components = {
            { id = 4304, qty = 8,  name = "Heavy Leather" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [7290] = { name = "Hillman's Belt", skill = 150, spec = nil,
        components = {
            { id = 4304, qty = 6,  name = "Heavy Leather" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [7291] = { name = "Hillman's Bracers", skill = 150, spec = nil,
        components = {
            { id = 4304, qty = 6,  name = "Heavy Leather" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [7292] = { name = "Hillman's Leather Vest", skill = 155, spec = nil,
        components = {
            { id = 4304, qty = 12, name = "Heavy Leather" },
            { id = 4242, qty = 2,  name = "Cured Heavy Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [7293] = { name = "Hillman's Leather Gloves", skill = 155, spec = nil,
        components = {
            { id = 4304, qty = 8,  name = "Heavy Leather" },
            { id = 4242, qty = 1,  name = "Cured Heavy Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [7294] = { name = "Hillman's Shoulders", skill = 155, spec = nil,
        components = {
            { id = 4304, qty = 10, name = "Heavy Leather" },
            { id = 4242, qty = 1,  name = "Cured Heavy Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [7295] = { name = "Hillman's Leather Pants", skill = 160, spec = nil,
        components = {
            { id = 4304, qty = 14, name = "Heavy Leather" },
            { id = 4242, qty = 2,  name = "Cured Heavy Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [7296] = { name = "Hillman's Leather Headband", skill = 160, spec = nil,
        components = {
            { id = 4304, qty = 10, name = "Heavy Leather" },
            { id = 4242, qty = 2,  name = "Cured Heavy Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [7297] = { name = "Hillman's Leather Boots", skill = 160, spec = nil,
        components = {
            { id = 4304, qty = 10, name = "Heavy Leather" },
            { id = 4242, qty = 2,  name = "Cured Heavy Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    -- Murloc Scale / Green sets (trainer + drops)
    [7298] = { name = "Murloc Scale Belt", skill = 165, spec = nil,
        components = {
            { id = 7286, qty = 8,  name = "Murloc Scale" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [7299] = { name = "Murloc Scale Breastplate", skill = 165, spec = nil,
        components = {
            { id = 7286, qty = 20, name = "Murloc Scale" },
            { id = 4304, qty = 4,  name = "Heavy Leather" },
            { id = 4470, qty = 3,  name = "Fine Thread" },
        },
    },
    [7300] = { name = "Thick Murloc Armor", skill = 165, spec = nil,
        components = {
            { id = 7286, qty = 28, name = "Murloc Scale" },
            { id = 4304, qty = 4,  name = "Heavy Leather" },
            { id = 4470, qty = 3,  name = "Fine Thread" },
        },
    },
    [7301] = { name = "Murloc Scale Pants", skill = 170, spec = nil,
        components = {
            { id = 7286, qty = 16, name = "Murloc Scale" },
            { id = 4304, qty = 4,  name = "Heavy Leather" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [7374] = { name = "Green Whelp Bracers", skill = 180, spec = nil,
        components = {
            { id = 4304, qty = 10, name = "Heavy Leather" },
            { id = 7392, qty = 4,  name = "Vibrant Plume" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [7375] = { name = "Dusky Leather Armor", skill = 180, spec = nil,
        components = {
            { id = 4304, qty = 16, name = "Heavy Leather" },
            { id = 4242, qty = 2,  name = "Cured Heavy Hide" },
            { id = 4470, qty = 3,  name = "Fine Thread" },
        },
    },
    [7376] = { name = "Green Whelp Armor", skill = 185, spec = nil,
        components = {
            { id = 4304, qty = 16, name = "Heavy Leather" },
            { id = 7392, qty = 8,  name = "Vibrant Plume" },
            { id = 4470, qty = 3,  name = "Fine Thread" },
        },
    },
    [7377] = { name = "Dusky Leather Pants", skill = 185, spec = nil,
        components = {
            { id = 4304, qty = 16, name = "Heavy Leather" },
            { id = 4242, qty = 2,  name = "Cured Heavy Hide" },
            { id = 4470, qty = 3,  name = "Fine Thread" },
        },
    },
    [7378] = { name = "Dusky Leather Headband", skill = 185, spec = nil,
        components = {
            { id = 4304, qty = 12, name = "Heavy Leather" },
            { id = 4242, qty = 2,  name = "Cured Heavy Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [7379] = { name = "Green Leather Bracers", skill = 185, spec = nil,
        components = {
            { id = 4304, qty = 10, name = "Heavy Leather" },
            { id = 7392, qty = 4,  name = "Vibrant Plume" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [7380] = { name = "Dusky Leather Boots", skill = 190, spec = nil,
        components = {
            { id = 4304, qty = 12, name = "Heavy Leather" },
            { id = 4242, qty = 2,  name = "Cured Heavy Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [7381] = { name = "Dusky Leather Shoulders", skill = 190, spec = nil,
        components = {
            { id = 4304, qty = 12, name = "Heavy Leather" },
            { id = 4242, qty = 2,  name = "Cured Heavy Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [7382] = { name = "Green Leather Armor", skill = 190, spec = nil,
        components = {
            { id = 4304, qty = 16, name = "Heavy Leather" },
            { id = 7392, qty = 8,  name = "Vibrant Plume" },
            { id = 4470, qty = 3,  name = "Fine Thread" },
        },
    },
    [7383] = { name = "Barbaric Loincloth", skill = 190, spec = nil,
        components = {
            { id = 4304, qty = 14, name = "Heavy Leather" },
            { id = 4242, qty = 2,  name = "Cured Heavy Hide" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
            { id = 6260, qty = 2,  name = "Red Dye" },
        },
    },
    [7384] = { name = "Green Leather Helmet", skill = 195, spec = nil,
        components = {
            { id = 4304, qty = 14, name = "Heavy Leather" },
            { id = 7392, qty = 6,  name = "Vibrant Plume" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [7385] = { name = "Dusky Belt", skill = 195, spec = nil,
        components = {
            { id = 4304, qty = 8,  name = "Heavy Leather" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    [7386] = { name = "Dusky Bracers", skill = 195, spec = nil,
        components = {
            { id = 4304, qty = 8,  name = "Heavy Leather" },
            { id = 4470, qty = 2,  name = "Fine Thread" },
        },
    },
    -- Turtle Scale set (drop recipes)
    [8365] = { name = "Turtle Scale Gloves", skill = 200, spec = nil,
        components = {
            { id = 7288, qty = 12, name = "Thick Leather" },
            { id = 8165, qty = 6,  name = "Turtle Scale" },
            { id = 4339, qty = 2,  name = "Silken Thread" },
        },
    },
    [8367] = { name = "Turtle Scale Bracers", skill = 205, spec = nil,
        components = {
            { id = 7288, qty = 10, name = "Thick Leather" },
            { id = 8165, qty = 6,  name = "Turtle Scale" },
            { id = 4339, qty = 2,  name = "Silken Thread" },
        },
    },
    [8366] = { name = "Turtle Scale Helm", skill = 210, spec = nil,
        components = {
            { id = 7288, qty = 14, name = "Thick Leather" },
            { id = 8165, qty = 10, name = "Turtle Scale" },
            { id = 4339, qty = 2,  name = "Silken Thread" },
        },
    },
    [8368] = { name = "Turtle Scale Leggings", skill = 215, spec = nil,
        components = {
            { id = 7288, qty = 16, name = "Thick Leather" },
            { id = 8165, qty = 12, name = "Turtle Scale" },
            { id = 4339, qty = 2,  name = "Silken Thread" },
        },
    },
    [8174] = { name = "Turtle Scale Breastplate", skill = 220, spec = nil,
        components = {
            { id = 7288, qty = 20, name = "Thick Leather" },
            { id = 8165, qty = 16, name = "Turtle Scale" },
            { id = 4339, qty = 3,  name = "Silken Thread" },
        },
    },
    -- Scorpid Scale set (drop recipes)
    [8178] = { name = "Scorpid Scale Bracers", skill = 205, spec = nil,
        components = {
            { id = 7288, qty = 10, name = "Thick Leather" },
            { id = 8154, qty = 6,  name = "Scorpid Scale" },
            { id = 4339, qty = 2,  name = "Silken Thread" },
        },
    },
    [8179] = { name = "Scorpid Scale Gloves", skill = 210, spec = nil,
        components = {
            { id = 7288, qty = 12, name = "Thick Leather" },
            { id = 8154, qty = 8,  name = "Scorpid Scale" },
            { id = 4339, qty = 2,  name = "Silken Thread" },
        },
    },
    [8344] = { name = "Scorpid Scale Armor", skill = 215, spec = nil,
        components = {
            { id = 7288, qty = 18, name = "Thick Leather" },
            { id = 8154, qty = 12, name = "Scorpid Scale" },
            { id = 4339, qty = 3,  name = "Silken Thread" },
        },
    },
    -- Raptor Hide set (drop recipes)
    [8177] = { name = "Raptor Hide Belt", skill = 205, spec = nil,
        components = {
            { id = 7288, qty = 10, name = "Thick Leather" },
            { id = 8175, qty = 4,  name = "Raptor Hide" },
            { id = 4339, qty = 2,  name = "Silken Thread" },
        },
    },
    [8176] = { name = "Raptor Hide Harness", skill = 210, spec = nil,
        components = {
            { id = 7288, qty = 18, name = "Thick Leather" },
            { id = 8175, qty = 6,  name = "Raptor Hide" },
            { id = 4339, qty = 3,  name = "Silken Thread" },
        },
    },

    -- ══════════════════════════════════════════════════════
    --  ARTISAN — GENERAL  (skill 225–300)
    -- ══════════════════════════════════════════════════════

    -- Rugged Leather trainer gear
    [15083] = { name = "Rugged Leather Pants", skill = 225, spec = nil,
        components = {
            { id = 8172, qty = 20, name = "Rugged Leather" },
            { id = 4339, qty = 3,  name = "Silken Thread" },
        },
    },
    [15084] = { name = "Comfortable Leather Hat", skill = 230, spec = nil,
        components = {
            { id = 8172, qty = 16, name = "Rugged Leather" },
            { id = 4339, qty = 2,  name = "Silken Thread" },
        },
    },
    [15085] = { name = "Rugged Leather Belt", skill = 235, spec = nil,
        components = {
            { id = 8172, qty = 12, name = "Rugged Leather" },
            { id = 4339, qty = 2,  name = "Silken Thread" },
        },
    },
    [15086] = { name = "Rugged Leather Headband", skill = 235, spec = nil,
        components = {
            { id = 8172, qty = 14, name = "Rugged Leather" },
            { id = 4339, qty = 2,  name = "Silken Thread" },
        },
    },
    [15087] = { name = "Rugged Leather Bracers", skill = 235, spec = nil,
        components = {
            { id = 8172, qty = 12, name = "Rugged Leather" },
            { id = 4339, qty = 2,  name = "Silken Thread" },
        },
    },
    [15088] = { name = "Rugged Leather Vest", skill = 240, spec = nil,
        components = {
            { id = 8172, qty = 22, name = "Rugged Leather" },
            { id = 4339, qty = 3,  name = "Silken Thread" },
        },
    },
    [15089] = { name = "Rugged Leather Gloves", skill = 240, spec = nil,
        components = {
            { id = 8172, qty = 14, name = "Rugged Leather" },
            { id = 4339, qty = 2,  name = "Silken Thread" },
        },
    },
    [15090] = { name = "Rugged Leather Shoulders", skill = 240, spec = nil,
        components = {
            { id = 8172, qty = 16, name = "Rugged Leather" },
            { id = 4339, qty = 2,  name = "Silken Thread" },
        },
    },
    [15091] = { name = "Rugged Leather Boots", skill = 240, spec = nil,
        components = {
            { id = 8172, qty = 16, name = "Rugged Leather" },
            { id = 4339, qty = 2,  name = "Silken Thread" },
        },
    },
    -- Heavy Scorpid set (drop recipes)
    [15047] = { name = "Heavy Scorpid Bracers", skill = 245, spec = nil,
        components = {
            { id = 8172, qty = 8,  name = "Rugged Leather" },
            { id = 8154, qty = 10, name = "Scorpid Scale" },
            { id = 4339, qty = 2,  name = "Silken Thread" },
        },
    },
    [15049] = { name = "Heavy Scorpid Belt", skill = 245, spec = nil,
        components = {
            { id = 8172, qty = 10, name = "Rugged Leather" },
            { id = 8154, qty = 12, name = "Scorpid Scale" },
            { id = 4339, qty = 2,  name = "Silken Thread" },
        },
    },
    [15051] = { name = "Heavy Scorpid Gloves", skill = 250, spec = nil,
        components = {
            { id = 8172, qty = 10, name = "Rugged Leather" },
            { id = 8154, qty = 14, name = "Scorpid Scale" },
            { id = 4339, qty = 2,  name = "Silken Thread" },
        },
    },
    [15052] = { name = "Heavy Scorpid Vest", skill = 255, spec = nil,
        components = {
            { id = 8172, qty = 16, name = "Rugged Leather" },
            { id = 8154, qty = 20, name = "Scorpid Scale" },
            { id = 4339, qty = 3,  name = "Silken Thread" },
        },
    },
    [15053] = { name = "Heavy Scorpid Helm", skill = 255, spec = nil,
        components = {
            { id = 8172, qty = 14, name = "Rugged Leather" },
            { id = 8154, qty = 16, name = "Scorpid Scale" },
            { id = 4339, qty = 3,  name = "Silken Thread" },
        },
    },
    [15054] = { name = "Heavy Scorpid Leggings", skill = 260, spec = nil,
        components = {
            { id = 8172, qty = 18, name = "Rugged Leather" },
            { id = 8154, qty = 20, name = "Scorpid Scale" },
            { id = 4339, qty = 3,  name = "Silken Thread" },
        },
    },
    -- Wicked Leather set (drop recipes)
    [15056] = { name = "Wicked Leather Gauntlets", skill = 265, spec = nil,
        components = {
            { id = 8172,  qty = 14, name = "Rugged Leather" },
            { id = 14635, qty = 4,  name = "Rune Thread" },
        },
    },
    [15057] = { name = "Wicked Leather Bracers", skill = 265, spec = nil,
        components = {
            { id = 8172,  qty = 12, name = "Rugged Leather" },
            { id = 14635, qty = 4,  name = "Rune Thread" },
        },
    },
    [15058] = { name = "Wicked Leather Belt", skill = 265, spec = nil,
        components = {
            { id = 8172,  qty = 12, name = "Rugged Leather" },
            { id = 14635, qty = 4,  name = "Rune Thread" },
        },
    },
    [15059] = { name = "Wicked Leather Pants", skill = 270, spec = nil,
        components = {
            { id = 8172,  qty = 20, name = "Rugged Leather" },
            { id = 14635, qty = 4,  name = "Rune Thread" },
        },
    },
    [15060] = { name = "Wicked Leather Armor", skill = 270, spec = nil,
        components = {
            { id = 8172,  qty = 22, name = "Rugged Leather" },
            { id = 14635, qty = 4,  name = "Rune Thread" },
        },
    },
    [15061] = { name = "Wicked Leather Headband", skill = 270, spec = nil,
        components = {
            { id = 8172,  qty = 16, name = "Rugged Leather" },
            { id = 14635, qty = 4,  name = "Rune Thread" },
        },
    },
    [15062] = { name = "Wicked Leather Boots", skill = 275, spec = nil,
        components = {
            { id = 8172,  qty = 16, name = "Rugged Leather" },
            { id = 14635, qty = 4,  name = "Rune Thread" },
        },
    },
    [15063] = { name = "Wicked Leather Shoulders", skill = 275, spec = nil,
        components = {
            { id = 8172,  qty = 16, name = "Rugged Leather" },
            { id = 14635, qty = 4,  name = "Rune Thread" },
        },
    },
    [15064] = { name = "Wicked Leather Helm", skill = 280, spec = nil,
        components = {
            { id = 8172,  qty = 18, name = "Rugged Leather" },
            { id = 14635, qty = 4,  name = "Rune Thread" },
        },
    },
    -- Misc notable drop recipes (non-spec)
    [18519] = { name = "Shadowskin Gloves", skill = 270, spec = nil,
        components = {
            { id = 8172,  qty = 14, name = "Rugged Leather" },
            { id = 7078,  qty = 2,  name = "Essence of Fire" },
            { id = 14635, qty = 2,  name = "Rune Thread" },
        },
    },
    [18403] = { name = "Core Armor Kit", skill = 300, spec = nil,
        components = {
            { id = 17010, qty = 4,  name = "Core Leather" },
        },
    },
    -- Sandstalker set — AQ quest/drop recipes
    [22683] = { name = "Sandstalker Breastplate", skill = 290, spec = nil,
        components = {
            { id = 8172,  qty = 20, name = "Rugged Leather" },
            { id = 20381, qty = 8,  name = "Thick Silithid Chitin" },
            { id = 14635, qty = 4,  name = "Rune Thread" },
        },
    },
    [22684] = { name = "Sandstalker Gauntlets", skill = 285, spec = nil,
        components = {
            { id = 8172,  qty = 14, name = "Rugged Leather" },
            { id = 20381, qty = 6,  name = "Thick Silithid Chitin" },
            { id = 14635, qty = 3,  name = "Rune Thread" },
        },
    },
    [22685] = { name = "Sandstalker Bracers", skill = 280, spec = nil,
        components = {
            { id = 8172,  qty = 10, name = "Rugged Leather" },
            { id = 20381, qty = 4,  name = "Thick Silithid Chitin" },
            { id = 14635, qty = 2,  name = "Rune Thread" },
        },
    },
    -- Cenarion Circle / Bramblewood set — AQ quest/drop recipes
    [22692] = { name = "Bramblewood Belt", skill = 285, spec = nil,
        components = {
            { id = 8172,  qty = 10, name = "Rugged Leather" },
            { id = 20406, qty = 4,  name = "Cenarion Herbs" },
            { id = 14635, qty = 2,  name = "Rune Thread" },
        },
    },
    [22694] = { name = "Bramblewood Boots", skill = 290, spec = nil,
        components = {
            { id = 8172,  qty = 14, name = "Rugged Leather" },
            { id = 20406, qty = 6,  name = "Cenarion Herbs" },
            { id = 14635, qty = 3,  name = "Rune Thread" },
        },
    },
    [22695] = { name = "Bramblewood Helm", skill = 300, spec = nil,
        components = {
            { id = 8172,  qty = 18, name = "Rugged Leather" },
            { id = 20406, qty = 8,  name = "Cenarion Herbs" },
            { id = 14635, qty = 4,  name = "Rune Thread" },
        },
    },

    -- ══════════════════════════════════════════════════════
    --  DRAGONSCALE SPECIALIZATION
    -- ══════════════════════════════════════════════════════

    [15038] = { name = "Green Dragonscale Bracers", skill = 235, spec = "Dragonscale",
        components = {
            { id = 15416, qty = 10, name = "Green Dragonscale" },
            { id = 8172,  qty = 4,  name = "Rugged Leather" },
            { id = 4339,  qty = 2,  name = "Silken Thread" },
        },
    },
    [15039] = { name = "Green Dragonscale Breastplate", skill = 250, spec = "Dragonscale",
        components = {
            { id = 15416, qty = 28, name = "Green Dragonscale" },
            { id = 8172,  qty = 8,  name = "Rugged Leather" },
            { id = 4339,  qty = 3,  name = "Silken Thread" },
        },
    },
    [15041] = { name = "Green Dragonscale Leggings", skill = 255, spec = "Dragonscale",
        components = {
            { id = 15416, qty = 20, name = "Green Dragonscale" },
            { id = 8172,  qty = 8,  name = "Rugged Leather" },
            { id = 4339,  qty = 3,  name = "Silken Thread" },
        },
    },
    [15042] = { name = "Blue Dragonscale Breastplate", skill = 300, spec = "Dragonscale",
        components = {
            { id = 15415, qty = 30, name = "Blue Dragonscale" },
            { id = 8172,  qty = 10, name = "Rugged Leather" },
            { id = 14635, qty = 4,  name = "Rune Thread" },
        },
    },
    [15043] = { name = "Blue Dragonscale Shoulders", skill = 285, spec = "Dragonscale",
        components = {
            { id = 15415, qty = 18, name = "Blue Dragonscale" },
            { id = 8172,  qty = 6,  name = "Rugged Leather" },
            { id = 14635, qty = 3,  name = "Rune Thread" },
        },
    },
    [15044] = { name = "Red Dragonscale Breastplate", skill = 300, spec = "Dragonscale",
        components = {
            { id = 15417, qty = 30, name = "Red Dragonscale" },
            { id = 8172,  qty = 10, name = "Rugged Leather" },
            { id = 14635, qty = 4,  name = "Rune Thread" },
        },
    },
    [15045] = { name = "Black Dragonscale Breastplate", skill = 300, spec = "Dragonscale",
        components = {
            { id = 15416, qty = 28, name = "Green Dragonscale" },
            { id = 15414, qty = 4,  name = "Black Dragonscale" },
            { id = 8172,  qty = 8,  name = "Rugged Leather" },
            { id = 14635, qty = 4,  name = "Rune Thread" },
        },
    },
    [15046] = { name = "Black Dragonscale Shoulders", skill = 295, spec = "Dragonscale",
        components = {
            { id = 15416, qty = 20, name = "Green Dragonscale" },
            { id = 15414, qty = 2,  name = "Black Dragonscale" },
            { id = 8172,  qty = 6,  name = "Rugged Leather" },
            { id = 14635, qty = 3,  name = "Rune Thread" },
        },
    },
    [15048] = { name = "Black Dragonscale Leggings", skill = 295, spec = "Dragonscale",
        components = {
            { id = 15416, qty = 24, name = "Green Dragonscale" },
            { id = 15414, qty = 4,  name = "Black Dragonscale" },
            { id = 8172,  qty = 8,  name = "Rugged Leather" },
            { id = 14635, qty = 4,  name = "Rune Thread" },
        },
    },

    -- ══════════════════════════════════════════════════════
    --  ELEMENTAL SPECIALIZATION
    -- ══════════════════════════════════════════════════════

    [10650] = { name = "Stormshroud Armor", skill = 245, spec = "Elemental",
        components = {
            { id = 8172,  qty = 18, name = "Rugged Leather" },
            { id = 7067,  qty = 4,  name = "Elemental Earth" },
            { id = 14635, qty = 3,  name = "Rune Thread" },
        },
    },
    [10651] = { name = "Stormshroud Pants", skill = 260, spec = "Elemental",
        components = {
            { id = 8172,  qty = 20, name = "Rugged Leather" },
            { id = 7069,  qty = 4,  name = "Elemental Air" },
            { id = 14635, qty = 3,  name = "Rune Thread" },
        },
    },
    [10652] = { name = "Stormshroud Shoulders", skill = 270, spec = "Elemental",
        components = {
            { id = 8172,  qty = 16, name = "Rugged Leather" },
            { id = 7069,  qty = 4,  name = "Elemental Air" },
            { id = 14635, qty = 3,  name = "Rune Thread" },
        },
    },
    [10653] = { name = "Stormshroud Gloves", skill = 250, spec = "Elemental",
        components = {
            { id = 8172,  qty = 12, name = "Rugged Leather" },
            { id = 7069,  qty = 2,  name = "Elemental Air" },
            { id = 14635, qty = 2,  name = "Rune Thread" },
        },
    },
    [15065] = { name = "Volcanic Leggings", skill = 250, spec = "Elemental",
        components = {
            { id = 8172,  qty = 20, name = "Rugged Leather" },
            { id = 7068,  qty = 4,  name = "Elemental Fire" },
            { id = 14635, qty = 3,  name = "Rune Thread" },
        },
    },
    [15066] = { name = "Lava Belt", skill = 255, spec = "Elemental",
        components = {
            { id = 8172,  qty = 14, name = "Rugged Leather" },
            { id = 7068,  qty = 2,  name = "Elemental Fire" },
            { id = 14635, qty = 2,  name = "Rune Thread" },
        },
    },
    [15067] = { name = "Volcanic Breastplate", skill = 265, spec = "Elemental",
        components = {
            { id = 8172,  qty = 22, name = "Rugged Leather" },
            { id = 7068,  qty = 6,  name = "Elemental Fire" },
            { id = 14635, qty = 3,  name = "Rune Thread" },
        },
    },
    [15068] = { name = "Molten Helm", skill = 300, spec = "Elemental",
        components = {
            { id = 8172,  qty = 22, name = "Rugged Leather" },
            { id = 17010, qty = 6,  name = "Core Leather" },
            { id = 7068,  qty = 4,  name = "Elemental Fire" },
            { id = 14635, qty = 4,  name = "Rune Thread" },
        },
    },
    [15069] = { name = "Corehound Belt", skill = 300, spec = "Elemental",
        components = {
            { id = 8172,  qty = 20, name = "Rugged Leather" },
            { id = 17010, qty = 8,  name = "Core Leather" },
            { id = 7068,  qty = 4,  name = "Elemental Fire" },
            { id = 14635, qty = 4,  name = "Rune Thread" },
        },
    },

    -- ══════════════════════════════════════════════════════
    --  TRIBAL SPECIALIZATION
    -- ══════════════════════════════════════════════════════

    [15070] = { name = "Wolfshead Helm", skill = 225, spec = "Tribal",
        components = {
            { id = 8172,  qty = 8,  name = "Rugged Leather" },
            { id = 7392,  qty = 4,  name = "Vibrant Plume" },
            { id = 7972,  qty = 2,  name = "Pristine Hide of the Beast" },
            { id = 14635, qty = 2,  name = "Rune Thread" },
        },
    },
    [15071] = { name = "Shifting Cloak", skill = 250, spec = "Tribal",
        components = {
            { id = 8172,  qty = 12, name = "Rugged Leather" },
            { id = 7392,  qty = 4,  name = "Vibrant Plume" },
            { id = 14635, qty = 2,  name = "Rune Thread" },
        },
    },
    [15073] = { name = "Feathered Breastplate", skill = 250, spec = "Tribal",
        components = {
            { id = 8172,  qty = 16, name = "Rugged Leather" },
            { id = 7392,  qty = 8,  name = "Vibrant Plume" },
            { id = 14635, qty = 3,  name = "Rune Thread" },
        },
    },
    [15076] = { name = "Primal Batskin Bracers", skill = 255, spec = "Tribal",
        components = {
            { id = 8172,  qty = 8,  name = "Rugged Leather" },
            { id = 15407, qty = 6,  name = "Primal Bat Leather" },
            { id = 14635, qty = 2,  name = "Rune Thread" },
        },
    },
    [15077] = { name = "Primal Batskin Gloves", skill = 265, spec = "Tribal",
        components = {
            { id = 8172,  qty = 10, name = "Rugged Leather" },
            { id = 15407, qty = 8,  name = "Primal Bat Leather" },
            { id = 14635, qty = 2,  name = "Rune Thread" },
        },
    },
    [15078] = { name = "Primal Batskin Jerkin", skill = 280, spec = "Tribal",
        components = {
            { id = 8172,  qty = 16, name = "Rugged Leather" },
            { id = 15407, qty = 14, name = "Primal Bat Leather" },
            { id = 14635, qty = 4,  name = "Rune Thread" },
        },
    },
    [15079] = { name = "Living Shoulders", skill = 285, spec = "Tribal",
        components = {
            { id = 8172,  qty = 16, name = "Rugged Leather" },
            { id = 12803, qty = 2,  name = "Living Essence" },
            { id = 14635, qty = 3,  name = "Rune Thread" },
        },
    },
    [15080] = { name = "Devilsaur Gauntlets", skill = 285, spec = "Tribal",
        components = {
            { id = 15417, qty = 8,  name = "Devilsaur Leather" },
            { id = 8172,  qty = 6,  name = "Rugged Leather" },
            { id = 14635, qty = 3,  name = "Rune Thread" },
        },
    },
    [15081] = { name = "Devilsaur Leggings", skill = 300, spec = "Tribal",
        components = {
            { id = 15417, qty = 14, name = "Devilsaur Leather" },
            { id = 8172,  qty = 8,  name = "Rugged Leather" },
            { id = 14635, qty = 4,  name = "Rune Thread" },
        },
    },
    [15082] = { name = "Blood Tiger Breastplate", skill = 300, spec = "Tribal",
        components = {
            { id = 8172,  qty = 20, name = "Rugged Leather" },
            { id = 15410, qty = 10, name = "Primal Tiger Leather" },
            { id = 14635, qty = 4,  name = "Rune Thread" },
        },
    },
    [15093] = { name = "Blood Tiger Shoulders", skill = 300, spec = "Tribal",
        components = {
            { id = 8172,  qty = 16, name = "Rugged Leather" },
            { id = 15410, qty = 6,  name = "Primal Tiger Leather" },
            { id = 14635, qty = 3,  name = "Rune Thread" },
        },
    },
    [15092] = { name = "Hide of the Wild", skill = 300, spec = "Tribal",
        components = {
            { id = 8172,  qty = 8,  name = "Rugged Leather" },
            { id = 12803, qty = 4,  name = "Living Essence" },
            { id = 7972,  qty = 2,  name = "Pristine Hide of the Beast" },
            { id = 14635, qty = 4,  name = "Rune Thread" },
        },
    },

}
