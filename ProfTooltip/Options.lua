-- ============================================================
--  ProfTooltip — Panneau d'options
--  Apparaît dans : Échap → Options → AddOns → ProfTooltip
--  Cases à cocher par métier + boutons Tout activer / désactiver.
--  Les réglages sont lus/écrits dans ProfTooltipDB.enabled.
-- ============================================================

-- Si le fichier principal s'est désactivé (mauvaise version de client),
-- la liste partagée n'existe pas : on ne construit pas le panneau.
if not ProfTooltip_ProfList then return end

local panel = CreateFrame("Frame", "ProfTooltipOptionsPanel")
panel.name = "ProfTooltip"

-- Titre + sous-titre
local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
title:SetPoint("TOPLEFT", 16, -16)
title:SetText("ProfTooltip")

local sub = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
sub:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -6)
sub:SetWidth(520)
sub:SetJustifyH("LEFT")
sub:SetText("Enable or disable each profession's lines in item tooltips. " ..
            "Unchecking a profession hides it from tooltips (data still loads).")

local checks = {}

local function MakeCheck(key, label, x, y)
    local name = "ProfTooltipCheck_" .. key
    local cb = CreateFrame("CheckButton", name, panel, "InterfaceOptionsCheckButtonTemplate")
    cb:SetPoint("TOPLEFT", x, y)
    _G[name .. "Text"]:SetText(label)
    cb:SetScript("OnClick", function(self)
        if ProfTooltipDB and ProfTooltipDB.enabled then
            ProfTooltipDB.enabled[key] = self:GetChecked() and true or false
        end
    end)
    checks[key] = cb
    return cb
end

local function Header(text, x, y)
    local fs = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    fs:SetPoint("TOPLEFT", x, y)
    fs:SetText("|cFFFFD700" .. text .. "|r")
    return fs
end

-- Construction de la liste (depuis ProfTooltip_ProfList défini dans le fichier principal)
local y = -64
Header("Crafting professions", 16, y) ; y = y - 24
for _, p in ipairs(ProfTooltip_ProfList.craft) do
    MakeCheck(p.key, p.label, 24, y) ; y = y - 26
end

y = y - 14
Header("Gathering / reagents", 16, y) ; y = y - 24
for _, p in ipairs(ProfTooltip_ProfList.gather) do
    MakeCheck(p.key, p.label, 24, y) ; y = y - 26
end

-- Synchronise l'état visuel des cases avec la SavedVariable
local function RefreshChecks()
    if not (ProfTooltipDB and ProfTooltipDB.enabled) then return end
    for key, cb in pairs(checks) do
        cb:SetChecked(ProfTooltipDB.enabled[key] ~= false)
    end
end

local function SetAll(val)
    if not (ProfTooltipDB and ProfTooltipDB.enabled) then return end
    for _, list in pairs(ProfTooltip_ProfList) do
        for _, p in ipairs(list) do
            ProfTooltipDB.enabled[p.key] = val
        end
    end
    RefreshChecks()
end

-- Enable all / Disable all buttons
local enableAll = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
enableAll:SetSize(130, 22)
enableAll:SetPoint("TOPLEFT", 24, y - 12)
enableAll:SetText("Enable all")
enableAll:SetScript("OnClick", function() SetAll(true) end)

local disableAll = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
disableAll:SetSize(130, 22)
disableAll:SetPoint("LEFT", enableAll, "RIGHT", 10, 0)
disableAll:SetText("Disable all")
disableAll:SetScript("OnClick", function() SetAll(false) end)

panel:SetScript("OnShow", RefreshChecks)

-- Enregistrement dans le menu Options → AddOns
local category
if Settings and Settings.RegisterCanvasLayoutCategory then
    category = Settings.RegisterCanvasLayoutCategory(panel, panel.name)
    category.ID = panel.name
    Settings.RegisterAddOnCategory(category)
elseif InterfaceOptions_AddCategory then          -- secours clients plus anciens
    InterfaceOptions_AddCategory(panel)
end

-- Ouverture depuis /pt (fonction appelée par ProfTooltip.lua)
function ProfTooltip_OpenOptions()
    if Settings and Settings.OpenToCategory and category then
        Settings.OpenToCategory(category:GetID())
    elseif InterfaceOptionsFrame_OpenToCategory then
        InterfaceOptionsFrame_OpenToCategory(panel)
        InterfaceOptionsFrame_OpenToCategory(panel) -- 2x : contournement d'un bug Blizzard
    end
end
