local QBCore = exports['qb-core']:GetCoreObject()



for i=1, #Config.Smoke, 1 do

    QBCore.Functions.CreateUseableItem(Config.Smoke[i].Item, function(source)
        src = source
        local xPlayer = QBCore.Functions.GetPlayer(source)
        
        local item     = Config.Smoke[i].Item
        local prop     = Config.Smoke[i].Prop
        local stress    = Config.Smoke[i].Stress
        local armor    = Config.Smoke[i].Armor
        local size    = Config.Smoke[i].Size
        local type    = Config.Smoke[i].Type
        local time    = Config.Smoke[i].Time

        if type == 'vape' or type == 'bong' then
            TriggerClientEvent('devcore_smokev2:client:Smoke', src, item, size, armor, stress, prop, type, time)
        end
    	if type == 'cigar' or type == 'cigarette' or type == 'joint' then
	    if xPlayer.Functions.GetItemByName(Config.Lighter) ~= nil then
            TriggerClientEvent('devcore_smokev2:client:Smoke', src, item, size, armor, stress, prop, type, time)
            else
            TriggerClientEvent('QBCore:Notify', source, Languages[Config.Language]['missing_lighter'], "error")
            end
        end
    end)
end


    for i=1, #Config.CigarettePack, 1 do

        QBCore.Functions.CreateUseableItem(Config.CigarettePack[i].PackItem, function(source)
            src = source
            local xPlayer = QBCore.Functions.GetPlayer(src)
            local pack     = Config.CigarettePack[i].PackItem
            local item     = Config.CigarettePack[i].CigaretteItem
            local amount    = Config.CigarettePack[i].Amount
        
            TriggerClientEvent('devcore_smokev2:client:CigarettesUnPack', src)
                xPlayer.Functions.RemoveItem(pack, 1)
                xPlayer.Functions.AddItem(item, amount)
                end)
        end


        for i=1, #Config.RollingJoints, 1 do

            QBCore.Functions.CreateUseableItem(Config.RollingJoints[i].Item, function(source)
                src = source
                local xPlayer = QBCore.Functions.GetPlayer(src)
                local weed     = Config.RollingJoints[i].Item
                local joint     = Config.RollingJoints[i].GiveJoint
                local amount    = Config.RollingJoints[i].Amount
            


                if xPlayer.Functions.GetItemByName(Config.Rollingpaper) ~= nil then
                    TriggerClientEvent('devcore_smokev2:client:RollingJoints', src, joint, amount)
                    Citizen.Wait(3000)
                        xPlayer.Functions.RemoveItem(weed, 1)
                        xPlayer.Functions.RemoveItem(Config.Rollingpaper, 1)
                        xPlayer.Functions.AddItem(joint, amount)
                    else
                    TriggerClientEvent('QBCore:Notify', source, Languages[Config.Language]['missing_ocb'], "error")
                    end
                end)
            end

        RegisterServerEvent("devcore_smokev2:server:RemoveItem")
        AddEventHandler("devcore_smokev2:server:RemoveItem", function(item, size, armor, stress, prop, type, time)
            src = source
            local xPlayer = QBCore.Functions.GetPlayer(source)
            xPlayer.Functions.RemoveItem(item, 1)
        end)
        
        RegisterServerEvent("devcore_smokev2:server:AddItem")
        AddEventHandler("devcore_smokev2:server:AddItem", function(item, size, armor, stress, prop, type, time)
            src = source
            local xPlayer = QBCore.Functions.GetPlayer(source)
            xPlayer.Functions.AddItem(item, 1)
        end)
        

RegisterServerEvent("devcore_smokev2:server:StartPropSmoke")
AddEventHandler("devcore_smokev2:server:StartPropSmoke", function(propsmoke, type)
    TriggerClientEvent("devcore_smokev2:client:StartPropSmoke", -1, propsmoke, type)
end)

RegisterServerEvent("devcore_smokev2:server:CheckItem")
AddEventHandler("devcore_smokev2:server:CheckItem", function(type)
    local xPlayer = QBCore.Functions.GetPlayer(source)

	if xPlayer.Functions.GetItemByName(Config.ItemVapeLiquid) ~= nil then
			xPlayer.Functions.RemoveItem(Config.ItemVapeLiquid, 1)
			TriggerClientEvent('devcore_smokev2:client:AddLiquid', source)
		else
            TriggerClientEvent('QBCore:Notify', source, Languages[Config.Language]['missing_liquid'], "error")
            
    end
end)



RegisterServerEvent("devcore_smokev2:server:checkbong")
AddEventHandler("devcore_smokev2:server:checkbong", function()
    for i=1, #Config.BongReloadItems, 1 do
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local Item  = Config.BongReloadItems[i].Items

	        if xPlayer.Functions.GetItemByName(Item) ~= nil then
                 xPlayer.Functions.RemoveItem(Item, 1)
	            TriggerClientEvent('devcore_smokev2:client:AddBong', source)
                break
            elseif i == #Config.BongReloadItems then
            TriggerClientEvent('QBCore:Notify', source, Languages[Config.Language]['missing_weed'], "error")
        end
    end
end)


RegisterServerEvent('devcore_smokev2:server:Receiver')
AddEventHandler('devcore_smokev2:server:Receiver', function(playerId, item, size, armor, stress, prop, type, time)
    local src = source
    local Player = QBCore.Functions.GetPlayer(source)
    local ReceiverPlayer = QBCore.Functions.GetPlayer(playerId)
    if ReceiverPlayer ~= nil then
    TriggerClientEvent("devcore_smokev2:client:Receiver", ReceiverPlayer.PlayerData.source, item, size, armor, stress, prop, type, time)
    end
end)

--Effect
RegisterServerEvent("devcore_smokev2:server:StopPropSmoke")
AddEventHandler("devcore_smokev2:server:StopPropSmoke", function(propsmoke)
    TriggerClientEvent("devcore_smokev2:client:StopPropSmoke", -1, propsmoke)
end)
-- mouth particle
RegisterServerEvent("devcore_smokev2:server:StartMouthSmoke")
AddEventHandler("devcore_smokev2:server:StartMouthSmoke", function(mouthsmoke, type)
    TriggerClientEvent("devcore_smokev2:client:StartMouthSmoke", -1, mouthsmoke, type)
end)

RegisterServerEvent("devcore_smokev2:server:StopMouthSmoke")
AddEventHandler("devcore_smokev2:server:StopMouthSmoke", function(mouthsmoke)
    TriggerClientEvent("devcore_smokev2:client:StopMouthSmoke", -1, mouthsmoke)
end)