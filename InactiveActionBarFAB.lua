--- @class (partial) AbilityIconsFramework
local AbilityIconsFramework = AbilityIconsFramework

-- Define the ability ID for the Stagger ability
local STAGGER_ABILITY_ID = 31816

-- Define the path to the custom Stagger icon
local STAGGER_ICON_PATH = "AbilityIconsFramework/StaggerIcon/stonefistStomp.dds"

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

--local FAB = FancyActionBar

--- Applies the active skill style for the skill found in the specified slotIndex
--- to the corresponding slot on both the active and inactive action bars.
--- @param slotIndex number The index of a given skill in the action bar.
--- @param hotbarCategory number The category of the hotbar in question.
function AbilityIconsFramework.ApplySkillStyleInactiveFAB(slotIndex, hotbarCategory)
    -- Apply the Stagger icon to both the active and inactive bars
    AbilityIconsFramework.ApplyStaggerIcon(slotIndex, hotbarCategory)

    -- Fall back to the default logic for other abilities
    local icon = AbilityIconsFramework.GetSkillStyleIcon(slotIndex, hotbarCategory)
                 or AbilityIconsFramework.GetCustomAbilityIcon(slotIndex, hotbarCategory)
    if icon then
        -- Apply to the inactive bar
        local inactiveSlotIndex = slotIndex + AbilityIconsFramework.SLOT_INDEX_OFFSET
        AbilityIconsFramework.ReplaceAbilityBarIcon(inactiveSlotIndex, hotbarCategory, icon)

        -- Apply to the active bar
        AbilityIconsFramework.ReplaceAbilityBarIcon(slotIndex, hotbarCategory, icon)
    end
end

--- Decides whether icon replacement should take place or not. The only reason not to perform it, is if we've been asked to draw
--- the icons of the inactive action bar and the inactive weapon is a destruction staff.
--- @param hotbarCategory number The category of the hotbar in question.
--- @return boolean skipIconReplacement True if AbilityIconsFramework should not perform icon replacement. False otherwise.
function AbilityIconsFramework.SkipSkillIconReplacement(hotbarCategory)
    local result = false
    local activeHotbarCategory = GetActiveHotbarCategory()
    local inactiveWeapon = nil
    if activeHotbarCategory ~= hotbarCategory then
        if hotbarCategory == HOTBAR_CATEGORY_BACKUP then
            inactiveWeapon = GetItemLinkWeaponType(GetItemLink(BAG_WORN, EQUIP_SLOT_BACKUP_MAIN, LINK_STYLE_DEFAULT))
        else
            inactiveWeapon = GetItemLinkWeaponType(GetItemLink(BAG_WORN, EQUIP_SLOT_MAIN_HAND, LINK_STYLE_DEFAULT))
        end
    end
    if inactiveWeapon == WEAPONTYPE_FIRE_STAFF
       or inactiveWeapon == WEAPONTYPE_FROST_STAFF
       or inactiveWeapon == WEAPONTYPE_LIGHTNING_STAFF then
        result = true
    end
    return result
end

--- Retrieves the inactive action bar button corresponding to the specified slotIndex, provided that
--- FancyActionBar+ is available.
--- @param slotIndex number The index of a given skill in the action bar.
--- @return any btn The inactive bar button correspondign to the specified slotIndex.
function AbilityIconsFramework.GetInactiveBarButtonFAB(slotIndex)
    local FAB = AbilityIconsFramework.GetFAB()
    if FAB
       and slotIndex >= AbilityIconsFramework.SLOT_INDEX_OFFSET + AbilityIconsFramework.MIN_INDEX
       and slotIndex <= AbilityIconsFramework.SLOT_INDEX_OFFSET + AbilityIconsFramework.MAX_INDEX
    then
        if FAB.buttons then
            return FAB.buttons[slotIndex]
        else 
            if FAB.GetActionButton then
                return FAB.GetActionButton(slotIndex)
            else 
                return nil
            end
        end
    else
        return nil
    end
end