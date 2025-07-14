AbilityIconsFramework = {}
--- @class (partial) AbilityIconsFramework
local AbilityIconsFramework = AbilityIconsFramework

------------------
-- Declarations --
------------------

local ADDON_VERSION = "132"

AbilityIconsFramework.version = ADDON_VERSION
AbilityIconsFramework.name = "AbilityIconsFramework"

-- Skill slot object with stagger equipped - if there is one. nil otherwise

-- Define the ability ID for the Stagger ability
local STAGGER_ABILITY_ID = 31816

-- Key to use to get an actual addon icon from the BASE_GAME_ICONS_TO_REPLACE list
local STAGGER_ICON_KEY = "/esoui/art/icons/ability_dragonknight_013_a_stomp.dds"
---------------
-- Functions --
---------------

--- Initializes the saved variables and replaces mismatched base skill icons, if the saved variables dictate it.
function AbilityIconsFramework.Initialize()
    AbilityIconsFramework.ResetAllTextureRedirects() -- reset in case we had some icon pack disabled
    AbilityIconsFramework.InitializeSettings()
    AbilityIconsFramework.GenerateReplacementLists()
    AbilityIconsFramework.ReplaceMismatchedIcons()
    AbilityIconsFramework.UpdateDefaultScribingIcons()
    AbilityIconsFramework.InitializeSortOrderEntries()
    AbilityIconsFramework:InitializeHeroismPotions()
    AbilityIconsFramework.UpdateAllSlots()
    AbilityIconsFramework.SetOptionMismatchedIcons(false)
    AbilityIconsFramework.SetOptionMismatchedIcons(true) -- completely reset all base game redirects in case there were changes in loaded icon packs
    AbilityIconsFramework.OnScribingUpdate() -- Already has UpdateAllSlots() inside it
end

function AbilityIconsFramework.AddCustomIconPack( PackDirectory, PackIcons )
    if PackDirectory == nil or PackIcons == nil or #PackIcons == 0 then
        return
    end
    AbilityIconsFramework.ENABLED_ICON_PACKS[PackDirectory] = PackIcons

    local settings = AbilityIconsFramework:GetSettings()
    -- If we already had this pack's info saved we can exit
    if settings.iconPacksData[PackDirectory] ~= nil then
        return
    end

    -- Add saved variables data about this pack
    -- Get pack's addon folder name
    local packName = PackDirectory:match("/(.*)/")
    packName = packName:match("(.*)/")
    local highestOrder = AbilityIconsFramework.GetHighestIconPackOrder()
    settings.iconPacksData[PackDirectory] =
    {
        packDisplayName = packName,
        loadOrder = highestOrder + 1,
        packExampleTexture = PackDirectory .. PackIcons[1]
    }
end

function AbilityIconsFramework.GetStaggerStompIcon()
    return AbilityIconsFramework.BASE_GAME_ICONS_TO_REPLACE[STAGGER_ICON_KEY]
end

--- @class (partial) AbilityIconsFramework
local AbilityIconsFramework = AbilityIconsFramework

------------
-- Events --
------------

function AbilityIconsFramework.OnScribingUpdate()
    if AbilityIconsFramework:GetSettings().showCustomScribeIcons then
        AbilityIconsFramework.SetOptionCustomIcons(false)
        AbilityIconsFramework.SetOptionCustomIcons(true)
    end
    AbilityIconsFramework.UpdateAllSlots()
end

function AbilityIconsFramework.HandleSlotChanged(actionSlotIndex, hotbarCategory)
    local btn = ZO_ActionBar_GetButton(actionSlotIndex, hotbarCategory)
    if btn then
        btn:HandleSlotChanged()
    end
end

-- Here we check for skill slots updates to refresh stagger stomp icon on FAB's inactive bar 
function AbilityIconsFramework.OnHotbarSlotUpdated(_, actionSlotIndex, hotbarCategory)
    -- We only need this for FAB and if we actually have the stomp feature enabled
    if FancyActionBar == nil or not AbilityIconsFramework:GetSettings().enableStaggerStompIcon then
        return
    end
    -- We only care about inactive bar
    if hotbarCategory == GetActiveHotbarCategory() then
        return
    end
    -- We only need it to update stagger stomp icon
    local abilityId = GetSlotBoundId(actionSlotIndex, hotbarCategory)
    if abilityId ~= STAGGER_ABILITY_ID then
        return
    end
    -- When all conditions are met - update FAB inactive bar icon
    local btnBack = FancyActionBar.GetActionButton(actionSlotIndex + AbilityIconsFramework.SLOT_INDEX_OFFSET)
    if btnBack ~= nil then
        btnBack.icon:SetTexture(AbilityIconsFramework.GetStaggerStompIcon())
    end
end

-- This function not only triggers action bar icons update, but has a side-effect of force-updating any other pending texture redirects
function AbilityIconsFramework.UpdateAllSlots()
    -- Iterate over active skill bar slots to update
    local activeHotbarCategory = GetActiveHotbarCategory()
    local inactiveHotbarCategory = activeHotbarCategory == HOTBAR_CATEGORY_BACKUP and HOTBAR_CATEGORY_PRIMARY or HOTBAR_CATEGORY_BACKUP
    for slotIndex = AbilityIconsFramework.MIN_INDEX, AbilityIconsFramework.MAX_INDEX do
        -- Update base game action bars
        AbilityIconsFramework.HandleSlotChanged(slotIndex, activeHotbarCategory)
        AbilityIconsFramework.HandleSlotChanged(slotIndex, inactiveHotbarCategory)
        -- If we got FAB, update FAB back bar slots separately, since those are addon generated duplicates of the base game back bar
        if FancyActionBar ~= nil then
            local inactiveAbilityId = GetSlotBoundId(slotIndex, inactiveHotbarCategory)
            local abilityType = GetSlotType(slotIndex, inactiveHotbarCategory)
            if abilityType == ACTION_TYPE_CRAFTED_ABILITY then
                inactiveAbilityId = GetAbilityIdForCraftedAbilityId(inactiveAbilityId)
            end
            local btnBack = FancyActionBar.GetActionButton(slotIndex + AbilityIconsFramework.SLOT_INDEX_OFFSET)
            if btnBack ~= nil then
                btnBack.icon:SetTexture(GetAbilityIcon(inactiveAbilityId))
            end
        end
    end
end

-- Used by addons to get ability icons. FAB uses it to get back bar icons
local GetAbilityIconOriginal = GetAbilityIcon
GetAbilityIcon = function (abilityId)
    if not AbilityIconsFramework:GetSettings().enableStaggerStompIcon then
        return GetAbilityIconOriginal(abilityId)
    end
    if abilityId == STAGGER_ABILITY_ID then
        return AbilityIconsFramework.GetStaggerStompIcon()
    end
    return GetAbilityIconOriginal(abilityId)
end

-- Used by base game action bar to get skill icons
local GetSlotTextureOriginal = GetSlotTexture
GetSlotTexture = function (actionSlotIndex, hotbarCategory)
    if not AbilityIconsFramework:GetSettings().enableStaggerStompIcon then
        return GetSlotTextureOriginal(actionSlotIndex, hotbarCategory)
    end
    local abilityId = GetSlotBoundId(actionSlotIndex, hotbarCategory)
    if abilityId == STAGGER_ABILITY_ID then
        return AbilityIconsFramework.GetStaggerStompIcon(), nil, nil
    end
    return GetSlotTextureOriginal(actionSlotIndex, hotbarCategory)
end

--- To be used during game initialization. Code contained in this method needs to run conditionally, for this addon only.
--- @param eventCode any
--- @param addOnName any
function AbilityIconsFramework.OnAddOnLoaded(eventCode, addOnName)
    if addOnName == AbilityIconsFramework.name then

        -- Unregister the event as our addon was loaded and we do not need it to be run for every other addon that will load
        EVENT_MANAGER:UnregisterForEvent(AbilityIconsFramework.name, EVENT_ADD_ON_LOADED)

        EVENT_MANAGER:RegisterForEvent(AbilityIconsFramework.name, EVENT_HOTBAR_SLOT_UPDATED, AbilityIconsFramework.OnHotbarSlotUpdated)

        AbilityIconsFramework.CreateSlashCommands()

        -- Slight delay to let icon pack changes to be applied first
        zo_callLater(function()
            AbilityIconsFramework.Initialize()
        end, 250)

        -- Event  firing when scribing craft completes - so we might want to update scribing icons
        CALLBACK_MANAGER:RegisterCallback("CraftingAnimationsStopped", function()
            AbilityIconsFramework.OnScribingUpdate()
        end)
    end
end

----------
-- Main --
----------

EVENT_MANAGER:RegisterForEvent(AbilityIconsFramework.name, EVENT_ADD_ON_LOADED, AbilityIconsFramework.OnAddOnLoaded)