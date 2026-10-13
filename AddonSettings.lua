--- @class (partial) AbilityIconsFramework
local AbilityIconsFramework = AbilityIconsFramework or {}

local LAM2 = LibAddonMenu2

AbilityIconsFramework.DEFAULT_SETTINGS = {
    version = AbilityIconsFramework.SAVEDVARIABLES_VERSION,
    showSkillStyleIcons = false,
    showCustomScribeIcons = true,
    replaceMismatchedBaseIcons = true,
    enableHeroismPotionIcons = true,
    fixVas = true,
    iconPacksData = {},
    resolution = 256
}

AbilityIconsFramework.resolutionChoices = {
    64,
    128,
    256
}

local currentIconsResolution = 256


--- Initializes saved variables and configures their corresponding menus, using LibAddonMenu2 (if it exists).
function AbilityIconsFramework.InitializeSettings()
    -- 1. Base Configuration (Account-Wide)
    AbilityIconsFramework.CONFIG = ZO_SavedVars:NewAccountWide("AbilityIconsFramework_SavedVariables", AbilityIconsFramework.SAVEDVARIABLES_VERSION, "config", AbilityIconsFramework.DEFAULT_ADDON_CONFIG)
    AbilityIconsFramework.CleanupAccountWideSettings(AbilityIconsFramework_SavedVariables, AbilityIconsFramework.DEFAULT_ADDON_CONFIG, "config")

    -- 2. Global Settings (Account-Wide)
    AbilityIconsFramework.GLOBALSETTINGS = ZO_SavedVars:NewAccountWide("AbilityIconsFramework_SavedVariables", AbilityIconsFramework.SAVEDVARIABLES_VERSION, "global_settings", AbilityIconsFramework.DEFAULT_SETTINGS)
    AbilityIconsFramework.CleanupAccountWideSettings(AbilityIconsFramework_SavedVariables, AbilityIconsFramework.DEFAULT_SETTINGS, "global_settings")

    -- 3. Character Settings (Per-Character by ID)
    AbilityIconsFramework.CHARACTERSETTINGS = ZO_SavedVars:NewCharacterIdSettings("AbilityIconsFramework_SavedVariables", AbilityIconsFramework.SAVEDVARIABLES_VERSION, "character_settings", AbilityIconsFramework.DEFAULT_SETTINGS)
    AbilityIconsFramework.CleanupCharacterIdSettings(AbilityIconsFramework_SavedVariables, AbilityIconsFramework.DEFAULT_SETTINGS, "character_settings")

    -- Migrate legacy separate SV tables if present
    if AbilityIconsFramework_Globals and AbilityIconsFramework_Globals["Default"] and AbilityIconsFramework_Globals["Default"][GetDisplayName()] then
        local oldGlobals = AbilityIconsFramework_Globals["Default"][GetDisplayName()]["$AccountWide"]
        if oldGlobals and oldGlobals["global_settings"] and not AbilityIconsFramework.GLOBALSETTINGS._migrated then
            for k, v in pairs(oldGlobals["global_settings"]) do
                if AbilityIconsFramework.GLOBALSETTINGS[k] == nil then
                    AbilityIconsFramework.GLOBALSETTINGS[k] = v
                end
            end
            AbilityIconsFramework.GLOBALSETTINGS._migrated = true
        end
    end

    -- Enforce fixVas = true permanently; overwrite any existing saved variables where it was false
    AbilityIconsFramework.GLOBALSETTINGS.fixVas = true
    AbilityIconsFramework.CHARACTERSETTINGS.fixVas = true

    currentIconsResolution = AbilityIconsFramework.GetSettings().resolution

    AbilityIconsFramework.InitBaseIconsPath()

    if AbilityIconsFramework.ProcessEarlyIconPacks then
        AbilityIconsFramework.ProcessEarlyIconPacks()
    end
    AbilityIconsFramework.InitializeSortOrderEntries()

    if LAM2 == nil then return end

    local panelData = {
        type = "panel",
        name = GetString(SI_AIF_PANEL_NAME),
        displayName = "|c66b2b2Ability|r |cffbf00Icons|r |c6C3BAAFramework|r " .. AbilityIconsFramework.version,
        author = "|ce6202dKwiebe-Kwibus|r & Asquart",
        version = AbilityIconsFramework.version,
        website = "https://www.esoui.com/downloads/info4061-AbilityIconsFramework.html",
        slashCommand = "/aifgb",
        registerForRefresh = true,
        registerForDefaults = true
    }

    LAM2:RegisterAddonPanel("AbilityIconsFramework_Panel", panelData)

    local optionsData = {
        {
            type = "header",
            name = GetString(SI_AIF_SETTINGS_HEADER),
        },
        {
            type = "checkbox",
            name = GetString(SI_AIF_GLOBAL_SETTINGS),
            getFunc = function()
                return AbilityIconsFramework.CONFIG.saveSettingsGlobally
            end,
            setFunc = AbilityIconsFramework.SetOptionGlobalIcons
        },
        {
            type = "checkbox",
            name = GetString(SI_AIF_SCRIBING_ICONS),
            getFunc = function()
                return AbilityIconsFramework.GetSettings().showCustomScribeIcons
            end,
            setFunc = AbilityIconsFramework.SetOptionCustomIcons
        },
        {
            type = "checkbox",
            name = GetString(SI_AIF_BASE_GAME_ICONS),
            getFunc = function()
                return AbilityIconsFramework.GetSettings().replaceMismatchedBaseIcons
            end,
            setFunc = AbilityIconsFramework.SetOptionMismatchedIcons
        },
        {
            type = "checkbox",
            name = GetString(SI_AIF_HEROISM_POTIONS),
            getFunc = function()
                return AbilityIconsFramework.GetSettings().enableHeroismPotionIcons
            end,
            setFunc = AbilityIconsFramework.SetHeroismPotionIconsEnabled
        },
        {
            type = "dropdown",
            name = GetString(SI_AIF_RESOLUTION),
            tooltip = GetString(SI_AIF_RESOLUTION_TIP),
            choices = AbilityIconsFramework.resolutionChoices,
            scrollable = false,
            getFunc = function() return AbilityIconsFramework.GetSettings().resolution end,
            setFunc = function(selected)
                for _, resolution in ipairs(AbilityIconsFramework.resolutionChoices) do
                    if resolution == selected then
                        AbilityIconsFramework.GetSettings().resolution = resolution
                        break
                    end
                end
            end,
            default = AbilityIconsFramework.GetSettings().resolution,
            warning = GetString(SI_AIF_RESOLUTION_WARN),
        },
        {
            type = "button",
            name = GetString(SI_AIF_RELOAD_UI),
            width = "full",
            func = function() ReloadUI("ingame") end,
            disabled = function() return AbilityIconsFramework.GetSettings().resolution == currentIconsResolution end
        },
        {
            type = "submenu",
            name = GetString(SI_AIF_PACK_ORDER_SUBMENU),
            controls = {
                {
                    type = "orderlistbox",
                    name = GetString(SI_AIF_PACK_PRIORITY),
                    listEntries = AbilityIconsFramework.packSortOrderEntries,
                    disableDrag = false,
                    disableButtons = true,
                    showPosition = true,
                    getFunc = function() return AbilityIconsFramework.packSortOrderEntries end,
                    setFunc = function(sortedSortListEntries)
                        AbilityIconsFramework.packSortOrderEntries = sortedSortListEntries
                        AbilityIconsFramework.UpdatePackLoadOrderFromSortEntries()
                        AbilityIconsFramework.ApplyPackLoadOrderChanges()
                    end,
                    width = "full",
                    isExtraWide = true,
                    rowFont = "ZoFontWinH1",
                    minHeight = 250,
                    maxHeight = 400,
                    rowHeight = 45,
                    showRemoveEntryButton = false,
                },
            }
        },
    }

    LAM2:RegisterOptionControls("AbilityIconsFramework_Panel", optionsData)
end

--- Retrieves the saved settings, whether global or per character (and nil if not initialized yet).
function AbilityIconsFramework.GetSettings()
    if AbilityIconsFramework.GLOBALSETTINGS == nil and AbilityIconsFramework.CHARACTERSETTINGS == nil then
        return nil
    end

    if AbilityIconsFramework.CONFIG and AbilityIconsFramework.CONFIG.saveSettingsGlobally then
        return AbilityIconsFramework.GLOBALSETTINGS or AbilityIconsFramework.DEFAULT_SETTINGS
    else
        return AbilityIconsFramework.CHARACTERSETTINGS or AbilityIconsFramework.DEFAULT_SETTINGS
    end
end

--- Cleanup account-wide settings from previous versions safely.
--- @param savedVars table Contains the current account-wide saved variables.
--- @param defaultConfig table Contains the default account-wide saved variables.
--- @param namespace string? The sub-table (if any) in which the saved variables are stored.
function AbilityIconsFramework.CleanupAccountWideSettings(savedVars, defaultConfig, namespace)
    if not (savedVars and savedVars["Default"] and savedVars["Default"][GetDisplayName()]) then return end
    local accountData = savedVars["Default"][GetDisplayName()]["$AccountWide"]
    if not accountData then return end
    local currentConfig = namespace and accountData[namespace] or accountData
    if not currentConfig then return end

    for key in pairs(currentConfig) do
        if key ~= "version" and defaultConfig[key] == nil then
            currentConfig[key] = nil
        end
    end

    if currentConfig.mismatchedIcons and defaultConfig.mismatchedIcons then
        for iconName in pairs(currentConfig.mismatchedIcons) do
            if defaultConfig.mismatchedIcons[iconName] == nil then
                currentConfig.mismatchedIcons[iconName] = nil
            end
        end
    end
end

function AbilityIconsFramework.CleanupCharacterIdSettings(savedVars, defaultConfig, namespace)
    if not (savedVars and savedVars["Default"] and savedVars["Default"][GetDisplayName()]) then return end
    local characterKey = GetCurrentCharacterId()
    local charData = savedVars["Default"][GetDisplayName()][characterKey]
    if not charData then return end
    local currentConfig = namespace and charData[namespace] or charData
    if not currentConfig then return end

    for key in pairs(currentConfig) do
        if key ~= "version" and defaultConfig[key] == nil then
            currentConfig[key] = nil
        end
    end

    if currentConfig.mismatchedIcons and defaultConfig.mismatchedIcons then
        for iconName in pairs(currentConfig.mismatchedIcons) do
            if defaultConfig.mismatchedIcons[iconName] == nil then
                currentConfig.mismatchedIcons[iconName] = nil
            end
        end
    end
end

--- Set the setting for global (Account Wide) icons to on/off
--- @param value boolean
function AbilityIconsFramework.SetOptionGlobalIcons(value)
    local oldSettings = AbilityIconsFramework.GetSettings()
    AbilityIconsFramework.CONFIG.saveSettingsGlobally = value
    local newSettings = AbilityIconsFramework.GetSettings()
    if oldSettings and newSettings then
        newSettings.showSkillStyleIcons = oldSettings.showSkillStyleIcons
        newSettings.showCustomScribeIcons = oldSettings.showCustomScribeIcons
        newSettings.replaceMismatchedBaseIcons = oldSettings.replaceMismatchedBaseIcons
        newSettings.fixVas = true
    end
    AbilityIconsFramework.InitializeSortOrderEntries()
    AbilityIconsFramework.ApplyPackLoadOrderChanges()
end

--- Set the setting for skill style icons to on/off
--- @param value boolean
function AbilityIconsFramework.SetOptionSkillStyleIcons(value)
    AbilityIconsFramework.GetSettings().showSkillStyleIcons = value
    AbilityIconsFramework.UpdateAllSlots()
end

--- Set the setting for custom scribed icons to on/off
--- @param value boolean
function AbilityIconsFramework.SetOptionCustomIcons(value)
    AbilityIconsFramework.GetSettings().showCustomScribeIcons = value
    AbilityIconsFramework.UpdateDefaultScribingIcons()
    AbilityIconsFramework.UpdateAllSlots()
end

--- Set the setting for mismatched icons to on/off
--- @param value boolean
function AbilityIconsFramework.SetOptionMismatchedIcons(value)
    AbilityIconsFramework.GetSettings().replaceMismatchedBaseIcons = value
    AbilityIconsFramework.ReplaceMismatchedIcons()
    AbilityIconsFramework.UpdateAllSlots()
end

--- Set the setting for enabling heroism potion icons to on/off
--- @param value boolean
function AbilityIconsFramework.SetHeroismPotionIconsEnabled(value)
    AbilityIconsFramework.GetSettings().enableHeroismPotionIcons = value
    AbilityIconsFramework.UpdateAllSlots()
end


--- Set the setting for fixing vAS combat tips (permanently enabled)
--- @param value? boolean
function AbilityIconsFramework.SetOptionFixVas(value)
    local settings = AbilityIconsFramework.GetSettings()
    if settings then
        settings.fixVas = true
    end
    AbilityIconsFramework.ApplyFixVas()
end

