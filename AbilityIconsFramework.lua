--- @class (partial) AbilityIconsFramework
AbilityIconsFramework = AbilityIconsFramework or {}

local AbilityIconsFramework = AbilityIconsFramework

------------------
-- Declarations --
------------------

local ADDON_VERSION = "2.0"

AbilityIconsFramework.version = ADDON_VERSION
AbilityIconsFramework.name = "AbilityIconsFramework"

---------------
-- Functions --
---------------

--- Applies the vAS 64x64 dimension constraints to the combat tips icon (permanently enabled).
function AbilityIconsFramework.ApplyFixVas()
    if ZO_ActiveCombatTipsTipIcon then
        ZO_ActiveCombatTipsTipIcon:SetDimensionConstraints(64, 64, 64, 64)
    end
end

--- Initializes the saved variables and replaces mismatched base skill icons, if the saved variables dictate it.
function AbilityIconsFramework.Initialize()
    AbilityIconsFramework.ResetAllTextureRedirects() -- reset in case we had some icon pack disabled

    AbilityIconsFramework.InitializeSettings()
    AbilityIconsFramework.ProcessEarlyIconPacks()

    AbilityIconsFramework.ApplyFixVas()

    -- Normalize load orders and build sort entries before applying icon replacements
    AbilityIconsFramework.InitializeSortOrderEntries()

    AbilityIconsFramework.GenerateReplacementLists()
    AbilityIconsFramework.ReplaceMismatchedIcons()
    AbilityIconsFramework.UpdateDefaultScribingIcons()

    if AbilityIconsFramework.InitializeHeroismPotions then
        AbilityIconsFramework.InitializeHeroismPotions()
    end

    AbilityIconsFramework.UpdateAllSlots()

    -- completely reset all base game redirects in case there were changes in loaded icon packs
    AbilityIconsFramework.SetOptionMismatchedIcons(false)
    AbilityIconsFramework.SetOptionMismatchedIcons(true)

    -- Already has UpdateAllSlots() inside it
    AbilityIconsFramework.OnScribingUpdate()

    AbilityIconsFramework.isInitialized = true
end

------------
-- Events --
------------

function AbilityIconsFramework.HandleSlotChanged(actionSlotIndex, hotbarCategory)
    local btn = ZO_ActionBar_GetButton(actionSlotIndex, hotbarCategory)
    if btn and btn.HandleSlotChanged then
        btn:HandleSlotChanged(hotbarCategory)
    end
end

-- Force-updates action bar icons across Vanilla UI, FancyActionBar+, and FancyActionBar
function AbilityIconsFramework.UpdateAllSlots()
    local activeHotbarCategory = GetActiveHotbarCategory()
    local inactiveHotbarCategory = activeHotbarCategory == HOTBAR_CATEGORY_BACKUP and HOTBAR_CATEGORY_PRIMARY or HOTBAR_CATEGORY_BACKUP

    -- 1. Base Game Action Bars (Vanilla UI & active bar of FancyActionBar / FancyActionBar+)
    for slotIndex = AbilityIconsFramework.MIN_INDEX, AbilityIconsFramework.MAX_INDEX do
        AbilityIconsFramework.HandleSlotChanged(slotIndex, activeHotbarCategory)
        AbilityIconsFramework.HandleSlotChanged(slotIndex, inactiveHotbarCategory)
    end

    -- 2. FancyActionBar+ & FancyActionBar inactive/backbar buttons compatibility
    if FancyActionBar then
        if type(FancyActionBar.PaintAbilityOverlays) == "function" then
            FancyActionBar.PaintAbilityOverlays(nil, activeHotbarCategory)
            if type(FancyActionBar.RefreshActiveBarIconVisuals) == "function" then
                FancyActionBar.RefreshActiveBarIconVisuals()
            end
        elseif AbilityIconsFramework.UpdateInactiveBarButtonFAB then
            for slotIndex = AbilityIconsFramework.MIN_INDEX, AbilityIconsFramework.MAX_INDEX do
                AbilityIconsFramework.UpdateInactiveBarButtonFAB(slotIndex, inactiveHotbarCategory)
            end
        end
    end
end

--- To be used during game initialization. Code contained in this method needs to run conditionally, for this addon only.
--- @param eventCode any
--- @param addOnName any
function AbilityIconsFramework.OnAddOnLoaded(eventCode, addOnName)
    if addOnName == AbilityIconsFramework.name then
        EVENT_MANAGER:UnregisterForEvent(AbilityIconsFramework.name, EVENT_ADD_ON_LOADED)

        AbilityIconsFramework.CreateSlashCommands()

        -- Slight delay to let any dependent icon packs finish registering
        zo_callLater(function()
            AbilityIconsFramework.Initialize()
        end, 250)

        -- Ensure slots are refreshed once player enters world and UI is fully instantiated
        EVENT_MANAGER:RegisterForEvent(AbilityIconsFramework.name .. "_PlayerActivated", EVENT_PLAYER_ACTIVATED, function()
            EVENT_MANAGER:UnregisterForEvent(AbilityIconsFramework.name .. "_PlayerActivated", EVENT_PLAYER_ACTIVATED)
            AbilityIconsFramework.UpdateAllSlots()
            AbilityIconsFramework.ApplyFixVas()

            -- Deferred update to ensure third-party action bar addons (like FancyActionBar+)
            -- have fully completed their first zone layout
            zo_callLater(function()
                AbilityIconsFramework.UpdateAllSlots()
            end, 100)
        end)

        -- Event firing when scribing craft completes - so we update scribing icons
        CALLBACK_MANAGER:RegisterCallback("CraftingAnimationsStopped", function()
            AbilityIconsFramework.OnScribingUpdate()
        end)
    end
end

----------
-- Main --
----------

EVENT_MANAGER:RegisterForEvent(AbilityIconsFramework.name, EVENT_ADD_ON_LOADED, AbilityIconsFramework.OnAddOnLoaded)