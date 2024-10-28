ESX = Core
QBCore = Core

-- Buy here: (4€+VAT) https://store.brutalscripts.com
function notification(title, text, time, type)
    if Config.BrutalNotify then
        exports['brutal_notify']:SendAlert(title, text, time, type)
    else
        -- Put here your own notify and set the Config.BrutalNotify to false

        -- Default ESX Notify:
        --TriggerEvent('esx:showNotification', text)

        -- Default QB Notify:
        --TriggerEvent('QBCore:Notify', text, 'info', 5000)

        -- OKOK Notify:
        -- exports['okokNotify']:Alert('POLICE JOB',title, text, time, type, false)

    end
end

function OpenMenuUtil()
    InMenu = true
    SetNuiFocus(true, true)

    Citizen.CreateThread(function()
        while InMenu do
            N_0xf4f2c0d4ee209e20() -- it's disable the AFK camera zoom
            Citizen.Wait(15000)
        end 
    end)

    DisplayRadar(false)
end

function DisableMinimap()
    DisplayRadar(false)
    -- Here you can add a trigger to hide your HUD system
end

function EnableMinimap()
    DisplayRadar(true)
    -- Here you can add a trigger to enable your HUD system
end

function HandCuffedEvent(cuffed)
    if cuffed then
        --exports['qs-smartphone']:canUsePhone(false)
        --exports["lb-phone"]:ToggleDisabled(true)
    else
        --exports['qs-smartphone']:canUsePhone(true)
        --exports["lb-phone"]:ToggleDisabled(false)
    end
end