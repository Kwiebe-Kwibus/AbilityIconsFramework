AbilityIconsFramework = {}
--- @class (partial) AbilityIconsFramework
local AbilityIconsFramework = AbilityIconsFramework

local FAB = FancyActionBar or nil;

------------------
-- Declarations --
------------------

local ADDON_VERSION = "120"
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
    AbilityIconsFramework:InitializeHeroismPotions()
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

    AbilityIconsFramework.UpdateDefaultScribingIcons()
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

--- Retrieves the custom icon for the Stagger ability.
--- @param slotIndex number The index of a given skill in the action bar.
--- @param hotbarCategory number The category of the hotbar in question.
--- @return string? customIcon The path of the custom icon for the Stagger ability.
function AbilityIconsFramework.GetStaggerIcon(slotIndex, hotbarCategory)
    local abilityId = AbilityIconsFramework.GetAbilityId(slotIndex, hotbarCategory)
    if abilityId == 31816 then
        return "StaggerIcon/stonefistStomp.dds"
    end
    return nil -- Return nil for all other abilities
end

--- @class (partial) AbilityIconsFramework
local AbilityIconsFramework = AbilityIconsFramework

-- Define the ability ID for the Stagger ability
local STAGGER_ABILITY_ID = 31816

-- Define the path to the custom Stagger icon
local STAGGER_ICON_PATH = "StaggerIcon/stonefistStomp.dds"

--- Applies the custom Stagger icon to both the active and inactive bars.
--- @param slotIndex number The index of a given skill in the action bar.
--- @param hotbarCategory number The category of the hotbar in question.
function AbilityIconsFramework.ApplyStaggerIcon(slotIndex, hotbarCategory)
    local abilityId = AbilityIconsFramework.GetAbilityId(slotIndex, hotbarCategory)
    if abilityId == STAGGER_ABILITY_ID then
        -- Apply the custom icon to the active bar
        local activeBtn = ZO_ActionBar_GetButton(slotIndex, hotbarCategory)
        if activeBtn and activeBtn.icon then
            activeBtn.icon:SetTexture(STAGGER_ICON_PATH)
        end

        -- Apply the custom icon to the inactive bar
        local inactiveHotbarCategory = hotbarCategory == HOTBAR_CATEGORY_PRIMARY and HOTBAR_CATEGORY_BACKUP or HOTBAR_CATEGORY_PRIMARY
        local inactiveSlotIndex = slotIndex + AbilityIconsFramework.SLOT_INDEX_OFFSET
        local inactiveBtn = ZO_ActionBar_GetButton(inactiveSlotIndex, inactiveHotbarCategory)
        if inactiveBtn and inactiveBtn.icon then
            inactiveBtn.icon:SetTexture(STAGGER_ICON_PATH)
        end
    end
end

--- Delayed function to apply the Stagger icon after FAB has processed the buttons.
--- @param slotIndex number The index of a given skill in the action bar.
--- @param hotbarCategory number The category of the hotbar in question.
function AbilityIconsFramework.DelayedApplyStaggerIcon(slotIndex, hotbarCategory)
    zo_callLater(function()
        AbilityIconsFramework.ApplyStaggerIcon(slotIndex, hotbarCategory)
    end) -- Delay of 50ms to ensure FAB has processed the buttons
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
            -- Apply the Stagger icon to both the active and inactive bars after FAB has processed the buttons
            AbilityIconsFramework.DelayedApplyStaggerIcon(slotIndex, hotbarCategory)

            -- Fall back to the default logic for other abilities
            AbilityIconsFramework.ApplySkillStyle(slotIndex, hotbarCategory)
        end
    end
end

--- Triggered when hotbars are updated, after the "GetSlotTexture" SecurePostHook.
function AbilityIconsFramework.OnAllHotbarsUpdated()
    local activeHotbarCategory = GetActiveHotbarCategory()
    for slotIndex = AbilityIconsFramework.MIN_INDEX, AbilityIconsFramework.MAX_INDEX do
        -- Apply the Stagger icon to both the active and inactive bars after FAB has processed the buttons
        AbilityIconsFramework.DelayedApplyStaggerIcon(slotIndex, activeHotbarCategory)

        -- Fall back to the default logic for other abilities
        AbilityIconsFramework.ApplySkillStyle(slotIndex, activeHotbarCategory)
    end
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
        -- Check for the Stagger icon first
        local staggerIcon = AbilityIconsFramework.GetStaggerIcon(slotIndex, hotbarCategory)
        if staggerIcon then
            return staggerIcon, nil, nil -- Return the custom icon for Stagger
        end

        -- Fall back to the default icon retrieval logic
        local newIcon = AbilityIconsFramework.GetSkillStyleIcon(slotIndex, hotbarCategory) 
                        or AbilityIconsFramework.GetCustomAbilityIcon(slotIndex, hotbarCategory)
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