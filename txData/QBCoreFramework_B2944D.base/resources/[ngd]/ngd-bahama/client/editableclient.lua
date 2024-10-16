--Billing
RegisterNetEvent('ngd-bahama:Client:Billing', function()
    if Config.BillingSystem == 'jimpayments' then
        TriggerEvent('jim-payments:client:Charge', { label = "charge", job = Config.Job })
        if Config.debug then print("Jim-Payments") end
    elseif Config.BillingSystem == 'okokBilling' then
        TriggerEvent("okokBilling:ToggleCreateInvoice")
        if Config.debug then print("okokBilling") end
    elseif Config.BillingSystem == 'NGD' then
        TriggerServerEvent("ngd-bahama:Server:GetBillingPlayers")
        if Config.debug then print("NGD Billing") end
    elseif Config.BillingSystem == 'custom' then
        --Custom Billing
        if Config.debug then print("custom") end
    end
end)

--SOCIETY
RegisterNetEvent('ngd-bahama:Client:BossMenu', function()
    if Bridge.Framework == 'esx' then
        TriggerEvent('esx_society:openBossMenu', Config.Job, function(data, menu)
            if menu then return menu.close() end
            ESX.CloseContext() 
          end, { wash = false })
    elseif Bridge.Framework == 'qb' then
        TriggerEvent('qb-bossmenu:client:OpenMenu')
    end
end)

--DUTY
RegisterNetEvent('ngd-bahama:Client:DutyToggle', function()
    Framework.ToggleDuty()
end)

---DRUNK SYSTEM---
local function DrunkEffect(player)
    if Config.debug then print('DrunkEffectStarted') end
    Framework.LoadAnimSet("MOVE_M@DRUNK@MODERATEDRUNK")
    SetPedIsDrunk(player, true)
    SetPedMovementClipset(player, "MOVE_M@DRUNK@MODERATEDRUNK", 1.0)
    SetTransitionTimecycleModifier("spectator5", 10.00)
    SetTimeout(60000, function()
        SetPedIsDrunk(player, false)
        ResetPedMovementClipset(player, 1.0)
        SetTransitionTimecycleModifier("default", 10.00)
        if Config.debug then print('DrunkEffectEnded') end
    end)
end
local alcoholCount = 0
RegisterNetEvent('ngd-bahama:Client:Drunks', function(itemName)
    if Config.debug then print('DrunkEvent') end
    local player = PlayerPedId()
    alcoholCount += 1
    if Config.debug then print('AlcCount:', alcoholCount) end
    AlcoholLoop()
    if Bridge.Framework == 'qb' then
        if alcoholCount > 2 and alcoholCount < 5 then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
            DrunkEffect(player)
        elseif alcoholCount >= 7 then
            TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200)
            DrunkEffect(player)
        end
    elseif Bridge.Framework == 'esx' then
        AlcoholLoop()
        if alcoholCount > 2 and alcoholCount < 5 then
            DrunkEffect(player)
        elseif alcoholCount >= 6 then
            DrunkEffect(player)
        end
    end
end)
--Loop for drunk system--
function AlcoholLoop()
    CreateThread(function()
        while alcoholCount > 0 do
            Wait(1000 * 60 * 15)
            alcoholCount -= 1
        end
    end)
end

--Blip
if Config.Blip.Enabled then
    function CreateBlip()
        local blip = AddBlipForCoord(Config.Blip.Location.x, Config.Blip.Location.y, Config.Blip.Location.z)
        SetBlipSprite(blip, Config.Blip.Sprite)
        SetBlipDisplay(blip, 6)
        SetBlipScale(blip, Config.Blip.Scale)
        SetBlipAsShortRange(blip, Config.Blip.ShortRange)
        SetBlipColour(blip, Config.Blip.Color)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName(Config.Blip.Name)
        EndTextCommandSetBlipName(blip)
    end
end

--Notify
RegisterNetEvent('ngd-bahama:Client:Notify', function(title, message, length, type)
    Config.Notification(title, message, length, type)
end)

--Stress status for ESX
AddEventHandler('esx_status:loaded', function(status)
    TriggerEvent('esx_status:registerStatus', 'stress', 0, '#8F15A5', function(status)
        return true
    end, function(status)
        status.remove(500)
    end)
end)
