-- Ability Icons Framework (AIF) - Core Engine
-- Coordinates icon replacements, Scribing textures, third-party action bar updates,
-- and fixes visual glitches (like the infamous Veteran Asylum Sanctorium tip icon bug).
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

--- Fixes an infamous base-game bug where the Asylum Sanctorium combat tip icon
--- expands to elephantine proportions and obscures the center of your screen.
function AbilityIconsFramework.ApplyFixVas()
    if ZO_ActiveCombatTipsTipIcon then
        ZO_ActiveCombatTipsTipIcon:SetDimensionConstraints(64, 64, 64, 64)
    end
end

--- Main initialization sequence: builds sort orders, applies icon replacements,
--- connects Heroism Potion hooks, and refreshes the player's action bars.
function AbilityIconsFramework.Initialize()
    AbilityIconsFramework.ResetAllTextureRedirects() -- Clean slate in case an icon pack was removed

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

    -- Completely reset all base game redirects in case there were changes in loaded icon packs
    AbilityIconsFramework.SetOptionMismatchedIcons(false)
    AbilityIconsFramework.SetOptionMismatchedIcons(true)

    -- Synchronize custom scribed skill textures with action bars
    AbilityIconsFramework.OnScribingUpdate()

    AbilityIconsFramework.isInitialized = true
end

------------
-- Events --
------------

-- Signals ESO's ActionButton controller to repaint a given slot
function AbilityIconsFramework.HandleSlotChanged(actionSlotIndex, hotbarCategory)
    local btn = ZO_ActionBar_GetButton(actionSlotIndex, hotbarCategory)
    if btn and btn.HandleSlotChanged then
        btn:HandleSlotChanged(hotbarCategory)
    end
end

--- Force-updates action bar icons across Vanilla UI, FancyActionBar+, and classic FancyActionBar
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

--- Addon startup handler
function AbilityIconsFramework.OnAddOnLoaded(eventCode, addOnName)
    if addOnName == AbilityIconsFramework.name then
        EVENT_MANAGER:UnregisterForEvent(AbilityIconsFramework.name, EVENT_ADD_ON_LOADED)

        AbilityIconsFramework.CreateSlashCommands()

        -- Slight 250ms breather to let third-party icon packs register their tables first
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

        -- Re-apply scribed icons whenever you finish crafting a new Grimoire at the Scribing altar
        CALLBACK_MANAGER:RegisterCallback("CraftingAnimationsStopped", function()
            AbilityIconsFramework.OnScribingUpdate()
        end)
    end
end

----------
-- Main --
----------

EVENT_MANAGER:RegisterForEvent(AbilityIconsFramework.name, EVENT_ADD_ON_LOADED, AbilityIconsFramework.OnAddOnLoaded)
