local Framework, frameworkName = getFramework()

local channels = {}

lib.callback.register('izzy-radio:createChannel', function(source, data)
    local source = source
    if not channels[data.frequency] then
        channels[data.frequency] = {
            users = {
                [1] = {
                    id = source,
                    name = getName(source)
                }
            },
            password = data.password or nil,
            playerId = 1
        }
        TriggerClientEvent('izzy-radio:connect', source, data.frequency)
        return true
    else
        return false
    end
end)

lib.callback.register('izzy-radio:disconnect', function(source)
    local source = source
    for k,v in pairs(channels) do
        for a, src in pairs(v.users) do
            if source == src.id then
                channels[k]["users"][a] = nil
                updateMembers(source, channels[k]["users"])
                return true
            end
        end
    end
    return false
end)

function resetConnection(source)
    for k,v in pairs(channels) do
        for a, src in pairs(v.users) do
            if source == src.id then
                channels[k]["users"][a] = nil
                updateMembers(source, channels[k]["users"])
                return true
            end
        end
    end
end

lib.callback.register('izzy-radio:connect', function(source, data)
    local source = source
    
    resetConnection(source)

    if channels[data.frequency] then
        local info = channels[data.frequency]
        if info.password then
            return 'password'
        else
            channels[data.frequency]["users"][info.playerId+1] = {
                id = source,
                name = getName(source)
            }
            channels[data.frequency]["playerId"] = info.playerId+1
            TriggerClientEvent('izzy-radio:connect', source, data.frequency)
            updateMembers(source, channels[data.frequency]["users"])
            return true
        end
    else
        channels[data.frequency] = {
            users = {
                [1] = {
                    id = source,
                    name = getName(source)
                }
            },
            password = nil,
            playerId = 1
        }
        TriggerClientEvent('izzy-radio:connect', source, data.frequency)
        return 'new'
    end
end)

lib.callback.register('izzy-radio:password', function(source, data)
    local source = source
    if channels[data.frequency] then
        local info = channels[data.frequency]
        if info.password == data.password then
            channels[data.frequency]["users"][info.playerId+1] = {
                id = source,
                name = getName(source)
            }
            channels[data.frequency]["playerId"] = info.playerId+1
            TriggerClientEvent('izzy-radio:connect', source, data.frequency)
            updateMembers(source, channels[data.frequency]["users"])
            return true
        else
            return false
        end
    else
        return 'none'
    end
end)

lib.callback.register('izzy-radio:getChannels', function(source, data)
    local source = source
    local player = getPlayer(source)
    local myInfo = MySQL.Sync.fetchAll("SELECT data FROM izzy_radio WHERE player = @player", {["@player"] =  player.identifier or player.PlayerData.citizenid})


    if myInfo[1] then
        return json.decode(myInfo[1].data)
    else
        MySQL.Async.fetchAll("INSERT INTO izzy_radio (player) VALUES (@player)", { 
            ["@player"] = player.identifier or player.PlayerData.citizenid
        }, function(a)
        end)
        return {}
    end
end)

lib.callback.register('izzy-radio:favorite', function(source, data, password)
    local source = source
    local player = getPlayer(source)
    local myInfo = MySQL.Sync.fetchAll("SELECT data FROM izzy_radio WHERE player = @player", {["@player"] =  player.identifier or player.PlayerData.citizenid})


    if myInfo[1] then
        local fetch = json.decode(myInfo[1].data)

        if fetch[data.frequency] then
            fetch[data.frequency] = nil
        else
            if data.frequency then
                fetch[data.frequency] = password or "no_password"
            end
        end

        MySQL.Async.execute("UPDATE izzy_radio SET data = @data WHERE player = @player", {
            ['@player'] = player.identifier or player.PlayerData.citizenid,
            ['@data'] = json.encode(fetch),
        })
        return fetch
    else
        return false
    end
end)

lib.callback.register('izzy-radio:getMembers', function(source, frequency)
    local source = source

    if channels[frequency] then
        return channels[frequency].users
    else
        return false
    end
end)

lib.callback.register('izzy-radio:getJob', function(source, frequency)
    local source = source
    local player = getPlayer(source)

    if frameworkName == "esx" then
        return player.getJob().name or nil
    else
        return player.PlayerData.job.name or nil
    end
end)

function getPlayer(source)
    if frameworkName == "esx" then
        return Framework.GetPlayerFromId(source)
    else
        return Framework.Functions.GetPlayer(source)
    end
end

AddEventHandler('playerDropped', function (reason)
    for k,v in pairs(channels) do
        for a, src in pairs(v.users) do
            if source == src.id then
                channels[k]["users"][a] = nil
                updateMembers(source, channels[k]["users"])
                break
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        for k,v in pairs(channels) do
            for a, src in pairs(v.users) do
                if frameworkName == "esx" then
                    local player = getPlayer(src.id)
                    local item = player.getInventoryItem(Config.radioName)

                    if not item then
                        TriggerClientEvent('izzy-radio:forceKick', src.id)
                    else
                        local amount = item.count or item.amount
                        if amount == 0 then
                            TriggerClientEvent('izzy-radio:forceKick', src.id)
                        end
                    end
                else
                    local player = getPlayer(src.id)
                    local item = player.Functions.GetItemByName(Config.radioName)


                    if not item then
                        TriggerClientEvent('izzy-radio:forceKick', src.id)
                    else
                        local amount = item.count or item.amount
                        if amount == 0 then
                            TriggerClientEvent('izzy-radio:forceKick', src.id)
                        end
                    end   
                end
                if source == src.id then
                    channels[k]["users"][a] = nil
                    updateMembers(source, channels[k]["users"])
                    break
                end
            end
        end
        Citizen.Wait(5000)
    end
end)

Citizen.CreateThread(function()
    local number = 0
    local fetch = MySQL.Sync.fetchAll("SELECT data FROM izzy_radio")

    for k,v in pairs(fetch) do
        local data = json.decode(v.data)
        for name,value in pairs(data) do
            if not channels[name] then
                local password = nil
                if value ~= "no_password" then
                    password = value
                end
                channels[name] = {
                    users = {},
                    password = password,
                    playerId = 0
                }
                number = number+1
            end
        end
    end
    debug(number..' channel loaded.')
end)

Citizen.CreateThread(function()
    if frameworkName == "esx" then
        Framework.RegisterUsableItem(Config.radioName, function(source)
            TriggerClientEvent('izzy-radio:use', source)
        end)
    else
        Framework.Functions.CreateUseableItem(Config.radioName, function(source)
            TriggerClientEvent('izzy-radio:use', source)
        end)
    end 
end)

function getName(source)
    if frameworkName == "esx" then
        local xPlayer = Framework.GetPlayerFromId(source)
        local Info = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {["@identifier"] = xPlayer.identifier})
        return Info[1].firstname.." "..Info[1].lastname
    else
        local xPlayer = Framework.Functions.GetPlayer(source)
        return xPlayer.PlayerData.charinfo.firstname.." "..xPlayer.PlayerData.charinfo.lastname
    end
end

function updateMembers(source, users)
    for k,v in pairs(users) do
        if v.id ~= source then
            TriggerClientEvent('izzy-radio:updateMembers', v.id)
        end
    end
end

function debug(txt)
    if Config.debug then
        print("[Debug] [izzy-radio] "..txt)
    end
end

RegisterServerEvent('izzy-radio:leave')
AddEventHandler('izzy-radio:leave', function(frequency)
	exports["saltychat"]:RemovePlayerRadioChannel(source, frequency)
end)

local talking = {}

lib.callback.register('izzy-radio:getTalkings', function(source)
    return talking
end)

RegisterServerEvent('izzy-radio:isTalking')
AddEventHandler('izzy-radio:isTalking', function(value)
	talking[source] = value
end)

RegisterNetEvent("pma-voice:setTalkingOnRadio")
AddEventHandler("pma-voice:setTalkingOnRadio", function(value)
    talking[source] = value
end)

Citizen.CreateThread(function()
    while true do
        TriggerClientEvent('izzy-radio:updateTalking', -1, talking)
        Citizen.Wait(500)
    end
end)