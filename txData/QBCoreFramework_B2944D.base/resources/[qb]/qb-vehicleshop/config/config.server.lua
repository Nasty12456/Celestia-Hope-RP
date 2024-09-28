SV = {}

SV.Webhooks = {
    ['BUY'] = "https://discord.com/api/webhooks/1282754426330681426/sIHjBuXDsZX9rTwzTTDEVJ-KabTsvJXEk3ggmAW6jO5dE8VoKK_6W38Ki843Kfnjb1L6",
}

SV.WebhookText = {
    ['BUY_TITLE'] = "Player Bought Vehicle",
    ['BUY'] = "Player %s [%s] bought a vehicle %s %s (%s) [%s] for %s$" -- (name, id, brand, name vehicle, model, plate, price) [Example: Player vames [1] bought a vehicle Enus Windsor 2 (windsor2) [ET 76430] for 512500$]
}

SV.Webhook = function(webhook_id, title, description, footer)
    local DiscordWebHook = SV.Webhooks[webhook_id]
    local embeds = {
        {
            ["title"] = title,
            ["type"] = "rich",
            ["description"] = description,
            ["color"] = 5422079,
            ["footer"] = {
                ["text"] = footer..' - '..os.date(),
            },
        }
    }
    PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embeds}), {['Content-Type'] = 'application/json'})
end

SV.Ban = function(source)
    -- HERE ADD YOUR BAN SYSTEM IF YOU WANT, THATS BAN REASON FOR TRYING TO BUY VEHICLE THAT IS NOT IN THIS CAR DEALER

    -- local reason = "Trying cheating in the Car Dealer."
    -- local src = source
    -- local xPlayer = ESX.GetPlayerFromId(src)
    -- TriggerEvent('example_ban', src, xPlayer.identifier, reason)
end

RegisterNetEvent('qb-vehicleshop:addOwner', function(vehicleProps, vehicleTable, type)
    if Config.Core == "ESX" then
        local xPlayer = ESX.GetPlayerFromId(source)
        local myMoney = xPlayer.getMoney()
        if myMoney >= vehicleTable.price then
            SV.Webhook('BUY', SV.WebhookText['BUY_TITLE'], SV.WebhookText['BUY']:format(GetPlayerName(source), source, vehicleTable.brand, vehicleTable.name, vehicleTable.model, vehicleProps.plate, vehicleTable.price), xPlayer.identifier)
            MySQL.insert("INSERT INTO owned_vehicles (owner, plate, vehicle, type) VALUES (?, ?, ?, ?)", {
                xPlayer.identifier, 
                vehicleProps.plate, 
                json.encode(vehicleProps), 
                type
            })
            xPlayer.removeMoney(vehicleTable.price)
        end
    elseif Config.Core == "QB-Core" then
        local Player = QBCore.Functions.GetPlayer(source)
        local myMoney = Player.Functions.GetMoney('cash')
        if myMoney >= vehicleTable.price then
            SV.Webhook('BUY', SV.WebhookText['BUY_TITLE'], SV.WebhookText['BUY']:format(GetPlayerName(source), source, vehicleTable.brand, vehicleTable.name, vehicleTable.model, vehicleProps.plate, vehicleTable.price), Player.PlayerData.citizenid)
            MySQL.insert("INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?,?,?,?,?,?,?,?)", {
                Player.PlayerData.license, 
                Player.PlayerData.citizenid, 
                vehicleTable.model, 
                GetHashKey(vehicleTable.model),
                json.encode(vehicleProps),
                vehicleProps.plate,
                'out',
                0
            })
            Player.Functions.RemoveMoney('cash', vehicleTable.price)
        end
    end
end)

if Config.Core == "ESX" then
    ESX.RegisterServerCallback('qb-vehicleshop:buyVehicle', function(source, cb, vehicleTable)
            local xPlayer = ESX.GetPlayerFromId(source)
            if vehicleTable and vehicleTable.price then
                local myMoney = xPlayer.getMoney()
                if myMoney >= vehicleTable.price then
                    TriggerClientEvent('qb-vehicleshop:notification', source, Config.Translate['notify.you_bought']:format(vehicleTable.brand, vehicleTable.name, vehicleTable.price), 5000, 'success')
                    cb(true)
                else
                    TriggerClientEvent('qb-vehicleshop:notification', source, Config.Translate['notify.enought_money']:format(vehicleTable.brand, vehicleTable.name), 5000, 'error')
                    cb(false)
                end
            else
                SV.Ban(source)
            end
        end)
elseif Config.Core == "QB-Core" then
    QBCore.Functions.CreateCallback("qb-vehicleshop:buyVehicle", function(source, cb, vehicleTable)
        local Player = QBCore.Functions.GetPlayer(source)
        if vehicleTable and vehicleTable.price then
            local myMoney = Player.Functions.GetMoney('cash')
            if myMoney >= vehicleTable.price then
                TriggerClientEvent('qb-vehicleshop:notification', source, Config.Translate['notify.you_bought']:format(vehicleTable.brand, vehicleTable.name, vehicleTable.price), 5000, 'success')
                cb(true)
            else
                TriggerClientEvent('qb-vehicleshop:notification', source, Config.Translate['notify.enought_money']:format(vehicleTable.brand, vehicleTable.name), 5000, 'error')
                cb(false)
            end
        else
            SV.Ban(source)
        end
    end)
end