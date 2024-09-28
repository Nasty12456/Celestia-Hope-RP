local c
local peds = {}


local function draw3dText(coords, text)
    local camCoords = GetGameplayCamCoord()
    local dist = #(coords - camCoords)

    local scale = 200 / (GetGameplayCamFov() * dist)

    SetTextColour(255, 255, 255, 255)
    SetTextScale(0.0, 0.5 * scale)
    SetTextFont(10)
    SetTextDropshadow(0, 0, 0, 0, 55)
    SetTextDropShadow()
    SetTextCentre(true)

    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(coords, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

local function displayText(ped, text)
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
    local targetPos = GetEntityCoords(ped)
    local dist = #(playerPos - targetPos)
    local los = HasEntityClearLosToEntity(playerPed, ped, 17)

    if dist <= Config.FloatMessage and los then
        peds[ped] = {
            time = GetGameTimer() + 4500,
            text = text,
        }

        if not peds[ped].exists then
            peds[ped].exists = true
            while GetGameTimer() <= peds[ped].time do
                local pos = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.0, 1.2)
                draw3dText(pos, peds[ped].text)
                Citizen.Wait(0)
            end
            peds[ped] = nil
        end
    end
end

local function onDoShareDisplay(text, target)
    local player = GetPlayerFromServerId(target)
    if player ~= -1 or target == GetPlayerServerId(PlayerId()) then
        local ped = GetPlayerPed(player)
        displayText(ped, " [DO] " .. text .. " ", 0.45)
    end
end

local function onMeShareDisplay(text, target)
    local player = GetPlayerFromServerId(target)
    if player ~= -1 or target == GetPlayerServerId(PlayerId()) then
        local ped = GetPlayerPed(player)
        displayText(ped, "[ME] " .. text .. " ", 0.7)
    end
end

RegisterNetEvent('mchat:do:event', onDoShareDisplay)
RegisterNetEvent('mchat:me:event', onMeShareDisplay)
