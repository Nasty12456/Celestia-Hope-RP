Framework = Framework or {}

--
-- JOBS
--

-- Set the player job depending on the framework
-- @param playerSource number The player source
-- @param jobName string The job name
-- @param jobGrade number The job grade
function Framework:SetPlayerJob(playerSource, jobName, jobGrade)
    if self.currentFramework == "esx" then
        local xPlayer = self.object.GetPlayerFromId(playerSource)
        if not xPlayer then return end

        xPlayer.setJob(jobName, jobGrade)

        Logger:debug(("Set job name=%s gradeID=%s to %s"):format(jobName, jobGrade, xPlayer.getName()))
    elseif self.currentFramework == "qbcore" then
        local qbPlayer = self.object.Functions.GetPlayer(playerSource)
        if not qbPlayer then return end

        qbPlayer.Functions.SetJob(jobName, jobGrade)

        Logger:debug(("Set job name=%s gradeID=%s to %s"):format(jobName, jobGrade, ("%s %s"):format(qbPlayer.PlayerData.charinfo.firstname, qbPlayer.PlayerData.charinfo.lastname)))
    else
        return false
    end

    return true
end
exports("setPlayerJob", function(playerSource, jobName, jobGrade)
    Framework:SetPlayerJob(playerSource, jobName, jobGrade)
end)

-- Get the player job depending on the framework
-- @param playerSource number The player source
-- @return table | boolean The player job or false if nothing is found
function Framework:GetPlayerJob(playerSource, options)
    if self.currentFramework == "esx" then
        local xPlayer = self.object.GetPlayerFromId(playerSource)
        if not xPlayer then return end

        if options then
            if options.lowercaseJobName then
                xPlayer.job.name = string.lower(xPlayer.job.name)
            end

            if options.lowercaseJobGradeName then
                xPlayer.job.grade_name = string.lower(xPlayer.job.grade_name)
            end

            -- Map the data if needed
            if options.mapData then
                local mappedData = {}

                for key, value in pairs(xPlayer.job) do
                    mappedData[key] = value
                end

                if options.mapData.grade then
                    mappedData.grade = {}

                    if options.mapData.grade.name then
                        mappedData.grade.name = xPlayer.job.grade_name
                    end
                end

                return mappedData
            end
        end

        return xPlayer.job
    elseif self.currentFramework == "qbcore" then
        local qbPlayer = self.object.Functions.GetPlayer(playerSource)
        if not qbPlayer then return end

        if options then
            if options.lowercaseJobName then
                qbPlayer.PlayerData.job.name = string.lower(qbPlayer.PlayerData.job.name)
            end

            if options.lowercaseJobGradeName then
                qbPlayer.PlayerData.job.grade.name = string.lower(qbPlayer.PlayerData.job.grade.name)
            end

            -- Map the data if needed
            if options.mapData then
                local mappedData = {}

                for key, value in pairs(qbPlayer.PlayerData.job) do
                    if options.mapData[key] then
                        mappedData[key] = value
                    end
                end

                if options.mapData.grade then
                    mappedData.grade = {}

                    if options.mapData.grade.name then
                        mappedData.grade.name = qbPlayer.PlayerData.job.grade.name
                    end
                end

                return mappedData
            end
        end

        return qbPlayer.PlayerData.job
    end

    Logger:error(("No framework found for getting player job for playerSource=%s"):format(playerSource))

    return false
end
exports("getPlayerJob", function(playerSource, options)
    return Framework:GetPlayerJob(playerSource, options)
end)

--
-- BANKING SYSTEM
--

-- Get the cash of the player depending on the framework
-- @param playerSource number The player source
-- @return number | boolean The cash of the player or false if nothing is found
function Framework:GetPlayerCash(playerSource)
    if self.currentFramework == "esx" then
        local xPlayer = self.object.GetPlayerFromId(playerSource)
        if not xPlayer then return false end

        local moneyAccount = xPlayer.getAccount("money")
        if not moneyAccount then return false end

        return moneyAccount.money
    elseif self.currentFramework == "qbcore" then
        local qbPlayer = self.object.Functions.GetPlayer(playerSource)
        if not qbPlayer then return false end

        return qbPlayer.Functions.GetMoney("cash")
    end

    return false
end
exports("getPlayerCash", function(playerSource)
    return Framework:GetPlayerCash(playerSource)
end)

-- Get the money in the player bank account depending on the framework
-- @param playerSource number The player source
-- @return number | boolean The money in the player bank account or false if nothing is found
function Framework:GetPlayerBankMoney(playerSource)
    if self.currentFramework == "esx" then
        local xPlayer = self.object.GetPlayerFromId(playerSource)
        if not xPlayer then return false end

        local bankAccount = xPlayer.getAccount("bank")
        if not bankAccount then return false end

        return bankAccount.money
    elseif self.currentFramework == "qbcore" then
        local qbPlayer = self.object.Functions.GetPlayer(playerSource)
        if not qbPlayer then return false end

        return qbPlayer.Functions.GetMoney("bank")
    end

    Logger:error(("No framework found for getting player bank money for playerSource=%s"):format(playerSource))

    return false
end
exports("getPlayerBankMoney", function(playerSource)
    return Framework:GetPlayerBankMoney(playerSource)
end)

-- Remove cash from the player depending on the framework
-- @param playerSource number The player source
-- @param amount number The amount to remove
-- @return boolean true if the cash was removed, false otherwise
function Framework:RemovePlayerCash(playerSource, amount)
    if self.currentFramework == "esx" then
        local xPlayer = self.object.GetPlayerFromId(playerSource)
        if not xPlayer then return false end

        if self:GetPlayerCash(playerSource) < amount then
            return false
        end

        xPlayer.removeAccountMoney("money", amount)

        return true
    elseif self.currentFramework == "qbcore" then
        local qbPlayer = self.object.Functions.GetPlayer(playerSource)
        if not qbPlayer then return false end

        if self:GetPlayerCash(playerSource) < amount then
            return false
        end

        qbPlayer.Functions.RemoveMoney("cash", amount)

        return true
    end

    return false
end
exports("removePlayerCash", function(playerSource, amount)
    return Framework:RemovePlayerCash(playerSource, amount)
end)

-- Remove money from the player bank account depending on the framework
-- @param playerSource number The player source
-- @param amount number The amount to remove
-- @return boolean true if the money was removed, false otherwise
function Framework:RemovePlayerMoneyFromBankAccount(playerSource, amount)
    if self.currentFramework == "esx" then
        local xPlayer = self.object.GetPlayerFromId(playerSource)
        if not xPlayer then return false end

        if self:GetPlayerBankMoney(playerSource) < amount then
            return false
        end

        xPlayer.removeAccountMoney("bank", amount)

        return true
    elseif self.currentFramework == "qbcore" then
        local qbPlayer = self.object.Functions.GetPlayer(playerSource)
        if not qbPlayer then return false end

        if self:GetPlayerBankMoney(playerSource) < amount then
            return false
        end

        qbPlayer.Functions.RemoveMoney("bank", amount)

        return true
    end

    Logger:error(("No framework found for removing money from bank account for playerSource=%s"):format(playerSource))

    return false
end
exports("removePlayerMoneyFromBankAccount", function(playerSource, amount)
    return Framework:RemovePlayerMoneyFromBankAccount(playerSource, amount)
end)

-- Add money to a bank account depending on the framework
-- @param playerSource number The player source
-- @param amount number The amount to add
-- @return boolean true if the money was added, false otherwise
function Framework:AddPlayerMoneyToBankAccount(playerSource, amount)
    -- TODO: Check arguments

    if self.currentFramework == "esx" then
        local xPlayer = self.object.GetPlayerFromId(playerSource)
        if not xPlayer then return false end

        xPlayer.addAccountMoney("bank", amount)

        return true
    elseif self.currentFramework == "qbcore" then
        local qbPlayer = self.object.Functions.GetPlayer(playerSource)
        if not qbPlayer then return false end

        qbPlayer.Functions.AddMoney("bank", amount)

        return true
    end

    Logger:error(("No framework found for adding money to bank account for playerSource=%s"):format(playerSource))

    return false
end
exports("addPlayerMoneyToBankAccount", function(playerSource, amount)
    return Framework:AddPlayerMoneyToBankAccount(playerSource, amount)
end)

-- Add cash to a player depending on the framework
-- @param playerSource number The player source
-- @param amount number The amount to add
-- @return boolean true if the cash was added, false otherwise
function Framework:AddPlayerCash(playerSource, amount)
    if self.currentFramework == "esx" then
        local xPlayer = self.object.GetPlayerFromId(playerSource)
        if not xPlayer then return false end

        xPlayer.addAccountMoney("money", amount)

        return true
    elseif self.currentFramework == "qbcore" then
        local qbPlayer = self.object.Functions.GetPlayer(playerSource)
        if not qbPlayer then return false end

        qbPlayer.Functions.AddMoney("cash", amount)

        return true
    end

    Logger:error(("No framework found for adding money to cash for playerSource=%s"):format(playerSource))

    return false
end
exports("addPlayerCash", function(playerSource, amount)
    return Framework:AddPlayerCash(playerSource, amount)
end)

-- Transfer money from a player to another depending on the framework
-- @param playerSource number The player source
-- @param targetPlayerSource number The target player source
-- @param amount number The amount to transfer
-- @return boolean true if the money was transferred, false otherwise
function Framework:TransferBankMoney(playerSource, targetPlayerSource, amount)
    if not self:RemovePlayerMoneyFromBankAccount(playerSource, amount) then
        return false
    end

    if not self:AddPlayerMoneyToBankAccount(targetPlayerSource, amount) then
        return false
    end

    return true
end
exports("transferBankMoney", function(playerSource, targetPlayerSource, amount)
    return Framework:TransferBankMoney(playerSource, targetPlayerSource, amount)
end)

-- TODO: VERIFY THIS FUNCTION for ESX only
-- Transfer money from a player to another offline player depending on the framework
-- @param playerSource number The player source
-- @param targetPlayerFrameworkIdentifier string The target player framework identifier
-- @param amount number The amount to transfer
-- @return boolean true if the money was transferred, false otherwise
function Framework:TransferBankMoneyToOfflinePlayer(playerSource, targetPlayerFrameworkIdentifier, amount)
    if not self:RemovePlayerMoneyFromBankAccount(playerSource, amount) then
        return false
    end

    if self.currentFramework == "esx" then
        local usersORM = ORM:new("users")
        local targetRow = usersORM:findOne({ "accounts" }):where({ identifier = targetPlayerFrameworkIdentifier }):execute()

        if not targetRow then
            Logger:error(("No target player found for transferring money to offline player for playerSource=%s targetPlayerFrameworkIdentifier=%s"):format(playerSource, targetPlayerFrameworkIdentifier))

            return false
        end

        -- TODO: validate that targetRow["accounts"] is JSON

        local accountsResult = json.decode(targetRow["accounts"])
        accountsResult.bank = accountsResult.bank + amount

        usersORM:update({ accounts = json.encode(accountsResult) }):where({ identifier = targetPlayerFrameworkIdentifier }):execute()

        return true
    elseif self.currentFramework == "qbcore" then
        local playersORM = ORM:new("players")
        local targetRow = playersORM:findOne({ "money" }):where({ citizenid = targetPlayerFrameworkIdentifier }):execute()

        if not targetRow then
            Logger:error(("No target player found for transferring money to offline player for playerSource=%s targetPlayerFrameworkIdentifier=%s"):format(playerSource, targetPlayerFrameworkIdentifier))

            return false
        end

        -- TODO: validate that targetRow["money"] is JSON

        local moneyResult = json.decode(targetRow["money"])
        moneyResult.bank = moneyResult.bank + amount

        playersORM:update({ money = json.encode(moneyResult) }):where({ citizenid = targetPlayerFrameworkIdentifier }):execute()

        return true
    end

    Logger:error(("No framework found for transferring money to offline player for playerSource=%s targetPlayerFrameworkIdentifier=%s"):format(playerSource, targetPlayerFrameworkIdentifier))

    return false
end
exports("transferBankMoneyToOfflinePlayer", function(playerSource, targetPlayerFrameworkIdentifier, amount)
    return Framework:TransferBankMoneyToOfflinePlayer(playerSource, targetPlayerFrameworkIdentifier, amount)
end)

-- TODO: VERIFY THIS FUNCTION
-- Transfer bank money to a society depending on the framework
-- @param playerSource number The player source
-- @param societyName string The society name
-- @param amount number The amount to transfer
-- @return boolean true if the money was transferred, false otherwise
function Framework:TransferBankMoneyToSociety(playerSource, societyName, amount)
    if not self:RemovePlayerMoneyFromBankAccount(playerSource, amount) then
        return false
    end

    if not self:AddMoneyToSocietyAccount(societyName, amount) then
        return false
    end

    return true
end
exports("transferBankMoneyToSociety", function(playerSource, societyName, amount)
    return Framework:TransferBankMoneyToSociety(playerSource, societyName, amount)
end)

--
-- PLAYER IDENTIFIERS
--

-- Get the player identifier depending on the framework
-- @param playerSource number The player source
-- @return string | boolean The player identifier or false if nothing is found
function Framework:GetPlayerIdentifier(playerSource)
    if self.currentFramework == "esx" then
        local xPlayer = self.object.GetPlayerFromId(playerSource)
        if not xPlayer then return end

        return xPlayer.identifier
    elseif self.currentFramework == "qbcore" then
        local qbPlayer = self.object.Functions.GetPlayer(playerSource)
        if not qbPlayer then return end

        return qbPlayer.PlayerData.citizenid
    end

    return false
end
exports("getPlayerIdentifier", function(playerSource)
    return Framework:GetPlayerIdentifier(playerSource)
end)

-- Get the player source from identifier depending on the framework
-- @param playerFrameworkIdentifier string The player framework identifier
-- @return number | boolean The player source or false if nothing is found
function Framework:GetPlayerSourceFromIdentifier(playerFrameworkIdentifier)
    if self.currentFramework == "esx" then
        local xPlayer = self.object.GetPlayerFromIdentifier(playerFrameworkIdentifier)
        if not xPlayer then return false end

        return xPlayer.source
    elseif self.currentFramework == "qbcore" then
        local qbPlayer = self.object.Functions.GetPlayerByCitizenId(playerFrameworkIdentifier)
        if not qbPlayer then return false end

        return qbPlayer.PlayerData.source
    end

    Logger:error(("No framework found for getting player source from identifier for playerFrameworkIdentifier=%s"):format(playerFrameworkIdentifier))

    return false
end
exports("getPlayerSourceFromIdentifier", function(playerFrameworkIdentifier)
    return Framework:GetPlayerSourceFromIdentifier(playerFrameworkIdentifier)
end)

-- Get the player full name depending on the framework
-- @param playerSource number The player source
-- @return string | boolean The player full name or false if nothing is found
function Framework:GetPlayerFullName(playerSource)
    if self.currentFramework == "esx" then
        local xPlayer = self.object.GetPlayerFromId(playerSource)
        if not xPlayer then return false end

        return xPlayer.getName()
    elseif self.currentFramework == "qbcore" then
        local qbPlayer = self.object.Functions.GetPlayer(playerSource)
        if not qbPlayer then return false end

        return ('%s %s'):format(qbPlayer.PlayerData.charinfo.firstname, qbPlayer.PlayerData.charinfo.lastname)
    end

    Logger:error(("No framework found for getting player full name for playerSource=%s"):format(playerSource))

    return false
end
exports("getPlayerFullName", function(playerSource)
    return Framework:GetPlayerFullName(playerSource)
end)
EventManager:registerEvent("getPlayerFullName", function(source, callback)
    callback(Framework:GetPlayerFullName(source))
end)

-- Get the player identifier from the player's full name depending on the framework
-- @param dataObject table The data object
-- @return string | boolean The player identifier or false if nothing is found
function Framework:GetPlayerIdentifierFromFullName(dataObject)
    local firstname, lastname = dataObject.fullName:match("([^%s]+) ([^%s]+)")
    if not firstname or not lastname then
        Logger:error(("No first name or last name found for dataObject=%s"):format(json.encode(dataObject)))

        return false
    end

    if self.currentFramework == "esx" then
        local playersORM = ORM:new("users")
        local playerRow = playersORM:findOne({ "identifier" })
            :where({ firstname = firstname, lastname = lastname })
            :execute()

        if not playerRow then
            return false
        end

        return playerRow["identifier"]
    elseif self.currentFramework == "qbcore" then
        local jsonConditions = {
            {jsonField = "charinfo", jsonKey = "firstname", value = firstname},
            {jsonField = "charinfo", jsonKey = "lastname", value = lastname}
        }

        local playersORM = ORM:new("players")
        local playerRow = playersORM:findOne({ "citizenid" })
            :whereJsonLike(jsonConditions)
            :execute()

        if not playerRow then
            return false
        end

        return playerRow["citizenid"]
    end

    Logger:error(("No framework found for getting player identifier from full name for dataObject=%s"):format(json.encode(dataObject)))

    return false
end
exports("getPlayerIdentifierFromFullName", function(...)
    return Framework:GetPlayerIdentifierFromFullName(...)
end)

-- Get the player object depending on the framework
-- @param playerSource number The player source
-- @return table | boolean The player object or false if nothing is found
function Framework:GetPlayerObject(playerSource)
    if self.currentFramework == "esx" then
        local xPlayer = self.object.GetPlayerFromId(playerSource)
        if not xPlayer then return end

        return xPlayer
    elseif self.currentFramework == "qbcore" then
        local qbPlayer = self.object.Functions.GetPlayer(playerSource)
        if not qbPlayer then return end

        return qbPlayer
    end

    Logger:error(("No framework found for getting player object for playerSource=%s"):format(playerSource))

    return false
end
exports("getPlayerObject", function(playerSource)
    return Framework:GetPlayerObject(playerSource)
end)

-- Get the player object from identifier depending on the framework
-- @param playerFrameworkIdentifier string The player framework identifier
-- @return table | boolean The player object or false if nothing is found
function Framework:GetPlayerObjectFromIdentifier(playerFrameworkIdentifier)
    if self.currentFramework == "esx" then
        local xPlayer = self.object.GetPlayerFromIdentifier(playerFrameworkIdentifier)
        if not xPlayer then return false end

        return xPlayer
    elseif self.currentFramework == "qbcore" then
        local qbPlayer = self.object.Functions.GetPlayerByCitizenId(playerFrameworkIdentifier)
        if not qbPlayer then return false end

        return qbPlayer
    end

    Logger:error(("No framework found for getting player object from identifier for playerFrameworkIdentifier=%s"):format(playerFrameworkIdentifier))

    return false
end
exports("getPlayerObjectFromIdentifier", function(playerFrameworkIdentifier)
    return Framework:GetPlayerObjectFromIdentifier(playerFrameworkIdentifier)
end)

