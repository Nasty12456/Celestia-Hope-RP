local Framework, frameworkName = getFramework()
local targetFrequency = nil
local lastPassword = nil
local inRadio = false
local wait = false
local myList = {}
local memberList = {}
local volume = Config.defaultVolume

RegisterCommand('resetradio', function()
    SendNUIMessage({
        action = "reset"
    })
    debug('radio has been reset')
end)

RegisterNUICallback('createChannel', function(data, cb)
    local created = lib.callback.await('izzy-radio:createChannel', false, data)

    if created then
        targetFrequency = data.frequency
        lastPassword = data.password

        refreshMemebers()

        inRadio = true

        notify('created')
        debug('channel successfully created.')
        cb(true)
    else
        notify('created_fail')
        debug('failed to create channel, already created on the same frequency?')
        cb(false)
    end
end)

RegisterNUICallback('disconnect', function(data, cb)
    local disconnect = lib.callback.await('izzy-radio:disconnect', false)

    if disconnect then
        lastPassword = nil
        inRadio = false
        
        notify('disconnected')
        debug('disconnected radio.')

        radioDisconnect()

        cb(true)
    else
        notify('disconnected_fail')
        debug('failed to disconnect radio.')
        cb(false)
    end
end)

RegisterNUICallback('connect', function(data, cb)
    local available = isChannelSpecial(data.frequency)

    if available then
    local fetch = lib.callback.await('izzy-radio:connect', false, data)

        targetFrequency = data.frequency

        if fetch == "new" then
            inRadio = true
            refreshMemebers()

            notify('connected')
            debug('channel created for user, connected.')
            cb({value = true})
        elseif fetch == "password" then
            notify('password')
            debug('password detected')
            cb({value = "password"})
        else
            inRadio = true
            refreshMemebers()

            notify('connected')
            debug('channel already created, no password, connected.')
            cb({value = true, isFavorite = myList[data.frequency]})
        end
    else
        cb({value = "special"})
        debug('this channel for special job.')
        notify('job')
    end
end)

RegisterNUICallback('password', function(data, cb)
    local password = lib.callback.await('izzy-radio:password', false, data)
    local available = isChannelSpecial(data.frequency)

    if available then
        if password == "none" then
            notify('notfound')
            debug('frequency not found?, event canceled.')
            cb({value = "close"})
        elseif password then
            lastPassword = data.password
            inRadio = true

            refreshMemebers()

            notify('connected')
            debug('password are correct, connected.')
            cb({value = true, isFavorite = myList[data.frequency]})
        else
            notify('wrong')
            debug('password not match, event canceled.')
            cb({value = false})
        end
    end
end)

RegisterNUICallback('favorite', function(data, cb)
    local fetch = lib.callback.await('izzy-radio:favorite', false, data, lastPassword)

    if fetch then
        refresh(fetch)
        debug('favorite event successfully.')
        cb(true)
    else
        debug('An error occurred from the database, player data not found?')
        cb(false)
    end
end)

RegisterNUICallback('volume', function(data, cb)
    if data.value then
        if volume > 99 then
            notify('max')
        else
            volume = volume + 10
            notify('volume_up')
        end
    else
        if volume < 1 then
            notify('min')
        else
            volume = volume - 10
            notify('volume_down')
        end
    end

    if Config.voipSystem == "auto" then
        if GetResourceState('pma-voice') == 'started' then
            exports['pma-voice']:setRadioVolume(volume)
        elseif GetResourceState('mumble-voip') == 'started' then
            exports['mumble-voip']:setRadioVolume(volume)
        elseif GetResourceState('saltychat') == 'started' then
            exports['saltychat']:SetRadioVolume(volume)
        end
    else
        if Config.voipSystem == "saltychat" then
            exports[Config.voipSystem]:SetRadioVolume(volume)
        else
            exports[Config.voipSystem]:setRadioVolume(volume)
        end
    end

    debug('volume updated.')
end)

RegisterNUICallback('exit', function(data, cb)
    SetNuiFocus(false, false)
    stopAnim()
    wait = true
    Citizen.Wait(1000)
    wait = false
end)

function debug(txt)
    if Config.debug then
        print("[Debug] [izzy-radio] "..txt)
    end
end

function radioDisconnect()
    if Config.voipSystem == "auto" then
        if GetResourceState('pma-voice') == 'started' then
            exports["pma-voice"]:SetRadioChannel(0)
            exports['pma-voice']:setVoiceProperty('radioEnabled', false)
			exports['pma-voice']:setVoiceProperty('micClicks', false)
        elseif GetResourceState('mumble-voip') == 'started' then
            exports["mumble-voip"]:SetRadioChannel(0)
        elseif GetResourceState('saltychat') == 'started' then
            TriggerServerEvent('izzy-radio:leave', exports["saltychat"]:GetRadioChannel())
        end
    else
        exports[Config.voipSystem]:SetRadioChannel(0)
        exports[Config.voipSystem]:setVoiceProperty('radioEnabled', false)
        exports[Config.voipSystem]:setVoiceProperty('micClicks', false)
    end
end

function refresh(data)

    SendNUIMessage({
        action = "resetRefresh"
    })

    local fetch
    if data then
        fetch = data
    else
        fetch = lib.callback.await('izzy-radio:getChannels', false)
    end

    myList = fetch

    for k,v in pairs(fetch) do
        SendNUIMessage({
            action = "addFavorite",
            name = k,
            password = v
        })
    end

    SendNUIMessage({
        action = "updateFavorite",
        isFavorite = myList[targetFrequency]
    })
end

local animDict = "cellphone@"
local animName = "cellphone_text_in"

function anim()
    local ped = PlayerPedId()

    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(100)
    end
    
    TaskPlayAnim(ped, animDict, animName, 8.0, -8.0, -1, 50, 0, false, false, false)
    
    local coords = GetEntityCoords(ped)
    radioProp = CreateObject(GetHashKey(Config.RadioProp), coords.x, coords.y, coords.z, true, true, true)
    AttachEntityToEntity(radioProp, ped, GetPedBoneIndex(ped, 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
end

function stopAnim()
    local ped = PlayerPedId()
    ClearPedTasks(ped)
    if radioProp then
        DeleteObject(radioProp)
        radioProp = nil
    end
end

function refreshMemebers()
    fetch = lib.callback.await('izzy-radio:getMembers', false, targetFrequency)

    SendNUIMessage({
        action = "resetMembers"
    })

    if fetch then
        local number = 0

        for k,v in pairs(fetch) do
            SendNUIMessage({
                action = "addMember",
                data = v
            })
            number = number+1
            fetch[k]["talking"] = nil
        end

        SendNUIMessage({
            action = "updateMemberCount",
            value = number
        })

        memberList = fetch

        debug('member list refreshed.')
    else
        debug('channel not found?')
    end
end

RegisterNetEvent('izzy-radio:updateMembers')
AddEventHandler('izzy-radio:updateMembers', function()
    refreshMemebers() 
end)

RegisterNetEvent('izzy-radio:connect')
AddEventHandler('izzy-radio:connect', function(channel)
    local channel = tonumber(channel)
    
    if Config.voipSystem == "auto" then
        if GetResourceState('pma-voice') == 'started' then
            exports["pma-voice"]:SetRadioChannel(channel)
            exports['pma-voice']:setRadioVolume(volume)
            exports['pma-voice']:setVoiceProperty('radioEnabled', true)
			exports['pma-voice']:setVoiceProperty('micClicks', true)

        elseif GetResourceState('mumble-voip') == 'started' then
            exports["mumble-voip"]:SetRadioChannel(channel)
            exports['mumble-voip']:setRadioVolume(volume)
        elseif GetResourceState('saltychat') == 'started' then
            exports["saltychat"]:SetRadioChannel(channel)
            exports['saltychat']:SetRadioVolume(volume)
        end
    else
        if GetResourceState('saltychat') == 'started' then
            exports[Config.voipSystem]:SetRadioVolume(volume)
            exports[Config.voipSystem]:SetRadioChannel(channel)
        else
            exports[Config.voipSystem]:SetRadioChannel(channel)
            exports[Config.voipSystem]:setRadioVolume(volume)
        end
    end
end)

RegisterNetEvent('izzy-radio:use')
AddEventHandler('izzy-radio:use', function(channel)
    if wait then
        notify('wait')
    else
        SendNUIMessage({
            action = "open"
        })
        SetNuiFocus(true, true)
        refresh()
        anim()
    end
end)

RegisterNetEvent('izzy-radio:forceKick')
AddEventHandler('izzy-radio:forceKick', function(channel)
    SendNUIMessage({
        action = "forceKick"
    })
    notify('kick')
    debug('item not found, kicked')
end)

local talkingList = {}

RegisterNetEvent('izzy-radio:updateTalking')
AddEventHandler('izzy-radio:updateTalking', function(data)
    talkingList = data
end)

Citizen.CreateThread(function()
    while true do
        if inRadio then
            for k,v in pairs(memberList) do              
                local talking = talkingList[v.id] or false          
                if v.talking ~= talking then
                    SendNUIMessage({
                        action = "talking",
                        id = v.id,
                        value = talking
                    })
                    memberList[k]["talking"] = talking
                end
            end
        end
        Citizen.Wait(250)
    end
end)

RegisterNetEvent("SaltyChat_TalkStateChanged", function(player, key, value)
    if inRadio then
        local talking = false

        if IsEntityPlayingAnim(PlayerPedId(), "random@arrests", "generic_radio_enter", 3) then
            talking = true
        else
            if IsEntityPlayingAnim(PlayerPedId(), "random@arrests", "generic_radio_chatter", 3) then
                talking = true
            end
        end

        TriggerServerEvent('izzy-radio:isTalking', talking)
    end
end)

RegisterNetEvent("pma-voice:setTalkingOnRadio")
AddEventHandler("pma-voice:setTalkingOnRadio", function(source, talkingState)
    SendNUIMessage({ radioId = source, radioTalking = talkingState })
end)

function getClientIdFromServerId(serverId)
    local players = GetActivePlayers()
    for _, player in ipairs(players) do
        if GetPlayerServerId(player) == serverId then
            return player
        end
    end
    return "nil"
end

function isChannelSpecial(channel)
    fetch = lib.callback.await('izzy-radio:getJob', false)

    for k,v in pairs(Config.jobChannels) do
        for a,value in pairs(v.frequency) do
            if value == channel then
                for _, job in pairs(v.jobs) do
                    if job == fetch then
                        return true
                    end
                end
                return false
            end
        end
    end
    return true
end