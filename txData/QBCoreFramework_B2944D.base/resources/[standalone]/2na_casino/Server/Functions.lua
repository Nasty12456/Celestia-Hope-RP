function SendCasinoDataToClients(data) 
    for _, v in ipairs(activeConnections) do 
        TriggerClientEvent("2na_casino:Client:UpdateCasinoData", v, data)
    end
end

function GenerateMessagesTable() 
    local messages = {}

    for _, v in ipairs(chatMessages) do 
        table.insert(messages, v.content)
    end

    return messages
end

function SendLogMessage(type, data, source)
    if Config.DiscordWebhooks[type] then 
        local message = ""
        for k, v in pairs(data) do
            message = message .. "\n\n> **" .. k .. "**: `" .. tostring(v) .. "`"
        end

        local embed = {{
            ["color"] = 15548997,
            ["title"] = type .. " Logs",
            ["description"] = message .. "\n\n> **Character Identifier**: `" .. TwoNa.GetCharacterIdentifier(source) .. "`\n\n> **Player Steam Name**: `" .. GetPlayerName(source) .. "`",
            ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ"),
            ["footer"] = {
                ["text"] = "0R-Casino | Log Message",
            }
        }}
    
        PerformHttpRequest(Config.DiscordWebhooks[type], function()end, 'POST', json.encode({embeds = embed}), { ['Content-Type'] = 'application/json' })
    end
end