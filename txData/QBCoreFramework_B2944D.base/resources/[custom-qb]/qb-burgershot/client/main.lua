local QBCore = exports['qb-core']:GetCoreObject()
local onDuty = false
local clean = false
local client = false
local status = false
local smallblip = false
local bigblip = false
local bliptable = {}
local delivery = 0

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerPed = PlayerPedId()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == Config.Job then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

RegisterNetEvent('qb-burgershot:CraftSmallBagItem', function()
    TriggerServerEvent('qb-burgershot:SmallBagItem')
    TriggerServerEvent('qb-burgershot:givetoyburgershot')
end)

RegisterNetEvent('qb-burgershot:CraftBigBagItem', function()
    TriggerServerEvent('qb-burgershot:BigBagItem')
    TriggerServerEvent('qb-burgershot:givetoyburgershot')
end)

RegisterNetEvent('qb-burgershot:CraftGoatMenuItem', function()
    TriggerServerEvent('qb-burgershot:GoatMenuItem')
    TriggerServerEvent('qb-burgershot:givetoyburgershot')
end)

RegisterNetEvent('qb-burgershot:CraftCoffeeMenuItem', function()
    TriggerServerEvent('qb-burgershot:CoffeeMenuItem')
    TriggerServerEvent('qb-burgershot:givetoyburgershot')
end)

RegisterNetEvent("rz:burgershot:shop")
AddEventHandler("rz:burgershot:shop", function()
    if onDuty then
        local PlayerData = QBCore.Functions.GetPlayerData()
        if PlayerData.job and PlayerData.job.name == Config.Job then 
            TriggerServerEvent("inventory:server:OpenInventory", "shop", "burgershot", Config.Shop)
        end
    else 
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
	end  
end)

---------Burger Shot Job---------

RegisterNetEvent("qb-burgershot:duty")
AddEventHandler("qb-burgershot:duty", function()
    TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterNetEvent("qb-burgershot:tray")
AddEventHandler("qb-burgershot:tray", function()
    TriggerEvent("inventory:client:SetCurrentStash", "tray")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "tray", {
        maxweight = 5000,
        slots = 5,
    })
end)

RegisterNetEvent("qb-burgershot:tray2")
AddEventHandler("qb-burgershot:tray2", function()
    TriggerEvent("inventory:client:SetCurrentStash", "tray2")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "tray2", {
        maxweight = 5000,
        slots = 5,
    })
end)

RegisterNetEvent("qb-burgershot:storge")
AddEventHandler("qb-burgershot:storge", function()
    if onDuty then
        TriggerEvent("inventory:client:SetCurrentStash", "storge")
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "storge", {
            maxweight = 250000,
            slots = 40,
        })
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:storge2")
AddEventHandler("qb-burgershot:storge2", function()
    if onDuty then
        TriggerEvent("inventory:client:SetCurrentStash", "storge2")
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "storge2", {
            maxweight = 250000,
            slots = 40,
        })
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:smallpacket")
AddEventHandler("qb-burgershot:smallpacket", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('rz:eat:server:get:smallpacket', function(HasItems)  
                if HasItems then
                    QBCore.Functions.Progressbar("pickup_sla", Lang:t("label.small"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "mini@repair",
                        anim = "fixing_a_player",
                        flags = 49,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('qb-burgershot:add:smallpacket')
                            Dirt()
                            client = true
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end)
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:bigpacket")
AddEventHandler("qb-burgershot:bigpacket", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('rz:eat:server:get:bigpacket', function(HasItems)  
                if HasItems then
                    QBCore.Functions.Progressbar("pickup_big", Lang:t("label.big"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "mini@repair",
                        anim = "fixing_a_player",
                        flags = 49,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('qb-burgershot:add:bigpacket')
                            Dirt()
                            client = true
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end)
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:goatpacket")
AddEventHandler("qb-burgershot:goatpacket", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('rz:eat:server:get:goatpacket', function(HasItems)  
                if HasItems then
                    QBCore.Functions.Progressbar("pickup_goat", Lang:t("label.goat"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "mini@repair",
                        anim = "fixing_a_player",
                        flags = 49,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('qb-burgershot:add:goatpacket')
                            Dirt()
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end)
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:coffeepacket")
AddEventHandler("qb-burgershot:coffeepacket", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('rz:eat:server:get:coffeepacket', function(HasItems)  
                if HasItems then
                    QBCore.Functions.Progressbar("pickup_coffee", Lang:t("label.coffee"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "mini@repair",
                        anim = "fixing_a_player",
                        flags = 49,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('qb-burgershot:add:coffeepacket')
                            Dirt()
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end)
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:client:bigcola")
AddEventHandler("qb-burgershot:client:bigcola", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('qb-burgershot:itemcheck', function(data)
                if data then
                    QBCore.Functions.Progressbar("bigcola", Lang:t("label.bigcola"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('qb-burgershot:server:bigcola')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end, Config.BigEmptyGlass)
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:client:smallcola")
AddEventHandler("qb-burgershot:client:smallcola", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('qb-burgershot:itemcheck', function(data)
                if data then
                    QBCore.Functions.Progressbar("smallcola", Lang:t("label.smallcola"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('qb-burgershot:server:smallcola')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end, Config.SmallEmptyGlass)
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:client:coffee")
AddEventHandler("qb-burgershot:client:coffee", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('qb-burgershot:itemcheck', function(data)
                if data then
                    QBCore.Functions.Progressbar("coffee2", Lang:t("label.coffee2"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('qb-burgershot:server:coffee')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end, Config.CoffeeEmptyGlass)
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:client:bigpotato")
AddEventHandler("qb-burgershot:client:bigpotato", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('rz:eat:server:get:bigpotato', function(HasItems)  
                if HasItems then
                    QBCore.Functions.Progressbar("bigpotato", Lang:t("label.bigpotato"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {
                        model = "prop_cs_fork",
                        bone = 28422,
                        coords = vector3(-0.005, 0.00, 0.00),
                        rotation = vector3(175.0, 160.0, 0.0),
                    }, {}, function() -- Done
                            TriggerServerEvent('qb-burgershot:server:bigpotato')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end)
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:client:smallpotato")
AddEventHandler("qb-burgershot:client:smallpotato", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('rz:eat:server:get:smallpotato', function(HasItems)  
                if HasItems then
                    QBCore.Functions.Progressbar("smallpotato", Lang:t("label.smallpotato"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {
                        model = "prop_cs_fork",
                        bone = 28422,
                        coords = vector3(-0.005, 0.00, 0.00),
                        rotation = vector3(175.0, 160.0, 0.0),
                    }, {}, function() -- Done
                            TriggerServerEvent('qb-burgershot:server:smallpotato')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end)
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:client:rings")
AddEventHandler("qb-burgershot:client:rings", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('rz:eat:server:get:rings', function(HasItems)  
                if HasItems then
                    QBCore.Functions.Progressbar("rings", Lang:t("label.rings"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {
                        model = "prop_cs_fork",
                        bone = 28422,
                        coords = vector3(-0.005, 0.00, 0.00),
                        rotation = vector3(175.0, 160.0, 0.0),
                    }, {}, function() -- Done
                        TriggerServerEvent('qb-burgershot:server:rings')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end)
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:client:nuggets")
AddEventHandler("qb-burgershot:client:nuggets", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('rz:eat:server:get:nuggets', function(HasItems)  
                if HasItems then
                    QBCore.Functions.Progressbar("nuggets", Lang:t("label.nuggets"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {
                        model = "prop_cs_fork",
                        bone = 28422,
                        coords = vector3(-0.005, 0.00, 0.00),
                        rotation = vector3(175.0, 160.0, 0.0),
                    }, {}, function() -- Done
                            TriggerServerEvent('qb-burgershot:server:nuggets')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end)
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:client:meat")
AddEventHandler("qb-burgershot:client:meat", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('qb-burgershot:itemcheck', function(data)
                if data then
                    QBCore.Functions.Progressbar("meat", Lang:t("label.meat"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {
                        model = "prop_cs_fork",
                        bone = 28422,
                        coords = vector3(-0.005, 0.00, 0.00),
                        rotation = vector3(175.0, 160.0, 0.0),
                    }, {}, function() -- Done
                            TriggerServerEvent('qb-burgershot:server:meat')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end, Config.FrozenMeat)
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:client:bleederburger")
AddEventHandler("qb-burgershot:client:bleederburger", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('rz:eat:server:get:bleederburger', function(HasItems)  
                if HasItems then
                    QBCore.Functions.Progressbar("bleederburger", Lang:t("label.bleederburger"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "mini@repair",
                        anim = "fixing_a_player",
                        flags = 49,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('qb-burgershot:server:bleederburger')
                            Dirt()
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end)
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:client:bigkingburger")
AddEventHandler("qb-burgershot:client:bigkingburger", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('rz:eat:server:get:bigkingburger', function(HasItems)  
                if HasItems then
                    QBCore.Functions.Progressbar("bigkingburger", Lang:t("label.bigkingburger"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "mini@repair",
                        anim = "fixing_a_player",
                        flags = 49,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('qb-burgershot:server:bigkingburger')
                            Dirt()
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end) 
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:client:wrap")
AddEventHandler("qb-burgershot:client:wrap", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('rz:eat:server:get:wrap', function(HasItems)  
                if HasItems then
                    QBCore.Functions.Progressbar("wrap", Lang:t("label.wrap"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "mini@repair",
                        anim = "fixing_a_player",
                        flags = 49,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('qb-burgershot:server:wrap')
                            Dirt()
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end) 
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:client:macaroon")
AddEventHandler("qb-burgershot:client:macaroon", function()
    if onDuty then
        if clean then 
            QBCore.Functions.Progressbar("macaroon", Lang:t("label.macaroon"), Config.ProgressbarTime, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
                animDict = "mp_common",
                anim = "givetake1_a",
                flags = 8,
            }, {}, {}, function() -- Done
                    TriggerServerEvent('qb-burgershot:server:macaroon')
                    Dirt()
                QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
            end, function()
                QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
            end)
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:client:chocolateicecream")
AddEventHandler("qb-burgershot:client:chocolateicecream", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('qb-burgershot:itemcheck', function(data)
                if data then
                    QBCore.Functions.Progressbar("chocolateicecream", Lang:t("label.chocolateicecream"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('qb-burgershot:server:chocolateicecream')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end, Config.Cone) 
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:client:vanillaicecream")
AddEventHandler("qb-burgershot:client:vanillaicecream", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('qb-burgershot:itemcheck', function(data)
                if data then
                    QBCore.Functions.Progressbar("vanillaicecream", Lang:t("label.vanillaicecream"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('qb-burgershot:server:vanillaicecream')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end, Config.Cone) 
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:client:thesmurfsicecream")
AddEventHandler("qb-burgershot:client:thesmurfsicecream", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('qb-burgershot:itemcheck', function(data)
                if data then
                    QBCore.Functions.Progressbar("thesmurfsicecream", Lang:t("label.thesmurfsicecream"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('qb-burgershot:server:thesmurfsicecream')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end, Config.Cone) 
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:client:strawberryicecream")
AddEventHandler("qb-burgershot:client:strawberryicecream", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('qb-burgershot:itemcheck', function(data)
                if data then
                    QBCore.Functions.Progressbar("strawberryicecream", Lang:t("label.strawberryicecream"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('qb-burgershot:server:strawberryicecream')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end, Config.Cone) 
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:client:matchaicecream")
AddEventHandler("qb-burgershot:client:matchaicecream", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('qb-burgershot:itemcheck', function(data)
                if data then
                    QBCore.Functions.Progressbar("matchaicecream", Lang:t("label.matchaicecream"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('qb-burgershot:server:matchaicecream')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end, Config.Cone) 
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:client:ubeicecream")
AddEventHandler("qb-burgershot:client:ubeicecream", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('qb-burgershot:itemcheck', function(data)
                if data then
                    QBCore.Functions.Progressbar("ubeicecream", Lang:t("label.ubeicecream"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('qb-burgershot:server:ubeicecream')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end, Config.Cone) 
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:client:smurfetteicecream")
AddEventHandler("qb-burgershot:client:smurfetteicecream", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('qb-burgershot:itemcheck', function(data)
                if data then
                    QBCore.Functions.Progressbar("smurfetteicecream", Lang:t("label.smurfetteicecream"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('qb-burgershot:server:smurfetteicecream')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end, Config.Cone) 
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:client:unicornicecream")
AddEventHandler("qb-burgershot:client:unicornicecream", function()
    if onDuty then
        if clean then 
            QBCore.Functions.TriggerCallback('qb-burgershot:itemcheck', function(data)
                if data then
                    QBCore.Functions.Progressbar("unicornicecream", Lang:t("label.unicornicecream"), Config.ProgressbarTime, false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "amb@prop_human_bbq@male@base",
                        anim = "base",
                        flags = 8,
                    }, {}, {}, function() -- Done
                            TriggerServerEvent('qb-burgershot:server:unicornicecream')
                        QBCore.Functions.Notify(Lang:t("notify.createpacket"), "success")
                    end, function()
                        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
                    end)
                else
                    QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
                end
            end, Config.Cone) 
        else
            QBCore.Functions.Notify(Lang:t("notify.clean"), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:client:clean")
AddEventHandler("qb-burgershot:client:clean", function()
    QBCore.Functions.Progressbar("clean", Lang:t("label.clean"), Config.ProgressbarTime, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "amb@world_human_bum_standing@twitchy@idle_a",
        anim = "idle_a",
        flags = 49,
    }, {}, {}, function() -- Done
            clean = true
        QBCore.Functions.Notify(Lang:t("notify.dirt2"), "success")
    end, function()
        QBCore.Functions.Notify(Lang:t("notify.cancel"), "error")
    end)
end)

function Dirt()
	if math.random(1,100) < Config.Dirt then
		clean = false
        QBCore.Functions.Notify(Lang:t("notify.dirt"), "error")
	end
end

RegisterNetEvent("qb-burgershot:client:smallpacketsell")
AddEventHandler("qb-burgershot:client:smallpacketsell", function()
    if onDuty then
        smallblip = true
        random = math.random(1,#Config.SmallCoords)
        QBCore.Functions.Notify(Lang:t("notify.neworder"), "primary")
        SetNewWaypoint(Config.SmallCoords[random]["x"],Config.SmallCoords[random]["y"])
        status = true
        while status do
            local ped = PlayerPedId()
            local plycoords = GetEntityCoords(ped)
            local distance = #(plycoords - vector3(Config.SmallCoords[random]["x"],Config.SmallCoords[random]["y"],Config.SmallCoords[random]["z"])) 
            Citizen.Wait(1)
            if distance < 1.0 and client  then
                QBCore.Functions.DrawText3D(Config.SmallCoords[random]["x"],Config.SmallCoords[random]["y"],Config.SmallCoords[random]["z"], Lang:t("label.deliver"))
                if IsControlJustPressed(1, 38) then
                    SmallPacketSell()
                end
            end	
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:client:startdeliverysmall")
AddEventHandler("qb-burgershot:client:startdeliverysmall", function()
    if delivery == 0 then
        TriggerEvent("qb-burgershot:client:smallpacketsell")
        QBCore.Functions.SpawnVehicle(Config.Car, function(vehicle)
            SetEntityCoords(PlayerPed, Config.CarSpawnCoord.x, Config.CarSpawnCoord.y, Config.CarSpawnCoord.z-1.0)
            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
            TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
            SetVehicleLivery(vehicle, 14)
            SetVehicleColours(vehicle, 30, 30, 30)
            delivery = 1
        end, Config.CarSpawnCoord, true)
    else
        QBCore.Functions.Notify(Lang:t("notify.ondelivery"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:client:startdeliverybig")
AddEventHandler("qb-burgershot:client:startdeliverybig", function()
    if delivery == 0 then
        TriggerEvent("qb-burgershot:client:bigpacketsell")
        QBCore.Functions.SpawnVehicle(Config.Car, function(vehicle)
            SetEntityCoords(PlayerPed, Config.CarSpawnCoord.x, Config.CarSpawnCoord.y, Config.CarSpawnCoord.z-1.0)
            TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(vehicle))
            TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
            SetVehicleLivery(vehicle, 15)
            SetVehicleColours(vehicle, 62, 62, 62)
            delivery = 1
        end, Config.CarSpawnCoord, true)
    else
        QBCore.Functions.Notify(Lang:t("notify.ondelivery"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:client:bigpacketsell")
AddEventHandler("qb-burgershot:client:bigpacketsell", function()
    if onDuty then
        random = math.random(1,#Config.BigCoords)
        QBCore.Functions.Notify(Lang:t("notify.neworder"), "primary")
        SetNewWaypoint(Config.BigCoords[random]["x"],Config.BigCoords[random]["y"])
        bigblip = true
        status = true
        while status do
            local ped = PlayerPedId()
            local plycoords = GetEntityCoords(ped)
            local distance = #(plycoords - vector3(Config.BigCoords[random]["x"],Config.BigCoords[random]["y"],Config.BigCoords[random]["z"])) 
            Citizen.Wait(1)
            if distance < 1.0 and client then
                QBCore.Functions.DrawText3D(Config.BigCoords[random]["x"],Config.BigCoords[random]["y"],Config.BigCoords[random]["z"], Lang:t("label.deliver"))
                if IsControlJustPressed(1, 38) then
                    BigPacketSell()
                end
            end	
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.duty"), "error")
    end
end)

RegisterNetEvent("qb-burgershot:client:sellingfinish")
AddEventHandler("qb-burgershot:client:sellingfinish", function()
    if IsPedInAnyVehicle(PlayerPedId()) then
        if delivery == 1 then
            local car = GetVehiclePedIsIn(PlayerPedId(),true)
            NetworkFadeOutEntity(car, true,false)
            QBCore.Functions.DeleteVehicle(car)
            client = false
            status = false
            delivery = 0
            QBCore.Functions.Notify(Lang:t("notify.finish"), "primary")
        else
            QBCore.Functions.Notify(Lang:t("notify.notselling"), "primary")
        end
    else
        QBCore.Functions.Notify(Lang:t("notify.notfinish"), "primary")
    end
end)

function SmallPacketSell()
    local ped = PlayerPedId()
    QBCore.Functions.TriggerCallback('qb-burgershot:itemcheck', function(data)
        if data then
            QBCore.Functions.Progressbar("smallpacksell", Lang:t("label.packetsell"), Config.ProgressbarTime, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
                }, {
                animDict = "timetable@jimmy@doorknock@",
                anim = "knockdoor_idle",
                flags = 49,
            }, {}, {}, function() -- Done
                TriggerServerEvent("qb-burgershot:server:smallpacketsell")
                TriggerEvent("qb-burgershot:client:smallpacketsell")
                map = true
                ClearPedTasksImmediately(ped)
            end, function() -- Cancel
                -- Cancel
            end)
        else
            QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
            client = false
        end
    end, Config.SmallBagItem) 
end

function BigPacketSell()
    local ped = PlayerPedId()
    QBCore.Functions.TriggerCallback('qb-burgershot:itemcheck', function(data)
        if data then
            QBCore.Functions.Progressbar("bigpacketsell", Lang:t("label.packetsell"), Config.ProgressbarTime, false, true, { 
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
                }, {
                animDict = "timetable@jimmy@doorknock@",
                anim = "knockdoor_idle",
                flags = 49,
            }, {}, {}, function() -- Done
                TriggerServerEvent("qb-burgershot:server:bigpacketsell")
                TriggerEvent("qb-burgershot:client:bigpacketsell")
                map = true
                ClearPedTasksImmediately(ped)
            end, function() -- Cancel
                -- Cancel
            end)
        else
            QBCore.Functions.Notify(Lang:t("notify.needıtem"), "error")
            client = false
        end
    end, Config.BigBagItem) 
end

Citizen.CreateThread(function()
    local blip = AddBlipForCoord(vector3(-1183.37, -884.14, 13.86))
    SetBlipSprite(blip, 106)
    SetBlipDisplay(blip, 2)
    SetBlipScale(blip, 0.5)
    SetBlipColour(blip, 1)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Burger Shot")
    EndTextCommandSetBlipName(blip)
end)
