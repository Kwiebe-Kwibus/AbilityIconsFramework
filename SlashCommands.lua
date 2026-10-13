--- @class (partial) AbilityIconsFramework
local AbilityIconsFramework = AbilityIconsFramework or {}

local function PrintMsg(text)
    d("[AIF] " .. tostring(text))
end

--- Creates slash commands to be used for debugging and options.
function AbilityIconsFramework.CreateSlashCommands()
    AbilityIconsFramework.CreateMainAifCommand()
    AbilityIconsFramework.CreateGetAbilityDetailsCommand()
    AbilityIconsFramework.CreateGetIconsCommand()
    AbilityIconsFramework.CreateGetSavedVarsCommand()
    AbilityIconsFramework.CreateSetOptionGlobalIconsCommand()
    AbilityIconsFramework.CreateSetOptionCustomIconsCommand()
    AbilityIconsFramework.CreateSetOptionMismatchedIconsCommand()
end

--- Unified command router for /aif
function AbilityIconsFramework.CreateMainAifCommand()
    SLASH_COMMANDS["/aif"] = function(strInput)
        local params = {}
        for word in (strInput or ""):gmatch("%S+") do
            table.insert(params, word)
        end

        local subCmd = string.lower(params[1] or "")
        if subCmd == "details" then
            local rest = table.concat(params, " ", 2)
            if SLASH_COMMANDS["/getabilitydetails"] then
                SLASH_COMMANDS["/getabilitydetails"](rest)
            end
        elseif subCmd == "icons" then
            local rest = table.concat(params, " ", 2)
            if SLASH_COMMANDS["/geticons"] then
                SLASH_COMMANDS["/geticons"](rest)
            end
        elseif subCmd == "vars" or subCmd == "savedvars" then
            if SLASH_COMMANDS["/getsavedvars"] then
                SLASH_COMMANDS["/getsavedvars"]()
            end
        elseif subCmd == "reload" or subCmd == "rl" then
            ReloadUI("ingame")
        else
            PrintMsg(GetString(SI_AIF_COMMANDS_HEADER))
            PrintMsg(GetString(SI_AIF_COMMAND_DETAILS))
            PrintMsg(GetString(SI_AIF_COMMAND_ICONS))
            PrintMsg(GetString(SI_AIF_COMMAND_VARS))
            PrintMsg(GetString(SI_AIF_COMMAND_SETTINGS))
        end
    end
end

--- Creates the /getabilitydetails (and /aif_details) command
function AbilityIconsFramework.CreateGetAbilityDetailsCommand()
    local handler = function(strInput)
        local params = {}
        for word in (strInput or ""):gmatch("%w+") do table.insert(params, word) end
        local skillIndex = tonumber(params[1]) or 3
        local inactive = params[2] or "0"

        local hotbarCategory = GetActiveHotbarCategory()
        if inactive == "1" then
            hotbarCategory = hotbarCategory == HOTBAR_CATEGORY_PRIMARY
                             and HOTBAR_CATEGORY_BACKUP or HOTBAR_CATEGORY_PRIMARY
        end

        local baseAbilityId = AbilityIconsFramework.GetBaseAbilityId(skillIndex, hotbarCategory)
        PrintMsg("Base Ability ID: " .. tostring(baseAbilityId or -1))
        local abilityId = AbilityIconsFramework.GetAbilityId(skillIndex, hotbarCategory)
        PrintMsg("Ability ID: " .. tostring(abilityId or -1))

        if abilityId and abilityId > 0 then
            local primaryScriptId, secondaryScriptId, tertiaryScriptId = GetCraftedAbilityActiveScriptIds(abilityId)
            if primaryScriptId ~= 0 or secondaryScriptId ~= 0 or tertiaryScriptId ~= 0 then
                PrintMsg("Focus Script: " .. GetCraftedAbilityScriptDisplayName(primaryScriptId) .. " (" .. primaryScriptId .. ")")
                PrintMsg("Signature Script: " .. GetCraftedAbilityScriptDisplayName(secondaryScriptId) .. " (" .. secondaryScriptId .. ")")
                PrintMsg("Affix Script: " .. GetCraftedAbilityScriptDisplayName(tertiaryScriptId) .. " (" .. tertiaryScriptId .. ")")
                if primaryScriptId ~= 0 and secondaryScriptId ~= 0 and tertiaryScriptId ~= 0 then
                    local scriptLink = ZO_LinkHandler_CreateChatLink(GetCraftedAbilityLink, abilityId, primaryScriptId, secondaryScriptId, tertiaryScriptId)
                    PrintMsg("Scribed Skill Link: " .. scriptLink)
                end
            end
        end
    end

    SLASH_COMMANDS["/getabilitydetails"] = handler
    SLASH_COMMANDS["/aif_details"] = handler
end

--- Creates the /geticons (and /aif_icons) command, safely reporting icon paths without crashing
function AbilityIconsFramework.CreateGetIconsCommand()
    local handler = function(strInput)
        local params = {}
        for word in (strInput or ""):gmatch("%w+") do table.insert(params, word) end
        local skillIndex = tonumber(params[1]) or 3
        local inactive = params[2] or "0"

        local hotbarCategory = GetActiveHotbarCategory()
        if inactive == "1" then
            hotbarCategory = hotbarCategory == HOTBAR_CATEGORY_PRIMARY
                             and HOTBAR_CATEGORY_BACKUP or HOTBAR_CATEGORY_PRIMARY
        end

        local abilityId = AbilityIconsFramework.GetAbilityId(skillIndex, hotbarCategory)
        if not abilityId or abilityId <= 0 then
            PrintMsg(zo_strformat(GetString(SI_AIF_SLOT_EMPTY), skillIndex, hotbarCategory))
            return
        end

        local abilityName = GetAbilityName(abilityId)
        local baseTexture = GetAbilityIcon(abilityId)
        PrintMsg("Slot " .. tostring(skillIndex) .. ": " .. tostring(abilityName) .. " (" .. tostring(abilityId) .. ")")
        PrintMsg("  Base Texture: " .. tostring(baseTexture))

        local redirectedTexture = AbilityIconsFramework.BASE_GAME_ICONS_TO_REPLACE[baseTexture]
        if redirectedTexture then
            PrintMsg("  Redirected to: " .. tostring(redirectedTexture))
        else
            PrintMsg(GetString(SI_AIF_SLOT_REDIRECT_NONE))
        end
    end

    SLASH_COMMANDS["/geticons"] = handler
    SLASH_COMMANDS["/aif_icons"] = handler
end

--- Creates the /getsavedvars (and /aif_vars) command with nil-safe checks
function AbilityIconsFramework.CreateGetSavedVarsCommand()
    local handler = function()
        PrintMsg("----------------------------------")
        local displayName = GetDisplayName()

        if AbilityIconsFramework_SavedVariables and AbilityIconsFramework_SavedVariables["Default"] and AbilityIconsFramework_SavedVariables["Default"][displayName] then
            local svAccount = AbilityIconsFramework_SavedVariables["Default"][displayName]["$AccountWide"]
            if svAccount then
                PrintMsg("AbilityIconsFramework_SavedVariables ($AccountWide):")
                for key, value in pairs(svAccount) do
                    if type(value) == "table" then
                        PrintMsg("  [" .. tostring(key) .. "] -> (table)")
                    else
                        PrintMsg("  [" .. tostring(key) .. "] -> " .. tostring(value))
                    end
                end
            end

            local charId = GetCurrentCharacterId()
            local svChar = AbilityIconsFramework_SavedVariables["Default"][displayName][charId]
            if svChar then
                PrintMsg("AbilityIconsFramework_SavedVariables (Character " .. tostring(charId) .. "):")
                for key, value in pairs(svChar) do
                    if type(value) == "table" then
                        PrintMsg("  [" .. tostring(key) .. "] -> (table)")
                    else
                        PrintMsg("  [" .. tostring(key) .. "] -> " .. tostring(value))
                    end
                end
            end
        else
            PrintMsg("SavedVariables have not been written to disk yet.")
        end

        PrintMsg("----------------------------------")
    end

    SLASH_COMMANDS["/getsavedvars"] = handler
    SLASH_COMMANDS["/aif_vars"] = handler
end

--- Backward compatibility helper for typo in previous versions
AbilityIconsFramework.CreteGetSavedVarsCommand = AbilityIconsFramework.CreateGetSavedVarsCommand

--- Creates the /setoptionglobalicons command
function AbilityIconsFramework.CreateSetOptionGlobalIconsCommand()
    local handler = function(option)
        local opt = string.lower(option or "")
        if opt == "false" or opt == "0" or opt == "off" then
            AbilityIconsFramework.SetOptionGlobalIcons(false)
            PrintMsg("Global (Account Wide) Icons are now OFF")
        elseif opt == "true" or opt == "1" or opt == "on" then
            AbilityIconsFramework.SetOptionGlobalIcons(true)
            PrintMsg("Global (Account Wide) Icons are now ON")
        end
    end

    SLASH_COMMANDS["/setoptionglobalicons"] = handler
    SLASH_COMMANDS["/aif_globalicons"] = handler
end

--- Creates the /setoptioncustomicons command
function AbilityIconsFramework.CreateSetOptionCustomIconsCommand()
    local handler = function(option)
        local opt = string.lower(option or "")
        if opt == "false" or opt == "0" or opt == "off" then
            AbilityIconsFramework.SetOptionCustomIcons(false)
            PrintMsg("Custom Scribed Ability Icons are now OFF")
        elseif opt == "true" or opt == "1" or opt == "on" then
            AbilityIconsFramework.SetOptionCustomIcons(true)
            PrintMsg("Custom Scribed Ability Icons are now ON")
        end
    end

    SLASH_COMMANDS["/setoptioncustomicons"] = handler
    SLASH_COMMANDS["/aif_customicons"] = handler
end

--- Creates the /setoptionmismatchedicons command
function AbilityIconsFramework.CreateSetOptionMismatchedIconsCommand()
    local handler = function(option)
        local opt = string.lower(option or "")
        if opt == "false" or opt == "0" or opt == "off" then
            AbilityIconsFramework.SetOptionMismatchedIcons(false)
            PrintMsg("Mismatched Skill Icon replacements are now OFF")
        elseif opt == "true" or opt == "1" or opt == "on" then
            AbilityIconsFramework.SetOptionMismatchedIcons(true)
            PrintMsg("Mismatched Skill Icon replacements are now ON")
        end
    end

    SLASH_COMMANDS["/setoptionmismatchedicons"] = handler
    SLASH_COMMANDS["/aif_mismatchedicons"] = handler
end
