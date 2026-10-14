-- Ability Icons Framework (AIF) - Config
-- Central configuration, global constants, icon path resolvers, and default templates.
-- Where magic file paths go so we never have to type "/esoui/art/icons/" fifty times in a row.
--- @class (partial) AbilityIconsFramework
AbilityIconsFramework = AbilityIconsFramework or {}
local AbilityIconsFramework = AbilityIconsFramework

-----------------
-- SV Version --
-----------------

AbilityIconsFramework.SAVEDVARIABLES_VERSION = 1.5

---------------
-- Constants --
---------------

AbilityIconsFramework.MIN_INDEX = 3                  -- First ability index on ESO action bars (Slot 1 = key 3)
AbilityIconsFramework.MAX_INDEX = 8                  -- Last regular ability: 7 (Slot 5), Ultimate: 8
AbilityIconsFramework.SCRIBING_ID_KEY = "craftedAbilityId"
AbilityIconsFramework.SLOT_INDEX_OFFSET = 20         -- Offset for FancyActionBar backbar ability indices (23-28)
AbilityIconsFramework.COMPANION_INDEX_OFFSET = 30    -- Offset for companion ultimate slotting

------------------
-- State Tables --
------------------

AbilityIconsFramework.ENABLED_ICON_PACKS = {}
AbilityIconsFramework.BASE_GAME_ICONS_TO_REPLACE = {}
AbilityIconsFramework.CUSTOM_ABILITY_ICONS = {}

--------------------
-- Path Shortcuts --
--------------------

local ESO_ROOT = "/esoui/art/icons/"
local ADDON_ROOT = "/AbilityIconsFramework/icons/"
local baseIconsPath = "/AbilityIconsFramework/icons/256/"

-- Resolves a filename to the game's internal vanilla icons directory
function AbilityIconsFramework.esoIcon(name)
    return ESO_ROOT .. name
end

-- Resolves a filename to this framework's high-res asset folder
function AbilityIconsFramework.addonIcon(name)
    return baseIconsPath .. name
end

-- Updates the active icon resolution (e.g. 128px vs 256px) based on user graphics preference
function AbilityIconsFramework.InitBaseIconsPath()
    baseIconsPath = ADDON_ROOT .. tostring(AbilityIconsFramework.GetSettings().resolution) .. "/"
end

-----------------------------
-- Configuration Templates --
-----------------------------

AbilityIconsFramework.DEFAULT_ADDON_CONFIG = {
    version = AbilityIconsFramework.SAVEDVARIABLES_VERSION,
    saveSettingsGlobally = true,
}
