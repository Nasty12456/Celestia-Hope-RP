SocietyBanking = {
    [Society.SnipeBanking] = {
        AddMoney = function(money)
            exports["snipe-banking"]:AddMoneyToAccount(Config.SocietyName, money)
        end,
        RemoveMoney = function(money)
            exports["qb-banking"]:RemoveMoneyFromAccount(Config.SocietyName, money)
        end,
        GetBalance = function()
            return exports['qb-banking']:GetAccountBalance(Config.SocietyName)
        end
    },
    [Society.QbBanking] = {
        AddMoney = function(money)
            exports["qb-banking"]:AddMoney(Config.SocietyName, money)
        end,
        RemoveMoney = function(money)
            exports["qb-banking"]:RemoveMoney(Config.SocietyName, money)
        end,
        GetBalance = function()
            return exports['qb-banking']:GetAccountBalance(Config.SocietyName)
        end
    },
    [Society.QbBossMenu] = {
        AddMoney = function(money)
            TriggerEvent("qb-bossmenu:server:addAccountMoney", Config.SocietyName, money)
        end,
        RemoveMoney = function(money)
            TriggerEvent("qb-bossmenu:server:removeAccountMoney", Config.SocietyName, money)
        end,
        GetBalance = function()
            return exports["qb-bossmenu"]:GetAccount(Config.SocietyName)
        end
    },
    [Society.QbManagement] = {
        AddMoney = function(money)
            exports["qb-management"]:AddMoney(Config.SocietyName, money)
        end,
        RemoveMoney = function(money)
            exports["qb-management"]:removeMoney(Config.SocietyName, money)
        end,
        GetBalance = function()
            return exports['qb-management']:GetAccount(Config.SocietyName)
        end
    },
    [Society.RenewedBanking] = {
        AddMoney = function(money)
            exports['Renewed-Banking']:addAccountMoney(Config.SocietyName, money)
        end,
        RemoveMoney = function(money)
            exports['Renewed-Banking']:removeAccountMoney(Config.SocietyName, money)
        end,
        GetBalance = function()
            return exports['Renewed-Banking']:getAccountMoney(Config.SocietyName)
        end
    },
    [Society.OkokBanking] = {
        AddMoney = function(money)
            exports['okokBanking']:AddMoney(Config.SocietyName, money)
        end,
        RemoveMoney = function(money)
            exports['okokBanking']:RemoveMoney(Config.SocietyName, money)
        end,
        GetBalance = function()
            return exports['okokBanking']:GetAccount(Config.SocietyName)
        end
    },
    [Society.Management710] = {
        AddMoney = function(money)
            exports['710-Management']:AddAccountMoney(Config.SocietyName, money)
        end,
        RemoveMoney = function(money)
            exports['710-Management']:RemoveAccountMoney(Config.SocietyName, money)
        end,
        GetBalance = function()
            return exports['710-Management']:GetManagementAccount(Config.SocietyName).balance
        end
    },
    [Society.FdBanking] = {
        AddMoney = function(money)
            exports['fd_banking']:AddMoney(Config.SocietyName, money, 'Society add')
        end,
        RemoveMoney = function(money)
            exports['fd_banking']:RemoveMoney(Config.SocietyName, money, 'Society remove')
        end,
        GetBalance = function()
            return exports['fd_banking']:GetAccount(Config.SocietyName)
        end
    },
    [Society.EsxAddonAccount] = {
        AddMoney = function(money)
            TriggerEvent('esx_addonaccount:getSharedAccount', Config.SocietyName, function(account)
                if account then
                    account.addMoney(money)
                else
                    print(string.format("^1[%s][ERROR]^7 Society ^1'%s'^7 do not exists!", GetCurrentResourceName(),
                        Config.SocietyName))
                end
            end)
        end,
        RemoveMoney = function(money)
            TriggerEvent('esx_addonaccount:getSharedAccount', Config.SocietyName, function(account)
                if account then
                    account.removeMoney(money)
                else
                    print(string.format("^1[%s][ERROR]^7 Society ^1'%s'^7 do not exists!", GetCurrentResourceName(),
                        Config.SocietyName))
                end
            end)
        end,
        GetBalance = function()
            local promise = promise:new()
            local money = 0
            TriggerEvent('esx_addonaccount:getSharedAccount', Config.SocietyName, function(account)
                if account then
                    money = account.money
                else
                    print(string.format("^1[%s][ERROR]^7 Society ^1'%s'^7 do not exists!", GetCurrentResourceName(),
                        Config.SocietyName))
                end
                promise:resolve(money)
            end)
            Citizen.Await(promise)
            return money
        end
    }
}

function RemoveMoneyFromSociety(money)
    local societyFramework = GetSocietyResource()
    local banking = SocietyBanking[societyFramework]
    if banking then
        banking.RemoveMoney(money)
    else
        print('^1No society resource found.^0')
    end
end

function GiveMoneyToSociety(money)
    local societyFramework = GetSocietyResource()
    local banking = SocietyBanking[societyFramework]
    if banking then
        banking.AddMoney(money)
    else
        print('^1No society resource found.^0')
    end
end

function GetMoneyFromSociety()
    if not Config.EnableSociety then
        return 2147483647
    end
    local societyFramework = GetSocietyResource()
    local banking = SocietyBanking[societyFramework]
    if banking then
        return banking.GetBalance()
    else
        print('^1No society resource found.^0')
        return 0
    end
end

local currentSociety
function GetSocietyResource()
    if Config.SocietyFramework and Config.SocietyFramework ~= Society.AutoChoose then
        return Config.SocietyFramework
    end

    -- no need to check over again which society runs on the server if we have found one already.
    if currentSociety then
        return currentSociety
    end

    -- we can check before hand if the server is running qb-banking and is specific version for exports if not we will simply remove it from the Society list because we dont need it.
    local qbBakingResourceName = SocietyResourceName[Society.QbBanking]
    if IsResourceStarted(qbBakingResourceName) and GetResourceMetadata(qbBakingResourceName, 'version', 0) >= '2.0.0' then
        currentSociety = Society.QbBanking
        return currentSociety
    else
        if Society[Society.QbBanking] then
            SocietyResourceName[Society.QbBanking] = nil
            Society[Society.QbBanking] = nil
        end
    end

    for k, v in pairs(SocietyResourceName) do
        if GetResourceState(v) == 'started' then
            currentSociety = k
            return k
        end
    end

    return Society.None
end
