--HUD Update
RegisterNetEvent('ngd-bahama:Server:UpdateHud', function(src, hunger, thirst, stress)
    if Bridge.Framework == 'esx' then
        --Stuff that happens to update HUD if needed
    elseif Bridge.Framework == 'qb' then
        TriggerClientEvent('hud:client:UpdateNeeds', src, hunger, thirst)
        TriggerClientEvent('hud:client:UpdateStress', src, stress)
    end
end)

--Society Money
---@param job string - Job to deposit money into.  Comes from Config.Job
---@param totalPrice integer - Total amount of money to deposit into society fund

function PaySociety(job, totalPrice)
    Framework.SocietyAddMoney(job, 'job', totalPrice)
  end