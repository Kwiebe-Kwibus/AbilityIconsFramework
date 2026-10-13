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

AbilityIconsFramework.MIN_INDEX = 3                  -- First ability index
AbilityIconsFramework.MAX_INDEX = 8                  -- Last ability: 7, Ultimate: 8
AbilityIconsFramework.SCRIBING_ID_KEY = "craftedAbilityId"
AbilityIconsFramework.SLOT_INDEX_OFFSET = 20         -- Offset for backbar abilities indices
AbilityIconsFramework.COMPANION_INDEX_OFFSET = 30    -- Offset for companion ultimate

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

function AbilityIconsFramework.esoIcon(name)
    return ESO_ROOT .. name
end

function AbilityIconsFramework.addonIcon(name)
    return baseIconsPath .. name
end

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
