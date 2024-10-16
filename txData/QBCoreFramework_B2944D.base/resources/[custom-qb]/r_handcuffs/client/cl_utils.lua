/*--------------------------------------
  % Made with ❤️ for: Rytrak Store
  % Author: Rytrak https://rytrak.fr
  % Script documentation: https://docs.rytrak.fr/scripts/advanced-handcuffs-system
  % Full support on discord: https://discord.gg/k22buEjnpZ
--------------------------------------*/

-- [[ Commands ]]

local function cuffs()
    local pedInFront = GetPedInFront()
    if pedInFront == 0 then return end

    TriggerServerEvent('r_handcuffs:server:cuffs', pedInFront)
end

local function uncuffs()
    local pedInFront = GetPedInFront()
    if pedInFront == 0 then return end

    TriggerServerEvent('r_handcuffs:server:uncuffs', pedInFront)
end

local function rope()
    local pedInFront = GetPedInFront()
    if pedInFront == 0 then return end

    TriggerServerEvent('r_handcuffs:server:rope', pedInFront)
end

local function unrope()
    local pedInFront = GetPedInFront()
    if pedInFront == 0 then return end

    TriggerServerEvent('r_handcuffs:server:unrope', pedInFront)
end

local function grinder()
    local pedInFront = GetPedInFront()
    if pedInFront == 0 then return end

    TriggerServerEvent('r_handcuffs:server:grinder', pedInFront)
end

if Config.EnableCommands then
    RegisterCommand('cuffs', function()
        cuffs()
    end)

    RegisterCommand('uncuffs', function()
        uncuffs()
    end)

    RegisterCommand('rope', function()
        rope()
    end)

    RegisterCommand('unrope', function()
        unrope()
    end)

    RegisterCommand('grinder', function()
        grinder()
    end)
end

local handsup = false

RegisterCommand('handsup', function()
	if not handsup then
        handsup = true

        PlayAnim('rytrak@hangsup@clip', 'hangsup_clip', 50)
    else
        handsup = false

        ClearPedTasks(PlayerPedId())
    end
end, false)

RegisterKeyMapping('handsup', 'Hands up', 'keyboard', 'x')

-- [[ Event ]]

RegisterNetEvent('r_handcuffs:client:execCuffs', function()
    cuffs()
end)

RegisterNetEvent('r_handcuffs:client:execUncuffs', function()
    uncuffs()
end)

RegisterNetEvent('r_handcuffs:client:execRope', function()
    rope()
end)

RegisterNetEvent('r_handcuffs:client:execUnrope', function()
    unrope()
end)

RegisterNetEvent('r_handcuffs:client:execGrinder', function()
    grinder()
end)

-- [[ Functions ]]

function Hint(message)
    AddTextEntry('r_handcuffs', message)
    BeginTextCommandDisplayHelp('r_handcuffs')
    EndTextCommandDisplayHelp(0, 0, 0, -1)
end

RegisterNetEvent('r_handcuffs:client:sendNotification', function(message)
    PlaySound(-1, "Mission_Pass_Notify", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 0, 0, 1)
    
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(message)
    DrawNotification(false, true)
end)

function DisableControl()
    DisableControlAction(0, 24, true)
    DisablePlayerFiring(ped, true)
    DisableControlAction(0, 142, true)
    DisableControlAction(0, 25, true)

    if Config.DisableSprint then
        DisableControlAction(0, 21, true)
    end
    
    DisableControlAction(0, 22, true)
end

function FreezePlayer()
    DisableControlAction(0, 24, true)
    DisablePlayerFiring(ped, true)
    DisableControlAction(0, 142, true)
    DisableControlAction(0, 25, true)
    DisableControlAction(0, 30, true)
    DisableControlAction(0, 31, true)
    DisableControlAction(0, 32, true)
    DisableControlAction(0, 33, true)
    DisableControlAction(0, 34, true)
    DisableControlAction(0, 35, true)
    DisableControlAction(0, 36, true)
    DisableControlAction(0, 22, true)
end

-- [[ Thread ]]

if #Config.Framework.NeedItemToCutRope == 0 then
    if Config.Framework.ESX or Config.Framework.QBCore or Config.Framework.OXInventory then
        Citizen.CreateThread(function()
            while true do
                sleep = 400
        
                local pedInFront = GetPedInFront()
        
                if Player(pedInFront).state['rope'] and IsPlayerBehind(pedInFront) then
                    sleep = 0
        
                    Hint(Config.Languages[Config.Language]['cutrope'])
        
                    if IsControlJustPressed(0, Config.Keys.CutRopeKey) then
                        TriggerServerEvent('r_handcuffs:client:unrope', pedInFront)
                        Wait(3000)
                    end
                end
                
                Wait(sleep)
            end
        end)
    end
end