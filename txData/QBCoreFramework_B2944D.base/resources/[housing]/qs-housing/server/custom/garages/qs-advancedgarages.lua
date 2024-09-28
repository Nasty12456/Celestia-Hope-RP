if Config.Garage ~= 'qs-advancedgarages' then
    return
end

function TriggerAddHouseGarage(house, garageInfo)
    TriggerClientEvent('advancedgarages:AddShellGarage', -1, house, garageInfo)
end

function TriggerHouseUpdateGarage(garages)
    TriggerClientEvent('advancedgarages:GetShellGarageData', -1, garages)
end
