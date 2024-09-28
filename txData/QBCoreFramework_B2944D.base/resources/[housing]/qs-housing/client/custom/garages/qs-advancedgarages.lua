if Config.Garage ~= 'qs-advancedgarages' then
    return
end

function TriggerHouseUpdateGarage()
    TriggerEvent('advancedgarages:SetShellGarageData', CurrentHouse, CurrentHouseData.haskey)
end
