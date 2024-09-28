Framework = Framework or {}

local TIMEOUT_TRIGGER_EVENT_NOT_RESPONDING = 5000

-- Add money to the society account
-- @param societyName string The name of the society
-- @param amount number The amount to add
-- @param options table The options for the function
-- @return boolean Whether the money was added successfully
function Framework:AddMoneyToSocietyAccount(societyName, amount, options)
    if options then
        if self.currentFramework == "qbcore" then
            -- This option is only for qb because ESX has a society_ prefix and qb don't
            if options.removePatternInName then
                societyName = string.gsub(societyName, options.removePatternInName, "")
            end
        end
    end

    if self.currentFramework == "esx" then
        local promise = promise.new()
        local callbackCalled = false

        TriggerEvent(Config.Framework.esx.events.addonAccount.getSharedAccount, societyName, function(account)
            callbackCalled = true

            account.addMoney(amount)

            promise:resolve(true)
        end)

        Citizen.SetTimeout(TIMEOUT_TRIGGER_EVENT_NOT_RESPONDING, function()
            if not callbackCalled then
                promise:resolve(false)
            end
        end)

        return Citizen.Await(promise)
    elseif self.currentFramework == "qbcore" then
        if Config.Dependencies.qbBanking then
            exports[Config.ExportNames.qbBanking]:AddMoney(societyName, amount)
        else
            exports[Config.ExportNames.qbManagement]:AddMoney(societyName, amount)
        end

        return true
    end

    Logger:error("No framework found for AddMoneyToSocietyAccount")

    return false
end
exports("addMoneyToSocietyAccount", function(...)
    return Framework:AddMoneyToSocietyAccount(...)
end)

-- Remove money from the society account
-- @param societyName string The name of the society
-- @param amount number The amount to remove
-- @param options table The options for the function
-- @return boolean Whether the money was removed successfully
function Framework:RemoveMoneyFromSocietyAccount(societyName, amount, options)
    if options then
        if self.currentFramework == "qbcore" then
            -- This option is only for qb because ESX has a society_ prefix and qb don't
            if options.removePatternInName then
                societyName = string.gsub(societyName, options.removePatternInName, "")
            end
        end
    end

    if self.currentFramework == "esx" then
        local promise = promise.new()

        TriggerEvent(Config.Framework.esx.events.addonAccount.getSharedAccount, societyName, function(account)
            if not account or account.money < amount then
                promise:resolve(false)
                return
            end

            account.removeMoney(amount)

            promise:resolve(true)
        end)

        return Citizen.Await(promise)
    elseif self.currentFramework == "qbcore" then
        if Config.Dependencies.qbBanking then
            local societyBalance = exports[Config.ExportNames.qbBanking]:GetAccountBalance(societyName)
            if not societyBalance or societyBalance < amount then
                return false
            end

            exports[Config.ExportNames.qbBanking]:RemoveMoney(societyName, amount)

            return true
        else
            local society = exports[Config.ExportNames.qbManagement]:GetAccount(societyName)
            if not society or society.money < amount then
                return false
            end

            exports[Config.ExportNames.qbManagement]:RemoveMoney(societyName, amount)

            return true
        end
    end

    return false
end
exports("removeMoneyFromSocietyAccount", function(...)
    return Framework:RemoveMoneyFromSocietyAccount(...)
end)

-- Get the society account
-- @param societyName string The name of the society
-- @param options table The options for the function
-- @return table The society account
function Framework:GetSocietyAccount(societyName, options)
    local promise = promise.new()

    if self.currentFramework == "esx" then
        TriggerEvent(Config.Framework.esx.events.addonAccount.getSharedAccount, societyName, function(account)
            promise:resolve(account)
        end)

        -- TODO: Add a timeout to resolve the promise with false if the event doesn't respond

        return Citizen.Await(promise)
    elseif self.currentFramework == "qbcore" then
        if options then
            -- This option is only for qb because ESX has a society_ prefix and qb don't
            if options.removePatternInName then
                societyName = string.gsub(societyName, options.removePatternInName, "")
            end
        end

        if Config.Dependencies.qbBanking then
            local account = exports[Config.ExportNames.qbBanking]:GetAccount(societyName)

            if not account then
                return false
            end
        else
            local managementFundsORM = ORM:new("management_funds")
            local managementFundsRow = managementFundsORM:findOne({ "job_name" }):where({ job_name = societyName }):execute()

            if not managementFundsRow then
                return false
            end
        end

        return true
    end

    return false
end
exports("getSocietyAccount", function(...)
    return Framework:GetSocietyAccount(...)
end)

-- Get the society account balance
-- @param societyName string The name of the society
-- @param options table The options for the function
-- @return number|boolean The society account balance or false if the account doesn't exist
function Framework:GetSocietyAccountBalance(societyName, options)
    if self.currentFramework == "esx" then
        local account = self:GetSocietyAccount(societyName)
        if not account then
            return false
        end

        return account.money
    elseif self.currentFramework == "qbcore" then
        if options then
            -- This option is only for qb because ESX has a society_ prefix and qb don't
            if options.removePatternInName then
                societyName = string.gsub(societyName, options.removePatternInName, "")
            end
        end

        if Config.Dependencies.qbBanking then
            Logger:debug(("Getting account balance for %s"):format(societyName))
            Logger:debug(("qbBanking: %s"):format(exports[Config.ExportNames.qbBanking]:GetAccountBalance(societyName)))

            return exports[Config.ExportNames.qbBanking]:GetAccountBalance(societyName)
        else
            local societyBalance = exports[Config.ExportNames.qbManagement]:GetAccount(societyName)
            if not societyBalance then
                return false
            end

            return societyBalance
        end
    end

    return false
end
exports("getSocietyAccountBalance", function(...)
    return Framework:GetSocietyAccountBalance(...)
end)

-- Create a society account (if using QBCore)
-- @param dataObject table The data object containing the society name
-- @param options table The options for the function
-- @return boolean Whether the society account was created successfully
function Framework:CreateSocietyAccount(dataObject, options)
    if self.currentFramework == "qbcore" then
        if options then
            -- This option is only for qb because ESX has a society_ prefix and qb don't
            if options.removePatternInName then
                dataObject.societyName = string.gsub(dataObject.societyName, options.removePatternInName, "")
            end
        end

        if not Config.Dependencies.qbBanking then
            Logger:info("Since qbBanking new version isn't used, no need to create a society account because it's already created.")
            return true
        end

        exports[Config.ExportNames.qbBanking]:CreateJobAccount(dataObject.societyName, dataObject.balance or 0)

        return true
    end
end
exports("createSocietyAccount", function(...)
    return Framework:CreateSocietyAccount(...)
end)