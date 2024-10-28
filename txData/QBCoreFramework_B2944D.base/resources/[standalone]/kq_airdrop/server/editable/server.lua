NEXT_SPAWN = 0
function SetNextSpawnTime()
    NEXT_SPAWN = GetGameTimer() + (Config.automaticDrop.timeBetweenDrops * 1000 * 60)
end

function Main()
    if not Config.automaticDrop.enabled then
        return
    end
    Citizen.CreateThread(function()
        Debug('Starting main thread')

        SetNextSpawnTime()

        while true do
            if GetGameTimer() >= NEXT_SPAWN then
                local data = Config.drops[math.random(1, #Config.drops)]

                local coords = data.coords
                coords = coords + vector3(
                    math.random(-data.radius, data.radius),
                    math.random(-data.radius, data.radius),
                    coords.z
                )

                if IsAnyPlayerWithinRange(coords) then
                    CreateDrop(coords, data)
                    SetNextSpawnTime()
                else
                    Debug('Couldn\'t create a drop at ' .. coords .. ' no players within range. Retrying in 30sec')
                end
            end
            Citizen.Wait(30000)
        end
    end)
end

function IsAnyPlayerWithinRange(coords)
    for _, playerId in ipairs(GetPlayers()) do
        local playerCoords = GetEntityCoords(GetPlayerPed(playerId))
        if GetDistanceBetweenCoords(coords.x, coords.y, 0, playerCoords.x, playerCoords.y, 0) < 250 then
            return true
        end
    end

    return false
end

RegisterCommand('airdrop', function(source, args)
    local data = Config.drops[math.random(1, #Config.drops)]
    local coords = GetEntityCoords(GetPlayerPed(source)) + vector3(0.0, 0.0, 40.0)
    CreateDrop(coords, data)
end, 1)

if Config.debug then
    RegisterCommand('airdropitem', function(source, args)
        CallFlareDrop(source)
    end, 1)
end

function CreateDrop(coords, data)
    Citizen.CreateThread(function()
        Debug('Creating drop at ' .. coords)

        RegisterPlane(coords, data.crates, data.flare)
    end)
end

Main()

local cooldown = {}
function CallFlareDrop(player)
    if cooldown[player] and cooldown[player] > GetGameTimer() then
        TriggerClientEvent('kq_airdrop:client:notify', player, L('~r~You may not call in an airdrop in yet'))
        return
    end

    cooldown[player] = GetGameTimer() + (Config.item.cooldown * 1000)

    TriggerClientEvent('kq_airdrop:client:throwFlare', player)

    RemovePlayerItem(player, Config.item.flareItemName, 1)
    local playerCoords = GetEntityCoords(GetPlayerPed(player))

    Citizen.Wait(5000)

    CreateDrop(playerCoords, Config.item.drop)
end
