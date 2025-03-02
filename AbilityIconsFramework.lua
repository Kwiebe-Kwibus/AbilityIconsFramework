AbilityIconsFramework = {}

--- @class (partial) AbilityIconsFramework
local AbilityIconsFramework = AbilityIconsFramework

local FAB = FancyActionBar or nil;

------------------
-- Declarations --
------------------

local ADDON_VERSION = "1.0"
local EVENT_MANAGER = EVENT_MANAGER
local GetActiveHotbarCategory = GetActiveHotbarCategory
local GetSlotTexture = GetSlotTexture
local HOTBAR_CATEGORY_PRIMARY = HOTBAR_CATEGORY_PRIMARY
local HOTBAR_CATEGORY_BACKUP = HOTBAR_CATEGORY_BACKUP
local HOTBAR_CATEGORY_WEREWOLF = HOTBAR_CATEGORY_WEREWOLF

AbilityIconsFramework.version = ADDON_VERSION
AbilityIconsFramework.name = "AbilityIconsFramework"

---------------
-- Functions --
---------------

--- Initializes the saved variables and replaces mismatched base skill icons, if the saved variables dictate it.
function AbilityIconsFramework.Initialize()
    AbilityIconsFramework.InitializeSettings()
    AbilityIconsFramework.ReplaceMismatchedIcons()
end

function AbilityIconsFramework.GetFAB()
    return FAB;
end

--- Helper function to apply skill styles for all relevant slots.
--- @param hotbarCategory number The category of the hotbar to apply styles to.
function AbilityIconsFramework.ApplySkillStyles(hotbarCategory)
    for index = AbilityIconsFramework.MIN_INDEX, AbilityIconsFramework.MAX_INDEX do
        AbilityIconsFramework.ApplySkillStyle(index, hotbarCategory)
    end
end

local function ApplyIconPackChanges()

    if AbilityIconsFramework:GetSettings().replaceMismatchedBaseIcons then
        AbilityIconsFramework.SetOptionMismatchedIcons(false)
        AbilityIconsFramework.SetOptionMismatchedIcons(true)
    end
    if AbilityIconsFramework:GetSettings().showCustomScribeIcons then
        AbilityIconsFramework.SetOptionCustomIcons(false)
        AbilityIconsFramework.SetOptionCustomIcons(true)
    end

    AbilityIconsFramework.ReplaceMismatchedIcons()
end

function AbilityIconsFramework.AddCustomIconPack( PackDirectory, PackIcons )
    AbilityIconsFramework.ICON_PACKS[PackDirectory] = PackIcons

    local settings = AbilityIconsFramework:GetSettings()
    for _, iconName in ipairs(PackIcons) do
        settings.mismatchedIcons[iconName] = true
    end
end

------------
-- Events --
------------

--- Triggered on initial player load, or reloadUI.
--- @param _ any
--- @param isFirstLoad boolean True if it's the first time the UI loads, false otherwise.
function AbilityIconsFramework.OnPlayerActivated(_, isFirstLoad)
    AbilityIconsFramework.ApplySkillStyles(GetActiveHotbarCategory())
    FAB = FancyActionBar
end

--- Triggered when the player switches hotbars, after the "GetSlotTexture" SecurePostHook.
--- @param _ any
--- @param slotIndex number The index of a given skill in the action bar.
--- @param hotbarCategory number The category of the hotbar that triggered the event.
function AbilityIconsFramework.OnHotbarSlotStateUpdated(_, slotIndex, hotbarCategory)
    if slotIndex >= AbilityIconsFramework.MIN_INDEX and slotIndex <= AbilityIconsFramework.MAX_INDEX then
        local activeHotbarCategory = GetActiveHotbarCategory()
        if hotbarCategory == activeHotbarCategory and (hotbarCategory == HOTBAR_CATEGORY_PRIMARY or hotbarCategory == HOTBAR_CATEGORY_BACKUP or hotbarCategory == HOTBAR_CATEGORY_WEREWOLF) then
            AbilityIconsFramework.ApplySkillStyle(slotIndex, hotbarCategory)
        end
    end
end

--- Triggered when hotbars are updated, after the "GetSlotTexture" SecurePostHook.
function AbilityIconsFramework.OnAllHotbarsUpdated()
    AbilityIconsFramework.ApplySkillStyles(GetActiveHotbarCategory())
end

--- To be used in any event when the skill icons need to be refreshed.
--- @param _ any
--- @param collectibleId any
function AbilityIconsFramework.OnCollectibleUpdated(_, collectibleId)
    AbilityIconsFramework.ApplySkillStyles(GetActiveHotbarCategory())
end

--- Local alias for GetSlotTexture, introduced to avoid overflowing the stack due to mutual recursion between
--- GetSlotTexture and its SecurePostHook.
local originalGetSlotTexture = GetSlotTexture
SecurePostHook("GetSlotTexture", function(slotIndex, hotbarCategory)
    if hotbarCategory and slotIndex >= AbilityIconsFramework.MIN_INDEX and slotIndex <= AbilityIconsFramework.MAX_INDEX and (hotbarCategory == HOTBAR_CATEGORY_PRIMARY or hotbarCategory == HOTBAR_CATEGORY_BACKUP or hotbarCategory == HOTBAR_CATEGORY_WEREWOLF) then
        local newIcon = AbilityIconsFramework.GetSkillStyleIcon(slotIndex, hotbarCategory) or AbilityIconsFramework.GetCustomAbilityIcon(slotIndex, hotbarCategory)
        local icon, weaponIcon, activationAnimation = originalGetSlotTexture(slotIndex, hotbarCategory)
        if newIcon then
            icon = newIcon
        end
        return icon, weaponIcon, activationAnimation
    end
    return originalGetSlotTexture(slotIndex, hotbarCategory)
end)

--- To be used during game initialization. Code contained in this method needs to run conditionally, for this addon only.
--- @param eventCode any
--- @param addOnName any
function AbilityIconsFramework.OnAddOnLoaded(eventCode, addOnName)
    if addOnName == AbilityIconsFramework.name then
        EVENT_MANAGER:RegisterForEvent(AbilityIconsFramework.name, EVENT_COLLECTIBLE_UPDATED, AbilityIconsFramework.OnCollectibleUpdated)
        EVENT_MANAGER:RegisterForEvent(AbilityIconsFramework.name, EVENT_HOTBAR_SLOT_STATE_UPDATED, AbilityIconsFramework.OnHotbarSlotStateUpdated)
        EVENT_MANAGER:RegisterForEvent(AbilityIconsFramework.name, EVENT_PLAYER_ACTIVATED, AbilityIconsFramework.OnPlayerActivated)
        EVENT_MANAGER:RegisterForEvent(AbilityIconsFramework.name, EVENT_ACTION_SLOTS_ALL_HOTBARS_UPDATED, AbilityIconsFramework.OnAllHotbarsUpdated)

        -- Unregister the event as our addon was loaded and we do not need it to be run for every other addon that will load
        EVENT_MANAGER:UnregisterForEvent(AbilityIconsFramework.name, EVENT_ADD_ON_LOADED)

        AbilityIconsFramework.CreateSlashCommands()
        AbilityIconsFramework.Initialize()

        zo_callLater(function()
            ApplyIconPackChanges(bUpdateBaseGameIcons, bUpdateScribingIcons)
        end, 500)
    end
end

----------
-- Main --
----------

EVENT_MANAGER:RegisterForEvent(AbilityIconsFramework.name, EVENT_ADD_ON_LOADED, AbilityIconsFramework.OnAddOnLoaded)