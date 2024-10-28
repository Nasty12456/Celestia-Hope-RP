ESX = Core
QBCore = Core

-- Buy here: (4€+VAT) https://store.brutalscripts.com
function notification(title, text, time, type)
    if Config.BrutalNotify then
        exports['brutal_notify']:SendAlert(title, text, time, type)
    else
        -- Put here your own notify and set the Config.BrutalNotify to false
        SetNotificationTextEntry("STRING")
        AddTextComponentString(text)
        DrawNotification(0,1)

        -- Default ESX Notify:
        --TriggerEvent('esx:showNotification', text)

        -- Default QB Notify:
        --TriggerEvent('QBCore:Notify', text, 'info', 5000)

        -- OKOK Notify:
        -- exports['okokNotify']:Alert('POLICE JOB',title, text, time, type, false)

    end
end

function TextUIFunction(type, text)
    if type == 'open' then
        if Config.TextUI:lower() == 'ox_lib' then
            lib.showTextUI(text)
        elseif Config.TextUI:lower() == 'okoktextui' then
            exports['okokTextUI']:Open(text, 'darkblue', 'right')
        elseif Config.TextUI:lower() == 'esxtextui' then
            ESX.TextUI(text)
        elseif Config.TextUI:lower() == 'qbdrawtext' then
            exports['qb-core']:DrawText(text,'left')
        elseif Config.TextUI:lower() == 'brutal_textui' then
            exports['brutal_textui']:Open(text, "blue")
        end
    elseif type == 'hide' then
        if Config.TextUI:lower() == 'ox_lib' then
            lib.hideTextUI()
        elseif Config.TextUI:lower() == 'okoktextui' then
            exports['okokTextUI']:Close()
        elseif Config.TextUI:lower() == 'esxtextui' then
            ESX.HideUI()
        elseif Config.TextUI:lower() == 'qbdrawtext' then
            exports['qb-core']:HideText()
        elseif Config.TextUI:lower() == 'brutal_textui' then
            exports['brutal_textui']:Close()
        end
    end
end

function InventoryOpenFunction(type, job, size)
    if type == 'stash' then
        if Config.Inventory:lower() == 'ox_inventory' then
            exports.ox_inventory:openInventory('stash', { id = "stash_"..job})
        elseif Config.Inventory:lower() == 'qb_inventory' then
            TriggerServerEvent("inventory:server:OpenInventory", "stash", "stash_"..job, { label = Config.Locales.Stashes, maxweight = size*1000, slots = 100 })
            TriggerEvent("inventory:client:SetCurrentStash", "stash_"..job)
        elseif Config.Inventory:lower() == 'quasar_inventory' then
            TriggerServerEvent("inventory:server:OpenInventory", "stash", "stash_"..job, { label = Config.Locales.Stashes, maxweight = size*1000, slots = 100 })
            TriggerEvent("inventory:client:SetCurrentStash", "stash_"..job)
        elseif Config.Inventory:lower() == 'codem_inventory' then
            TriggerServerEvent("inventory:server:OpenInventory", "stash", "stash_"..job, { label = Config.Locales.Stashes, maxweight = size*1000, slots = 100 })
            TriggerEvent("inventory:client:SetCurrentStash", "stash_"..job)
        elseif Config.Inventory:lower() == 'chezza_inventory' then
            TriggerEvent('inventory:openStorage', Config.Locales.Stashes, "stash_"..job, size, 1000, {job})
        elseif Config.Inventory:lower() == 'core_inventory' then
            TriggerServerEvent('core_inventory:server:openInventory', "stash_"..job, "big_storage")
        end
    elseif type == 'safe' then
        if Config.Inventory:lower() == 'ox_inventory' then
            exports.ox_inventory:openInventory('stash', { id = "safe_"..job})
        elseif Config.Inventory:lower() == 'qb_inventory' then
            TriggerServerEvent("inventory:server:OpenInventory", "stash", "safe_"..job, { label = Config.Locales.Safe, maxweight = size*1000, slots = 50 })
            TriggerEvent("inventory:client:SetCurrentStash", "stash_"..job)
        elseif Config.Inventory:lower() == 'quasar_inventory' then
            TriggerServerEvent("inventory:server:OpenInventory", "stash", "safe_"..job, { label = Config.Locales.Safe, maxweight = size*1000, slots = 50 })
            TriggerEvent("inventory:client:SetCurrentStash", "stash_"..job)
        elseif Config.Inventory:lower() == 'codem_inventory' then
            TriggerServerEvent("inventory:server:OpenInventory", "stash", "safe_"..job, { label = Config.Locales.Safe, maxweight = size*1000, slots = 50 })
            TriggerEvent("inventory:client:SetCurrentStash", "stash_"..job)
        elseif Config.Inventory:lower() == 'chezza_inventory' then
            TriggerEvent('inventory:openStorage', Config.Locales.Stashes, "safe_"..job, size, 1000, {job})
        elseif Config.Inventory:lower() == 'core_inventory' then
            TriggerServerEvent('core_inventory:server:openInventory', "safe_"..job, "stash")
        end
    end
end

function setPlayerSkin(skinTable)
    if Config['Core']:upper() == 'ESX' then
        TriggerEvent('skinchanger:loadSkin', skinTable.skin)
    elseif Config['Core']:upper() == 'QBCORE' then
        TriggerEvent("qb-clothes:loadSkin", false, tonumber(skinTable.model), skinTable.skin)
        TriggerServerEvent("brutal_gangs:server:qbcore-loadPlayerSkin", tonumber(skinTable.model), skinTable.skin)
    end
end

RegisterNetEvent('brutal_gangs:client:utils:CreateVehicle')
AddEventHandler('brutal_gangs:client:utils:CreateVehicle', function(Vehicle)
    SetVehicleFuelLevel(Vehicle, 100.0)
    DecorSetFloat(Vehicle, "_FUEL_LEVEL", GetVehicleFuelLevel(Vehicle))

    if Config['Core']:upper() == 'QBCORE' then
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(Vehicle))
    end
end)

RegisterNetEvent('brutal_gangs:client:utils:DeleteVehicle')
AddEventHandler('brutal_gangs:client:utils:DeleteVehicle', function(Vehicle)
    DeleteEntity(Vehicle)
end)

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