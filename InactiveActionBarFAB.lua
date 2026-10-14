-- Ability Icons Framework (AIF) - Inactive Action Bar Compatibility
-- Bridges icon updates directly into FancyActionBar and FancyActionBar+ backbars.
-- Because players who play with backbars deserve to see their custom icons too.
--- @class (partial) AbilityIconsFramework
local AbilityIconsFramework = AbilityIconsFramework or {}

--- Retrieves the inactive action bar button corresponding to the specified slotIndex,
--- compatible with both FancyActionBar+ and classic FancyActionBar.
--- @param slotIndex number The slot index (3-8) or backbar physical index (23-28).
--- @return any btn The inactive bar button control, or nil.
function AbilityIconsFramework.GetInactiveBarButtonFAB(slotIndex)
    if not FancyActionBar then return nil end

    local physicalIndex = tonumber(slotIndex) or 0
    if physicalIndex >= AbilityIconsFramework.MIN_INDEX and physicalIndex <= AbilityIconsFramework.MAX_INDEX then
        physicalIndex = physicalIndex + AbilityIconsFramework.SLOT_INDEX_OFFSET
    end

    -- FancyActionBar+ provides GetActionButton(physicalIndex)
    if FancyActionBar.GetActionButton then
        return FancyActionBar.GetActionButton(physicalIndex)
    -- Classic FancyActionBar stores backbar buttons in FancyActionBar.buttons
    elseif FancyActionBar.buttons then
        return FancyActionBar.buttons[physicalIndex]
    end

    return nil
end

--- Updates the texture and state of an inactive/backbar action button for FancyActionBar or FancyActionBar+.
--- @param slotIndex number The ability slot index (3-8).
--- @param inactiveHotbarCategory number The inactive hotbar category.
function AbilityIconsFramework.UpdateInactiveBarButtonFAB(slotIndex, inactiveHotbarCategory)
    local btn = AbilityIconsFramework.GetInactiveBarButtonFAB(slotIndex)
    if not btn then return end

    -- NOTE: Never call btn:HandleSlotChanged() on backbar buttons!
    -- Backbar buttons in FancyActionBar/FancyActionBar+ use physical indices (23-28).
    -- Calling ESO's ActionButton:HandleSlotChanged() on slot > 8 causes ESO's engine
    -- to evaluate GetSlotType() as ACTION_TYPE_NOTHING and run self:Clear(), wiping
    -- the button texture and setting it hidden. We manually set the texture instead.
    if btn.icon and btn.icon.SetTexture then
        local boundId = nil
        if FancyActionBar.GetSlotTrueBoundId then
            boundId = FancyActionBar.GetSlotTrueBoundId(slotIndex, inactiveHotbarCategory)
        elseif FancyActionBar.GetSlotBoundAbilityId then
            boundId = FancyActionBar.GetSlotBoundAbilityId(slotIndex, inactiveHotbarCategory)
        else
            boundId = GetSlotBoundId(slotIndex, inactiveHotbarCategory)
        end
        if boundId and boundId > 0 then
            local icon = GetAbilityIcon(boundId)
            if icon and icon ~= "" then
                btn.icon:SetTexture(icon)
                btn.icon:SetHidden(false)
            end
        else
            btn.icon:SetHidden(true)
        end
    end
end
