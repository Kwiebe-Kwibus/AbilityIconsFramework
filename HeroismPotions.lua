--- @class (partial) AbilityIconsFramework
local AbilityIconsFramework = AbilityIconsFramework or {}

-- Heroism Potions Configuration
AbilityIconsFramework.HEROISM_POTIONS = {
    potionItemIds = {
        [54340] = true, -- All Magicka Pots
        [54341] = true, -- All Stamina Pots
    },
    potionEffects = {
        [197919] = true, -- Restore Magicka + Restore Stamina + Heroism
        [335616] = true, -- Restore Stamina + Heroism
    },
    potions = {
        [3]   = { name = GetString(HP_POTION_NAME_3),     icon = "/AbilityIconsFramework/HeroismPotions/potion_type_001.dds" },
        [10]  = { name = GetString(HP_POTION_NAME_10),    icon = "/AbilityIconsFramework/HeroismPotions/potion_type_001.dds" },
        [20]  = { name = GetString(HP_POTION_NAME_20),    icon = "/AbilityIconsFramework/HeroismPotions/potion_type_002.dds" },
        [30]  = { name = GetString(HP_POTION_NAME_30),    icon = "/AbilityIconsFramework/HeroismPotions/potion_type_003.dds" },
        [40]  = { name = GetString(HP_POTION_NAME_40),    icon = "/AbilityIconsFramework/HeroismPotions/potion_type_004.dds" },
        [60]  = { name = GetString(HP_POTION_NAME_CP10),  icon = "/AbilityIconsFramework/HeroismPotions/potion_type_005.dds" },
        [100] = { name = GetString(HP_POTION_NAME_CP50),  icon = "/AbilityIconsFramework/HeroismPotions/potion_type_005.dds" },
        [150] = { name = GetString(HP_POTION_NAME_CP100), icon = "/AbilityIconsFramework/HeroismPotions/potion_type_005.dds" },
        [200] = { name = GetString(HP_POTION_NAME_CP150), icon = "/AbilityIconsFramework/HeroismPotions/potion_type_005.dds" },
    },
    isStationInteract = false,
    tooltipColor = "B066FF", -- Purple color for heroism potions
}

-- Fast lookup cache for itemLink -> potionData or false
local linkHeroismCache = {}

function AbilityIconsFramework.InitializePotionNames()
    AbilityIconsFramework.HEROISM_POTIONS.potions = {
        [3]   = { name = GetString(HP_POTION_NAME_3),     icon = "/AbilityIconsFramework/HeroismPotions/potion_type_001.dds" },
        [10]  = { name = GetString(HP_POTION_NAME_10),    icon = "/AbilityIconsFramework/HeroismPotions/potion_type_001.dds" },
        [20]  = { name = GetString(HP_POTION_NAME_20),    icon = "/AbilityIconsFramework/HeroismPotions/potion_type_002.dds" },
        [30]  = { name = GetString(HP_POTION_NAME_30),    icon = "/AbilityIconsFramework/HeroismPotions/potion_type_003.dds" },
        [40]  = { name = GetString(HP_POTION_NAME_40),    icon = "/AbilityIconsFramework/HeroismPotions/potion_type_004.dds" },
        [60]  = { name = GetString(HP_POTION_NAME_CP10),  icon = "/AbilityIconsFramework/HeroismPotions/potion_type_005.dds" },
        [100] = { name = GetString(HP_POTION_NAME_CP50),  icon = "/AbilityIconsFramework/HeroismPotions/potion_type_005.dds" },
        [150] = { name = GetString(HP_POTION_NAME_CP100), icon = "/AbilityIconsFramework/HeroismPotions/potion_type_005.dds" },
        [200] = { name = GetString(HP_POTION_NAME_CP150), icon = "/AbilityIconsFramework/HeroismPotions/potion_type_005.dds" },
    }
    linkHeroismCache = {}
end

-- Heroism Potions Functions
function AbilityIconsFramework.GetPotionEffectFromItemLink(itemLink)
    if not itemLink or itemLink == "" then return 0 end
    local data = itemLink:match("|H.:item:(.-)|h.-|h")
    if not data then return 0 end
    local result = select(21, zo_strsplit(":", data))
    return tonumber(result) or 0
end

function AbilityIconsFramework.FindPotion(itemLink)
    if not itemLink or itemLink == "" then return nil end

    local cached = linkHeroismCache[itemLink]
    if cached ~= nil then
        return cached or nil
    end

    local itemId = GetItemLinkItemId(itemLink)
    if not AbilityIconsFramework.HEROISM_POTIONS.potionItemIds[itemId] then
        linkHeroismCache[itemLink] = false
        return nil
    end

    local effect = AbilityIconsFramework.GetPotionEffectFromItemLink(itemLink)
    if not AbilityIconsFramework.HEROISM_POTIONS.potionEffects[effect] then
        linkHeroismCache[itemLink] = false
        return nil
    end

    local combinedLevel = (GetItemLinkRequiredLevel(itemLink) + GetItemLinkRequiredChampionPoints(itemLink))
    local potion = AbilityIconsFramework.HEROISM_POTIONS.potions[combinedLevel]
    linkHeroismCache[itemLink] = potion or false
    return potion
end

function AbilityIconsFramework.GetPotionName(itemLink)
    local potion = AbilityIconsFramework.FindPotion(itemLink)
    return potion and potion.name
end

function AbilityIconsFramework.GetPotionIcon(itemLink)
    local potion = AbilityIconsFramework.FindPotion(itemLink)
    return potion and potion.icon
end

function AbilityIconsFramework.ShouldReplacePotion(itemLink)
    if not itemLink or itemLink == "" then return false end
    if not AbilityIconsFramework.GetSettings().enableHeroismPotionIcons then return false end
    if AbilityIconsFramework.HEROISM_POTIONS.isStationInteract then return false end

    return AbilityIconsFramework.FindPotion(itemLink) ~= nil
end

-- Tooltip hooks
local tooltipFunctions = {
    ["SetBagItem"]             = GetItemLink,
    ["SetTradeItem"]           = GetTradeItemLink,
    ["SetBuybackItem"]         = GetBuybackItemLink,
    ["SetStoreItem"]           = GetStoreItemLink,
    ["SetAttachedMailItem"]    = GetAttachedItemLink,
    ["SetLootItem"]            = GetLootItemLink,
    ["SetTradingHouseItem"]    = GetTradingHouseSearchResultItemLink,
    ["SetTradingHouseListing"] = GetTradingHouseListingItemLink,
}

local function ReturnItemLink(itemLink)
    return itemLink
end

local function TooltipHook(tooltipControl, method, linkFunc)
    local origMethod = tooltipControl[method]
    if not origMethod then return end

    tooltipControl[method] = function(self, ...)
        local link = linkFunc(...)
        local isHeroism = AbilityIconsFramework.ShouldReplacePotion(link)
        local orgText = isHeroism and GetString(SI_TOOLTIP_ITEM_NAME) or nil

        if isHeroism and orgText then
            SafeAddString(SI_TOOLTIP_ITEM_NAME, "|cB066FF" .. orgText .. "|r", 1)
        end

        origMethod(self, ...)

        if isHeroism and orgText then
            SafeAddString(SI_TOOLTIP_ITEM_NAME, orgText, 1)

            local icon = AbilityIconsFramework.GetPotionIcon(link)
            if icon then
                ZO_ItemIconTooltip_OnAddGameData(self, TOOLTIP_GAME_DATA_ITEM_ICON, icon)
            end
        end
    end
end

local function InitializeTooltipHooks()
    for method, linkFunc in pairs(tooltipFunctions) do
        TooltipHook(ItemTooltip, method, linkFunc)
    end
    TooltipHook(ItemTooltip, "SetLink", ReturnItemLink)
    TooltipHook(PopupTooltip, "SetLink", ReturnItemLink)
end

-- Initialize Heroism Potions Hooks
function AbilityIconsFramework.InitializeHeroismPotions()
    if AbilityIconsFramework._heroismPotionsInitialized then return end
    AbilityIconsFramework._heroismPotionsInitialized = true

    AbilityIconsFramework.InitializePotionNames()

    -- Store original functions
    local ZO_GetItemName                         = GetItemName
    local ZO_GetItemInfo                         = GetItemInfo
    local ZO_GetItemLinkName                     = GetItemLinkName
    local ZO_GetItemLinkInfo                     = GetItemLinkInfo
    local ZO_GetSlotTexture                      = GetSlotTexture
    local ZO_GetSlotName                         = GetSlotName
    local ZO_GetTradingHouseListingItemInfo      = GetTradingHouseListingItemInfo
    local ZO_GetTradingHouseSearchResultItemInfo = GetTradingHouseSearchResultItemInfo

    -- Hook GetItemName
    GetItemName = function(bagId, slotIndex)
        local itemLink = GetItemLink(bagId, slotIndex)
        if AbilityIconsFramework.ShouldReplacePotion(itemLink) then
            local potionName = AbilityIconsFramework.GetPotionName(itemLink)
            if potionName then
                return "|cB066FF" .. potionName .. "|r"
            end
        end
        return ZO_GetItemName(bagId, slotIndex)
    end

    -- Hook GetItemInfo
    GetItemInfo = function(bagId, slotIndex)
        local itemLink = GetItemLink(bagId, slotIndex)
        if AbilityIconsFramework.ShouldReplacePotion(itemLink) then
            local icon = AbilityIconsFramework.GetPotionIcon(itemLink)
            if icon then
                local _, stack, sellPrice, meetsUsageRequirement, locked, equipType, itemStyleId, functionalQuality, displayQuality = ZO_GetItemInfo(bagId, slotIndex)
                return icon, stack, sellPrice, meetsUsageRequirement, locked, equipType, itemStyleId, functionalQuality, displayQuality
            end
        end
        return ZO_GetItemInfo(bagId, slotIndex)
    end

    -- Hook GetItemLinkName
    GetItemLinkName = function(itemLink)
        if AbilityIconsFramework.ShouldReplacePotion(itemLink) then
            local potionName = AbilityIconsFramework.GetPotionName(itemLink)
            if potionName then
                return potionName
            end
        end
        return ZO_GetItemLinkName(itemLink)
    end

    -- Hook GetItemLinkInfo
    GetItemLinkInfo = function(itemLink)
        if AbilityIconsFramework.ShouldReplacePotion(itemLink) then
            local icon = AbilityIconsFramework.GetPotionIcon(itemLink)
            if icon then
                local _, sellPrice, meetsUsageRequirement, equipType, itemStyleId = ZO_GetItemLinkInfo(itemLink)
                return icon, sellPrice, meetsUsageRequirement, equipType, itemStyleId
            end
        end
        return ZO_GetItemLinkInfo(itemLink)
    end

    -- Hook GetSlotTexture
    GetSlotTexture = function(slotIndex, hotbarCategory)
        local itemLink = GetSlotItemLink(slotIndex, hotbarCategory)
        if AbilityIconsFramework.ShouldReplacePotion(itemLink) then
            local icon = AbilityIconsFramework.GetPotionIcon(itemLink)
            if icon then return icon end
        end
        return ZO_GetSlotTexture(slotIndex, hotbarCategory)
    end

    -- Hook GetSlotName
    GetSlotName = function(slotIndex, hotbarCategory)
        local itemLink = GetSlotItemLink(slotIndex, hotbarCategory)
        if AbilityIconsFramework.ShouldReplacePotion(itemLink) then
            local potionName = AbilityIconsFramework.GetPotionName(itemLink)
            if potionName then
                return "|cB066FF" .. potionName .. "|r"
            end
        end
        return ZO_GetSlotName(slotIndex, hotbarCategory)
    end

    -- Hook GetTradingHouseListingItemInfo
    GetTradingHouseListingItemInfo = function(index)
        local itemLink = GetTradingHouseListingItemLink(index)
        if AbilityIconsFramework.ShouldReplacePotion(itemLink) then
            local potion = AbilityIconsFramework.FindPotion(itemLink)
            if potion then
                local icon, itemName, displayQuality, stackCount, sellerName, timeRemaining, salePrice, currencyType, itemUniqueId, salePricePerUnit = ZO_GetTradingHouseListingItemInfo(index)
                if potion.icon then icon = potion.icon end
                if potion.name then itemName = "|cB066FF" .. potion.name .. "|r" end
                return icon, itemName, displayQuality, stackCount, sellerName, timeRemaining, salePrice, currencyType, itemUniqueId, salePricePerUnit
            end
        end
        return ZO_GetTradingHouseListingItemInfo(index)
    end

    -- Hook GetTradingHouseSearchResultItemInfo
    GetTradingHouseSearchResultItemInfo = function(index)
        local itemLink = GetTradingHouseSearchResultItemLink(index)
        if AbilityIconsFramework.ShouldReplacePotion(itemLink) then
            local potion = AbilityIconsFramework.FindPotion(itemLink)
            if potion then
                local icon, name, displayQuality, stackCount, sellerName, timeRemaining, purchasePrice, currencyType, itemUniqueId, purchasePricePerUnit = ZO_GetTradingHouseSearchResultItemInfo(index)
                if potion.icon then icon = potion.icon end
                if potion.name then name = "|cB066FF" .. potion.name .. "|r" end
                return icon, name, displayQuality, stackCount, sellerName, timeRemaining, purchasePrice, currencyType, itemUniqueId, purchasePricePerUnit
            end
        end
        return ZO_GetTradingHouseSearchResultItemInfo(index)
    end

    -- Initialize Tooltip Hooks
    InitializeTooltipHooks()

    -- Register for crafting station events with unique event namespaces
    EVENT_MANAGER:RegisterForEvent(AbilityIconsFramework.name .. "_CraftingStart", EVENT_CRAFTING_STATION_INTERACT, function()
        AbilityIconsFramework.HEROISM_POTIONS.isStationInteract = true
    end)
    EVENT_MANAGER:RegisterForEvent(AbilityIconsFramework.name .. "_CraftingEnd", EVENT_END_CRAFTING_STATION_INTERACT, function()
        AbilityIconsFramework.HEROISM_POTIONS.isStationInteract = false
    end)
end