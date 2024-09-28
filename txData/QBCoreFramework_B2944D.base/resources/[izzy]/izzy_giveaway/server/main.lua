players = {}
gift = {}
winners = {}
winnerss = {}
local gTime = 0
local started = false
local finished = false

--## TIMER ##--
local function startTimer(timee)
    starTimer = true
    time = timee * 60
    while true do
        print(time)
        Wait(1000)

        if time > 0 and starTimer then
            time = time - 1
            gTime = time

            TriggerClientEvent("izzy_giveaway:sendTime", -1, time)

            if time == 0 then
                TriggerEvent("izzy_giveaway:getWinner")
                return
            end
        end
    end
end

--## START COMMAND ##--
RegisterCommand(Config.Command, function(src, args)
    if isAdmin(playerIdentifier(src)) then
        if not started then
            TriggerClientEvent("izzy_giveaway:openCreateMenu", src)
        else
            TriggerClientEvent("izzy_giveaway:notify", src, "AlreadyStarted")
        end
    else
        TriggerClientEvent("izzy_giveaway:notify", src, "NotAdmin")
    end
end)

--## JOIN ##--
registerServerCallback("izzy_giveaway:join", function(src, cb)
    local maxPlayers = tonumber(gift.maxplayers)

    if started then
        if not IsPlayer(src) then
            if HasMoney(src) then
                if #players < maxPlayers then
                    table.insert(players, src)
                    TriggerClientEvent("izzy_giveaway:refresh", -1, #players)
                    cb(true)
                else
                    TriggerClientEvent("izzy_giveaway:notify", src, "GameFull")
                    cb(false)
                end
            else
                TriggerClientEvent("izzy_giveaway:notify", src, "NoMoney")
                cb(false)
            end
        else
            TriggerClientEvent("izzy_giveaway:notify", src, "AlreadyJoined")
            cb(false)
        end
    else
        TriggerClientEvent("izzy_giveaway:notify", src, "CantJoin")
        cb(false)
    end
end)

--## GET WINNER ##--
RegisterServerEvent("izzy_giveaway:getWinner", function()
    if not finished then
        winnerss = {}
        winners = GetWinners()

        if #winners == 0 then
            TriggerClientEvent("izzy_giveaway:noWinners", -1, gift.label)
        else
            TriggerClientEvent("izzy_giveaway:finish", -1, winners, gift.label)
    
            if winners and table_size(winners) > 0 then
                for _, winner in pairs(winners) do
                    giveGift(gift.tip, winner.src)
                end
            end
        end
    
        players = {}
        gift = {}
        winners = {}
        finished = true
        Wait(10000)
        started = false
        finished = false
    end
end)

--## CREATING ##--
RegisterServerEvent("izzy_giveaway:create", function(data)
    started = true
    time = tonumber(data.time)
    gift = data
    table.insert(players, source)
    
    TriggerClientEvent("izzy_giveaway:refresh", -1, #players)
    TriggerClientEvent("izzy_giveaway:start", -1, data, false)

    startTimer(time)
end)

--## JOIN ##--
RegisterServerEvent("izzy_giveaway:joined", function()
    local src = source

    if started then
        TriggerClientEvent("izzy_giveaway:start", src, gift, true, gTime)
        Wait(10)
        TriggerClientEvent("izzy_giveaway:refresh", -1, #players)
    end
end)

RegisterNetEvent("izzy_giveaway:server:updateProperties", function(plate, props)
    if Config.Framework == "qb" or Config.Framework == "oldqb" then
        mysqlQuery(
            'UPDATE player_vehicles SET mods = ? WHERE plate = ?',
            {
                props,
                plate
            }
        )
    else
        mysqlQuery(
            'UPDATE owned_vehicles SET vehicle = ? WHERE plate = ?',
            {
                props,
                plate
            }
        )
    end
end)