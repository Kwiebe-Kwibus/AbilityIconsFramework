-- Ability Icons Framework (AIF) - Utilities
-- Helper routines for inspecting ability IDs, hotbars, and redirecting textures in ESO's engine.
--- @class (partial) AbilityIconsFramework
AbilityIconsFramework = AbilityIconsFramework or {}
local AbilityIconsFramework = AbilityIconsFramework

-- Do not allow any icon pack or base-game replacement to redirect this specific icon
local STAGGER_STOMP_BASE_ICON = "/esoui/art/icons/ability_dragonknight_013_a_stomp.dds"

-----------------------------
-- Action Bar Slot Helpers --
-----------------------------

--- Retrieves the root/base ability ID of a skill (unmorphed version).
--- Essential because morphs have unique IDs, but icon packs often target the base skill.
--- @param slotIndex number The action bar slot index (3-8).
--- @param hotbarCategory number The active hotbar category (Primary, Backup, etc.).
--- @return number? baseAbilityId The root ability ID, or nil if empty.
function AbilityIconsFramework.GetBaseAbilityId(slotIndex, hotbarCategory)
    local abilityId = AbilityIconsFramework.GetAbilityId(slotIndex, hotbarCategory)
    if not abilityId then return nil end

    local actionType = GetSlotType(slotIndex, hotbarCategory)
    if actionType == ACTION_TYPE_CRAFTED_ABILITY then
        return GetAbilityIdForCraftedAbilityId(abilityId)
    end

    local progressionData = SKILLS_DATA_MANAGER:GetProgressionDataByAbilityId(abilityId)
    if not progressionData then return abilityId end

    local skillData = progressionData:GetSkillData()
    if not skillData.GetMorphData then return abilityId end

    local baseMorphData = skillData:GetMorphData(MORPH_SLOT_BASE)
    return baseMorphData and baseMorphData:GetAbilityId() or abilityId
end

--- Retrieves the raw ability ID bound to an action bar slot.
--- @param slotIndex number The slot index (3-8).
--- @param hotbarCategory number The hotbar category.
--- @return number? abilityId The bound ability ID.
function AbilityIconsFramework.GetAbilityId(slotIndex, hotbarCategory)
    local index = tonumber(slotIndex) or 0
    if index < AbilityIconsFramework.MIN_INDEX or index > AbilityIconsFramework.MAX_INDEX then
        return nil
    end

    return GetSlotBoundId(slotIndex, hotbarCategory)
end

---------------------------------
-- Texture Redirection Helpers --
---------------------------------

--- Iterates through configured texture replacements
--- via RedirectTexture() to swap old blurry textures for HD replacements.
function AbilityIconsFramework.ReplaceMismatchedIcons()
    local doReplace = AbilityIconsFramework.GetSettings().replaceMismatchedBaseIcons

    for key, value in pairs(AbilityIconsFramework.BASE_GAME_ICONS_TO_REPLACE) do
        -- Never redirect the stagger stomp icon, and skip scribing icons here (handled separately).
        if key ~= STAGGER_STOMP_BASE_ICON and AbilityIconsFramework.CUSTOM_ABILITY_ICONS[key] == nil then
            if doReplace then
                RedirectTexture(key, value)
            else
                RedirectTexture(key, key) -- Restores vanilla texture
            end
        end
    end

    -- Safety: always guarantee Stagger Stomp stays on its vanilla track
    RedirectTexture(STAGGER_STOMP_BASE_ICON, STAGGER_STOMP_BASE_ICON)
end

--- Resets all redirected textures back to vanilla defaults (cleans up disabled packs).
function AbilityIconsFramework.ResetAllTextureRedirects()
    for key, _ in pairs(AbilityIconsFramework.BASE_GAME_ICONS_TO_REPLACE) do
        RedirectTexture(key, key)
    end

    -- Extra safety
    RedirectTexture(STAGGER_STOMP_BASE_ICON, STAGGER_STOMP_BASE_ICON)
end
