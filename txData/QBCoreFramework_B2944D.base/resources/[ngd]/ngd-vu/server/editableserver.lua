-- ██   ██ ██    ██ ██████
-- ██   ██ ██    ██ ██   ██
-- ███████ ██    ██ ██   ██
-- ██   ██ ██    ██ ██   ██
-- ██   ██  ██████  ██████

RegisterNetEvent('ngd-vu:Server:UpdateHud', function(src, hunger, thirst, stress)
    if Bridge.Framework == 'esx' then
        --Stuff that happens to update HUD if needed
    elseif Bridge.Framework == 'qb' then
        TriggerClientEvent('hud:client:UpdateNeeds', src, hunger, thirst)
        TriggerClientEvent('hud:client:UpdateStress', src, stress)
    end
end)


-- ███████ ████████ ██████  ██ ██████  ██████  ███████ ██████      ███    ███  ██████  ███    ██ ███████ ██    ██
-- ██         ██    ██   ██ ██ ██   ██ ██   ██ ██      ██   ██     ████  ████ ██    ██ ████   ██ ██       ██  ██
-- ███████    ██    ██████  ██ ██████  ██████  █████   ██████      ██ ████ ██ ██    ██ ██ ██  ██ █████     ████
--      ██    ██    ██   ██ ██ ██      ██      ██      ██   ██     ██  ██  ██ ██    ██ ██  ██ ██ ██         ██
-- ███████    ██    ██   ██ ██ ██      ██      ███████ ██   ██     ██      ██  ██████  ██   ████ ███████    ██

--Framework.RegisterSociety(Config.SocietyJob, 'job')
RegisterNetEvent('ngd-vu:Server:ThrowMoney', function(stagemoney)
    local src = source
    local Player = Framework.GetPlayer(src)
    if not Player then return end
    local hasmoney = Player.GetMoney(Config.MoneyType)
    if hasmoney >= stagemoney then
        TriggerClientEvent('ngd-vu:Client:GiveMoneyAnim', src)
        Player.RemoveMoney(Config.MoneyType, stagemoney)
        if Bridge.Framework == 'esx' then
            PaySociety(Config.SocietyJob, stagemoney)
        elseif Bridge.Framework == 'qb' or Bridge.Framework == 'qbox' then
            PaySociety(Config.SocietyJob, stagemoney)
        end
        if Config.debug then print('PlayerMoney:', hasmoney, 'MoneyEntered', stagemoney) end
    else
        if Config.debug then print('NO MONEY', 'PlayerMoney:', hasmoney, 'MoneyEntered', stagemoney) end
        TriggerClientEvent('ngd-vu:Client:Notify', src, Config.Notifications.NoMoneyT, Config.Notifications.NoMoneyM,
            5000, 'error')
    end
end)

--Society Money
---@param job string - Job to deposit money into.  Comes from Config.Job
---@param totalPrice integer - Total amount of money to deposit into society fund

function PaySociety(job, totalPrice)
    Framework.SocietyAddMoney(job, 'job', totalPrice)
  end
