--- @class (partial) AbilityIconsFramework
AbilityIconsFramework = AbilityIconsFramework or {}
local AbilityIconsFramework = AbilityIconsFramework

-- Do not allow any icon pack / base-game replacement to redirect this one.
local STAGGER_STOMP_BASE_ICON = "/esoui/art/icons/ability_dragonknight_013_a_stomp.dds"

-----------------------------
-- Action Bar Slot Helpers --
-----------------------------

--- Retrieves the base ability id of the skill with the specified ability id.
--- @param slotIndex number The index of a given skill in the action bar.
--- @param hotbarCategory number The category of the hotbar in question.
--- @return number? baseAbilityId The base ability id of the specified skill.
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

--- Retrieves the ability id of the skill found in the specified slotIndex.
--- @param slotIndex number The index of a given skill in the action bar.
--- @param hotbarCategory number The category of the hotbar in question.
--- @return number? abilityId The ability id that corresponds to the skill in question.
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

--- Calls RedirectTexture to replace an existing skill icon with a different one.
function AbilityIconsFramework.ReplaceMismatchedIcons()
    local doReplace = AbilityIconsFramework.GetSettings().replaceMismatchedBaseIcons

    for key, value in pairs(AbilityIconsFramework.BASE_GAME_ICONS_TO_REPLACE) do
        -- Never redirect the stagger stomp icon, and skip scribing icons here.
        if key ~= STAGGER_STOMP_BASE_ICON and AbilityIconsFramework.CUSTOM_ABILITY_ICONS[key] == nil then
            if doReplace then
                RedirectTexture(key, value)
            else
                RedirectTexture(key, key)
            end
        end
    end

    -- Safety: always restore it (even if something else attempted to redirect it earlier).
    RedirectTexture(STAGGER_STOMP_BASE_ICON, STAGGER_STOMP_BASE_ICON)
end

function AbilityIconsFramework.ResetAllTextureRedirects()
    for key, _ in pairs(AbilityIconsFramework.BASE_GAME_ICONS_TO_REPLACE) do
        RedirectTexture(key, key)
    end

    -- Extra safety
    RedirectTexture(STAGGER_STOMP_BASE_ICON, STAGGER_STOMP_BASE_ICON)
end
