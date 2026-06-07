-- ============================================================
--  ProfTooltip v2.2 – Main
--  WoW Classic Era 1.15.x (interface 11508)
--  Professions: Alchemy, Engineering, Blacksmithing, Mining,
--               Leatherworking, Tailoring, Cooking, First Aid,
--               Enchanting (reagent lookup)
-- ============================================================

local ADDON = "ProfTooltip"

-- Version guard: Classic Era only (11200–11999)
local _, _, _, toc = GetBuildInfo()
if toc < 11200 or toc >= 20000 then
    print(ADDON .. ": wrong client version (" .. toc .. "), disabled.")
    return
end

-- ── Réglages : activation par métier ─────────────────────────
-- Par défaut TOUT est activé. Les choix sont mémorisés dans la
-- SavedVariable ProfTooltipDB (déclarée dans le .toc).

local DEFAULTS = {
    Alchemy = true, Engineering = true, Blacksmithing = true,
    Leatherworking = true, Tailoring = true, Cooking = true, FirstAid = true,
    Herbalism = true, Mining = true, Enchanting = true,
}

-- Liste partagée avec Options.lua (libellés du panneau d'options)
ProfTooltip_ProfList = {
    craft = {
        { key = "Alchemy",        label = "Alchemy" },
        { key = "Engineering",    label = "Engineering" },
        { key = "Blacksmithing",  label = "Blacksmithing" },
        { key = "Leatherworking", label = "Leatherworking" },
        { key = "Tailoring",      label = "Tailoring" },
        { key = "Cooking",        label = "Cooking" },
        { key = "FirstAid",       label = "First Aid" },
    },
    gather = {
        { key = "Herbalism",  label = "Herbalism" },
        { key = "Mining",     label = "Mining" },
        { key = "Enchanting", label = "Enchanting reagents" },
    },
}

local function InitDB()
    ProfTooltipDB = ProfTooltipDB or {}
    ProfTooltipDB.enabled = ProfTooltipDB.enabled or {}
    for k, v in pairs(DEFAULTS) do
        if ProfTooltipDB.enabled[k] == nil then
            ProfTooltipDB.enabled[k] = v
        end
    end
end

-- Renvoie true si le métier doit s'afficher (par défaut oui).
local function IsEnabled(key)
    if not ProfTooltipDB or not ProfTooltipDB.enabled then return true end
    return ProfTooltipDB.enabled[key] ~= false
end

local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("ADDON_LOADED")
initFrame:SetScript("OnEvent", function(self, _, name)
    if name == ADDON then
        InitDB()
        self:UnregisterEvent("ADDON_LOADED")
    end
end)

-- ── Colors ───────────────────────────────────────────────────
local GOLD   = "|cFFFFD700"
local GREEN  = "|cFF69FF6E"
local BLUE   = "|cFF6AC7FF"
local ORANGE = "|cFFFF9900"
local SILVER = "|cFFCCCCCC"
local COPPER = "|cFFD4A55A"
local GNOME  = "|cFF00FFCC"
local GOBLIN = "|cFFFF5555"
local GRAY   = "|cFFAAAAAA"
local WHITE  = "|cFFFFFFFF"
local PURPLE = "|cFFCC88FF"
local FOOD   = "|cFFFFAA00"
local R      = "|r"

-- ── Helpers ──────────────────────────────────────────────────

local function GetItemId(link)
    if not link then return nil end
    return tonumber(link:match("item:(%d+)"))
end

-- Icône 14px inline pour un item
local function Icon(itemId)
    local icon = GetItemIcon(itemId)
    if icon then return "|T" .. icon .. ":14:14:0:0|t " end
    return ""
end

-- ── Gather : Herbes ──────────────────────────────────────────

local function AddHerbLines(tip, itemId)
    local h = ProfTooltip_Herbs and ProfTooltip_Herbs[itemId]
    if not h then return end

    tip:AddLine(" ")
    tip:AddLine(GREEN .. "Herbalism (skill " .. h.skill .. "+)" .. R)
    tip:AddLine(GREEN .. "Used in Alchemy:" .. R)
    for _, use in ipairs(h.uses) do
        -- Cherche l'itemId de la potion pour afficher son icône
        local potIcon = ""
        if ProfTooltip_Alchemy then
            for potId, recipe in pairs(ProfTooltip_Alchemy) do
                if recipe.name == use then
                    potIcon = Icon(potId)
                    break
                end
            end
        end
        tip:AddLine(GRAY .. "  - " .. potIcon .. WHITE .. use .. R)
    end
end

-- ── Gather : Enchanting reagents ────────────────────────────

local function AddEnchantingLines(tip, itemId)
    local e = ProfTooltip_Enchanting and ProfTooltip_Enchanting[itemId]
    if not e then return end

    tip:AddLine(" ")
    tip:AddLine(GNOME .. "Enchanting reagent (skill " .. e.skill .. "+)" .. R)
    tip:AddLine(GNOME .. "Used in:" .. R)
    for _, use in ipairs(e.uses) do
        tip:AddLine(GRAY .. "  - " .. WHITE .. use .. R)
    end
end

-- ── Gather : Minerais & Barres ───────────────────────────────

local function AddOreLines(tip, itemId)
    local o = ProfTooltip_Ores and ProfTooltip_Ores[itemId]
    if not o then return end

    tip:AddLine(" ")
    tip:AddLine(COPPER .. Icon(itemId) .. "Mining (skill " .. o.skill .. "+)" .. R)
    for _, use in ipairs(o.uses) do
        tip:AddLine(GRAY .. "  - " .. WHITE .. use .. R)
    end
end

-- ── Recipe renderer générique ────────────────────────────────

local function RenderRecipe(tip, recipe, profColor, profLabel)
    tip:AddLine(" ")

    -- Header avec spé colorée si applicable
    local header = profColor .. profLabel .. " (skill " .. recipe.skill .. "+)"
    if recipe.spec then
        local sc = (recipe.spec == "Gnomish") and GNOME
                or (recipe.spec == "Goblin")  and GOBLIN
                or ORANGE
        header = header .. "  " .. sc .. "[" .. recipe.spec .. "]"
    end
    tip:AddLine(header .. R)

    -- Composants
    if recipe.components and #recipe.components > 0 then
        tip:AddLine(GRAY .. "Components:" .. R)
        for _, c in ipairs(recipe.components) do
            local iconStr = ""
            if c.id and c.id > 0 then
                local ok, result = pcall(GetItemIcon, c.id)
                if ok and result then
                    iconStr = "|T" .. result .. ":14:14:0:0|t "
                end
            end
            tip:AddLine(GRAY .. "  - " .. iconStr .. WHITE .. c.qty .. "x " .. c.name .. R)
        end
    end
end

-- ── Tooltip hook ─────────────────────────────────────────────

local function OnTooltipSetItem(tooltip)
    local _, link = tooltip:GetItem()
    local id = GetItemId(link)
    if not id then return end

    -- 1. Gather (herbes, minerais, enchanting reagents)
    if IsEnabled("Herbalism")  then AddHerbLines(tooltip, id)       end
    if IsEnabled("Mining")     then AddOreLines(tooltip, id)        end
    if IsEnabled("Enchanting") then AddEnchantingLines(tooltip, id) end

    -- 2. Alchemy
    local alch = ProfTooltip_Alchemy and ProfTooltip_Alchemy[id]
    if alch and IsEnabled("Alchemy") then
        RenderRecipe(tooltip, alch, BLUE, "Alchemy")
    end

    -- 3. Engineering
    local eng = ProfTooltip_Engineering and ProfTooltip_Engineering[id]
    if eng and IsEnabled("Engineering") then
        RenderRecipe(tooltip, eng, ORANGE, "Engineering")
    end

    -- 4. Blacksmithing (remapper les codes de spé en noms lisibles)
    local bs = ProfTooltip_Blacksmithing and ProfTooltip_Blacksmithing[id]
    if bs and IsEnabled("Blacksmithing") then
        local specMap = {
            Arms = "Armorsmith", Weap = "Weaponsmith",
            Ham  = "Hammersmith", Axe = "Axesmith", Swd = "Swordsmith",
        }
        local specName = bs.spec and (specMap[bs.spec] or bs.spec) or nil
        local bsData = {
            name = bs.name, skill = bs.skill,
            spec = specName, components = bs.components,
        }
        RenderRecipe(tooltip, bsData, SILVER, "Blacksmithing")
    end

    -- 5. Leatherworking
    local lw = ProfTooltip_Leatherworking and ProfTooltip_Leatherworking[id]
    if lw and IsEnabled("Leatherworking") then
        local specMap = {
            Dragonscale = "Dragonscale LW",
            Elemental   = "Elemental LW",
            Tribal      = "Tribal LW",
        }
        local specName = lw.spec and (specMap[lw.spec] or lw.spec) or nil
        local lwData = {
            name = lw.name, skill = lw.skill,
            spec = specName, components = lw.components,
        }
        RenderRecipe(tooltip, lwData, COPPER, "Leatherworking")
    end

    -- 6. Tailoring
    local tail = ProfTooltip_Tailoring and ProfTooltip_Tailoring[id]
    if tail and IsEnabled("Tailoring") then
        RenderRecipe(tooltip, tail, PURPLE, "Tailoring")
    end

    -- 7. Cooking
    local cook = ProfTooltip_Cooking and ProfTooltip_Cooking[id]
    if cook and IsEnabled("Cooking") then
        RenderRecipe(tooltip, cook, FOOD, "Cooking")
    end

    -- 8. First Aid
    local aid = ProfTooltip_FirstAid and ProfTooltip_FirstAid[id]
    if aid and IsEnabled("FirstAid") then
        RenderRecipe(tooltip, aid, GREEN, "First Aid")
    end
end

GameTooltip:HookScript("OnTooltipSetItem", OnTooltipSetItem)
ItemRefTooltip:HookScript("OnTooltipSetItem", OnTooltipSetItem)

print(GOLD .. ADDON .. " v2.3" .. R .. " loaded.  " .. GRAY .. "/pt" .. R .. " for options.")

-- ── Command : /pt → open the options panel ────────────────────
SLASH_PROFTOOLTIP1 = "/pt"
SlashCmdList["PROFTOOLTIP"] = function()
    if ProfTooltip_OpenOptions then
        ProfTooltip_OpenOptions()
    else
        print(GOLD .. ADDON .. R .. ": options panel unavailable.")
    end
end

-- ── Commande debug : /ptid ────────────────────────────────────
-- Survole un item puis tape /ptid pour voir son ID dans le chat.
-- Utile pour signaler un item manquant dans la DB.
SLASH_PTID1 = "/ptid"
SlashCmdList["PTID"] = function()
    local _, link = GameTooltip:GetItem()
    if link then
        local id = GetItemId(link)
        print(GOLD .. ADDON .. R .. ": item ID = " .. (id or "?") .. "  |  " .. link)
    else
        print(GOLD .. ADDON .. R .. ": survole un item d'abord.")
    end
end
