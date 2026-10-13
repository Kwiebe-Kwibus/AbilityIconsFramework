--- @class (partial) AbilityIconsFramework
AbilityIconsFramework = AbilityIconsFramework or {}
local AbilityIconsFramework = AbilityIconsFramework

----------------------
-- Icon Pack State  --
----------------------

-- If icon packs call AddCustomIconPack before settings exist, queue them here.
AbilityIconsFramework._earlyIconPacks = AbilityIconsFramework._earlyIconPacks or {}

AbilityIconsFramework.packSortOrderEntries = AbilityIconsFramework.packSortOrderEntries or {}

---------------------------
-- Early Pack Processing --
---------------------------

function AbilityIconsFramework.ProcessEarlyIconPacks()
    if not AbilityIconsFramework._earlyIconPacks then return end
    if AbilityIconsFramework.GetSettings == nil then return end

    local sortedKeys = {}
    for packDir in pairs(AbilityIconsFramework._earlyIconPacks) do
        table.insert(sortedKeys, packDir)
    end
    table.sort(sortedKeys)

    for _, packDir in ipairs(sortedKeys) do
        AbilityIconsFramework.AddCustomIconPack(packDir, AbilityIconsFramework._earlyIconPacks[packDir])
    end

    AbilityIconsFramework._earlyIconPacks = {}
end

---------------------------
-- Registration Function --
---------------------------

function AbilityIconsFramework.AddCustomIconPack(PackDirectory, PackIcons)
    if PackDirectory == nil or PackIcons == nil or #PackIcons == 0 then
        return
    end

    -- Always register as enabled
    AbilityIconsFramework.ENABLED_ICON_PACKS[PackDirectory] = PackIcons

    -- Settings might not exist yet (if another addon calls us very early)
    if AbilityIconsFramework.GetSettings == nil then
        AbilityIconsFramework._earlyIconPacks = AbilityIconsFramework._earlyIconPacks or {}
        AbilityIconsFramework._earlyIconPacks[PackDirectory] = PackIcons
        return
    end

    local settings = AbilityIconsFramework.GetSettings()
    if settings == nil or settings.iconPacksData == nil then
        AbilityIconsFramework._earlyIconPacks = AbilityIconsFramework._earlyIconPacks or {}
        AbilityIconsFramework._earlyIconPacks[PackDirectory] = PackIcons
        return
    end

    -- Get pack's addon folder name
    local packName = PackDirectory:match("/(.*)/")
    if packName then
        packName = packName:match("(.*)/") or packName
    else
        packName = PackDirectory
    end

    -- If we already had this pack's info saved, ensure its fields are valid
    if settings.iconPacksData[PackDirectory] ~= nil then
        local data = settings.iconPacksData[PackDirectory]
        if data.packDisplayName == nil or data.packDisplayName == "" then
            data.packDisplayName = packName
        end
        if data.packExampleTexture == nil or data.packExampleTexture == "" then
            data.packExampleTexture = PackDirectory .. PackIcons[1]
        end
        if not data.loadOrder then
            data.loadOrder = AbilityIconsFramework.GetHighestIconPackOrder() + 1
        end
        if AbilityIconsFramework.isInitialized then
            AbilityIconsFramework.InitializeSortOrderEntries()
            AbilityIconsFramework.ApplyPackLoadOrderChanges()
        end
        return
    end

    local highestOrder = 0
    if AbilityIconsFramework.GetHighestIconPackOrder ~= nil then
        highestOrder = AbilityIconsFramework.GetHighestIconPackOrder()
    end

    settings.iconPacksData[PackDirectory] = {
        packDisplayName = packName,
        loadOrder = highestOrder + 1,
        packExampleTexture = PackDirectory .. PackIcons[1],
    }

    if AbilityIconsFramework.isInitialized then
        AbilityIconsFramework.InitializeSortOrderEntries()
        AbilityIconsFramework.ApplyPackLoadOrderChanges()
    end
end

----------------------------
-- Priority Sort & Orders --
----------------------------

function AbilityIconsFramework.GetHighestIconPackOrder()
    local max = 0
    local settings = AbilityIconsFramework.GetSettings()
    if settings and settings.iconPacksData then
        for _, packData in pairs(settings.iconPacksData) do
            if packData ~= nil and packData.loadOrder and type(packData.loadOrder) == "number" and packData.loadOrder > max then
                max = packData.loadOrder
            end
        end
    end
    return max
end

local function packSortFuncAsc(t, a, b)
    if not (t and t[a] and t[b]) then return false end
    local orderA = t[a].loadOrder or 9999
    local orderB = t[b].loadOrder or 9999
    if orderA ~= orderB then
        return orderA < orderB
    end
    -- Deterministic tie-breakers: display name, then directory path string
    local nameA = t[a].packDisplayName or a
    local nameB = t[b].packDisplayName or b
    if nameA ~= nameB then
        return nameA < nameB
    end
    return tostring(a) < tostring(b)
end

function AbilityIconsFramework.InitializeSortOrderEntries()
    local settings = AbilityIconsFramework.GetSettings()
    if not (settings and settings.iconPacksData) then return end

    -- Ensure any enabled packs that might be missing from iconPacksData are added
    if AbilityIconsFramework.ENABLED_ICON_PACKS then
        local maxOrder = AbilityIconsFramework.GetHighestIconPackOrder()
        local missingPacks = {}
        for packDir in pairs(AbilityIconsFramework.ENABLED_ICON_PACKS) do
            if settings.iconPacksData[packDir] == nil then
                table.insert(missingPacks, packDir)
            end
        end
        table.sort(missingPacks)
        for _, packDir in ipairs(missingPacks) do
            local packIcons = AbilityIconsFramework.ENABLED_ICON_PACKS[packDir]
            local packName = packDir:match("/(.*)/")
            if packName then
                packName = packName:match("(.*)/") or packName
            else
                packName = packDir
            end
            maxOrder = maxOrder + 1
            settings.iconPacksData[packDir] = {
                packDisplayName = packName,
                loadOrder = maxOrder,
                packExampleTexture = (packIcons and packIcons[1]) and (packDir .. packIcons[1]) or nil,
            }
        end
    end

    local keys = {}
    for k in pairs(settings.iconPacksData) do
        if AbilityIconsFramework.ENABLED_ICON_PACKS[k] ~= nil then
            table.insert(keys, k)
        end
    end

    table.sort(keys, function(a, b)
        return packSortFuncAsc(settings.iconPacksData, a, b)
    end)

    -- Mutate existing table in-place so references held by LAM are preserved
    local entries = AbilityIconsFramework.packSortOrderEntries
    local oldCount = #entries
    local newCount = #keys

    for currentIdx, packDirectoryString in ipairs(keys) do
        local packData = settings.iconPacksData[packDirectoryString]
        if packData ~= nil then
            -- Normalize loadOrder to consecutive clean numbers (1 = top priority)
            packData.loadOrder = currentIdx

            local texture = packData.packExampleTexture
            if not texture or texture == "" then
                if AbilityIconsFramework.ENABLED_ICON_PACKS[packDirectoryString] and AbilityIconsFramework.ENABLED_ICON_PACKS[packDirectoryString][1] then
                    texture = packDirectoryString .. AbilityIconsFramework.ENABLED_ICON_PACKS[packDirectoryString][1]
                else
                    texture = "/esoui/art/icons/icon_missing.dds"
                end
            end

            local displayName = packData.packDisplayName or packDirectoryString

            entries[currentIdx] = {
                value = packDirectoryString,
                uniqueKey = currentIdx,
                text = "|t45:45:" .. texture .. "|t " .. displayName,
            }
        end
    end

    -- Clean up any extra trailing elements if packs were removed
    for i = newCount + 1, oldCount do
        entries[i] = nil
    end
end

function AbilityIconsFramework.UpdatePackLoadOrderFromSortEntries()
    local settings = AbilityIconsFramework.GetSettings()
    if not (settings and settings.iconPacksData) then return end
    for entryIdx, entryData in ipairs(AbilityIconsFramework.packSortOrderEntries) do
        if entryData and entryData.value and settings.iconPacksData[entryData.value] then
            settings.iconPacksData[entryData.value].loadOrder = entryIdx
        end
    end
end

------------------------------
-- Iteration & Application  --
------------------------------

-- Custom iteration function going over icon pack data in their load order.
-- In ApplyIconPacks, icon packs are applied from lowest priority (highest number) to highest priority (1),
-- so loadOrder = 1 is applied LAST and overwrites any conflicting icons from lower priority packs.
local packSortFunc = function(t, a, b)
    if not (t and t[a] and t[b]) then return false end
    local orderA = t[a].loadOrder or 9999
    local orderB = t[b].loadOrder or 9999
    if orderA ~= orderB then
        return orderB < orderA
    end
    -- Deterministic tie-breakers: display name, then directory path string
    local nameA = t[a].packDisplayName or a
    local nameB = t[b].packDisplayName or b
    if nameA ~= nameB then
        return nameA > nameB
    end
    return tostring(a) > tostring(b)
end

function AbilityIconsFramework.packPairs()
    local settings = AbilityIconsFramework.GetSettings()
    if not (settings and settings.iconPacksData) then
        return function() return nil end
    end

    local keys = {}
    for k, _ in pairs(settings.iconPacksData) do
        -- Iterate only over currently enabled icon packs
        if AbilityIconsFramework.ENABLED_ICON_PACKS[k] ~= nil then
            keys[#keys + 1] = k
        end
    end

    table.sort(keys, function(a, b) return packSortFunc(settings.iconPacksData, a, b) end)

    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], settings.iconPacksData[keys[i]]
        end
    end
end

function AbilityIconsFramework.ApplyIconPacks()
    -- packPairs is custom iterator function which goes through icon packs in their load order
    for PackDirectory, _ in AbilityIconsFramework.packPairs() do
        for _, icon in ipairs(AbilityIconsFramework.ENABLED_ICON_PACKS[PackDirectory]) do
            AbilityIconsFramework.BASE_GAME_ICONS_TO_REPLACE[AbilityIconsFramework.esoIcon(icon)] = PackDirectory .. icon
        end
    end
end

function AbilityIconsFramework.GenerateReplacementLists()
    local replacementIcons = AbilityIconsFramework.REPLACEMENT_ICONS or {}
    for _, icon in ipairs(replacementIcons) do
        AbilityIconsFramework.BASE_GAME_ICONS_TO_REPLACE[AbilityIconsFramework.esoIcon(icon)] = AbilityIconsFramework.addonIcon(icon)
    end
    AbilityIconsFramework.ApplyIconPacks()
    if AbilityIconsFramework.GenerateScribedSkillsIcons then
        AbilityIconsFramework.GenerateScribedSkillsIcons()
    end
end

function AbilityIconsFramework.ApplyPackLoadOrderChanges()
    AbilityIconsFramework.ResetAllTextureRedirects()
    AbilityIconsFramework.GenerateReplacementLists()
    AbilityIconsFramework.ReplaceMismatchedIcons()
    AbilityIconsFramework.UpdateDefaultScribingIcons()
    AbilityIconsFramework.UpdateAllSlots()
end
