if Config.Garage ~= 'qb-garages' then
    return
end

function TriggerAddHouseGarage(house, garageInfo)
    garageInfo.takeVehicle.w = garageInfo.takeVehicle.h
    TriggerClientEvent('qb-garages:client:addHouseGarage', -1, house, garageInfo)
end

function TriggerHouseUpdateGarage(garages)
    for k, v in pairs(garages) do
        v.takeVehicle.w = v.takeVehicle.h
    end
    TriggerClientEvent('qb-garages:client:houseGarageConfig', -1, garages)
end
