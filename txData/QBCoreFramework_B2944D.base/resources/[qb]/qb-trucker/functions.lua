local QBCore = exports['qb-core']:GetCoreObject()

-- Put your own notify trigger event
function ShowNotification(msg)
    QBCore.Functions.Notify(msg, 'info')
end

function GiveCarKey()
    TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
end

