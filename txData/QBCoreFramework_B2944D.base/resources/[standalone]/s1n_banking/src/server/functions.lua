Functions = {}

-- This function was added to create a new structure for the table s1n_bank_statements_new (remove UUIDs, improve performance)
function Functions:TransformTransactionUUIDsIntoIDs()
    -- Check if there already is a column named `id` in the table `s1n_bank_statements` and if it is a BIGINT
    local checkColumnQuery = SQL.Execute([[
        SELECT COUNT(*) as count,
               GROUP_CONCAT(DISTINCT COLUMN_TYPE) as type
        FROM information_schema.COLUMNS
        WHERE TABLE_NAME = 's1n_bank_statements'
        AND COLUMN_NAME = 'id'
        AND DATA_TYPE = 'bigint'
    ]])[1]
    if checkColumnQuery and checkColumnQuery.count > 0 then
        Utils:Debug("DB: Column `id` already exists and is a BIGINT, so we don't need to transform the UUIDs into IDs")
        return
    end

    SQL.Execute([[
        CREATE TABLE IF NOT EXISTS `s1n_bank_statements_new`
            (
                `id`     BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
                `iban`   LONGTEXT NOT NULL COLLATE 'utf8mb4_general_ci',
                `action` LONGTEXT NOT NULL COLLATE 'utf8mb4_general_ci',
                `label`  LONGTEXT NOT NULL COLLATE 'utf8mb4_general_ci',
                `amount` INT(11)  NOT NULL DEFAULT '0',
                `date`   LONGTEXT NOT NULL COLLATE 'utf8mb4_general_ci',
                PRIMARY KEY (`id`) USING BTREE
            )
                COLLATE = 'utf8mb4_general_ci'
                ENGINE = InnoDB
    ]])
    SQL.Execute("INSERT INTO `s1n_bank_statements_new` (`iban`, `action`, `label`, `amount`, `date`) SELECT `iban`, `action`, `label`, `amount`, `date` FROM `s1n_bank_statements` ORDER BY `date` ASC")

    -- Create a temporary table to store the mapping between the old and new IDs
    SQL.Execute([[
        CREATE TEMPORARY TABLE id_mapping AS
        SELECT s1.id AS old_id, s2.id AS new_id, s1.iban, s1.action, s1.amount, s1.date
        FROM s1n_bank_statements s1
        JOIN s1n_bank_statements_new s2
        ON s1.iban = s2.iban AND s1.action = s2.action AND s1.label = s2.label AND s1.amount = s2.amount AND s1.date = s2.date
        WHERE s1.action = 'credit'
    ]])

    -- Update the `s1n_bank_statements_new` table with the new IDs
    local accounts = SQL.Execute("SELECT id, credit, iban FROM s1n_bank_accounts")

    for _, account in ipairs(accounts) do
        local credits = json.decode(account.credit)
        local updated = false

        for i, credit in ipairs(credits) do
            local newId = SQL.Execute("SELECT `new_id` FROM `id_mapping` WHERE `old_id` = ?", { credit.id })[1]

            Utils:Debug(("DB: Checking credit with ID %s"):format(credit.id))

            if newId then
                credits[i].id = tostring(newId.new_id)
                updated = true

                Utils:Debug(("DB: Found credit with ID %s, new ID is %s"):format(credit.id, newId.new_id))
            else
                Utils:Debug(("DB: Credit with ID %s is not linked to a statement ID, trying with date"):format(credit.id))

                -- Try using the date column to find the credit
                local newIdByDate = SQL.Execute("SELECT `new_id` FROM `id_mapping` WHERE `iban` = ? AND `action` = ? AND `amount` = ? AND `date` = ?", { account.iban, 'credit', credit.amount, credit.date })[1]

                if newIdByDate then
                    credits[i].id = tostring(newIdByDate.new_id)
                    updated = true

                    Utils:Debug(("DB: Found credit with ID %s by date, new ID is %s"):format(credit.id, newIdByDate.new_id))
                else
                    Utils:Debug(("DB: Credit with ID %s not found by date. Please contact the Support and give your Full Server Logs"):format(credit.id))
                end
            end
        end

        if updated then
            local encodedCredits = json.encode(credits)
            SQL.Execute("UPDATE s1n_bank_accounts SET credit = ? WHERE id = ?", { encodedCredits, account.id })

            Utils:Debug(("DB: Updated credits for account with ID %s"):format(account.id))
        end
    end

    SQL.Execute("DROP TABLE `s1n_bank_statements`")
    SQL.Execute("ALTER TABLE `s1n_bank_statements_new` RENAME TO `s1n_bank_statements`")
    SQL.Execute("DROP TEMPORARY TABLE id_mapping")
    SQL.Execute("ANALYZE TABLE s1n_bank_statements")

    Utils:Debug("DB: Transformed transaction UUIDs into IDs")
end

-- This function was added to handle an update we made to change the way we handle 'action' in the database
function Functions:RenameTransfersInRows()
    local result = SQL.Execute('SELECT * FROM `s1n_bank_statements` WHERE `action` = ?', { 'transfer' })
    if not result then return end

    for _, row in pairs(result) do
        row.action = 'transfer:withdraw'

        SQL.Execute('UPDATE `s1n_bank_statements` SET `action` = ? WHERE `id` = ?', { row.action, row.id })
        Utils:Debug(("Renamed transfer in row with id=%s"):format(row.id))
    end
end

-- This function was added only for QBCore to create the society accounts in the table of qb-banking (if they are using the latest version)
function Functions:CreateSocietyAccountsIfNotExists()
    if not exports[Config.ExportNames.s1nLib]:getCurrentFrameworkName() == "qbcore" then return end

    -- If the script is not using the latest version of qb-banking, we don't need to create the society accounts
    if not exports[Config.ExportNames.s1nLib]:isUsingDependency("qbBanking") then return end

    -- Wait 10 seconds to make sure the qb-banking exports are ready
    Wait(10000)

    local societyAccounts = SQL.Execute('SELECT `name` FROM `s1n_bank_accounts` WHERE `type` = ?', { 'societyaccount' })
    if not societyAccounts then return end

    for _, account in pairs(societyAccounts) do
        local societyName = string.gsub(account.name, "society_", "")

        Utils:Debug(("Checking if society account %s exists"):format(societyName))

        if not exports[Config.ExportNames.s1nLib]:getSocietyAccount(societyName) then
            Utils:Debug(("Creating society account %s"):format(societyName))

            -- Check if management_funds table exists
            local tableExists = SQL.Execute([[
                SELECT COUNT(*) AS count
                FROM information_schema.tables
                WHERE table_schema = DATABASE()
                AND table_name = 'management_funds'
            ]])[1]
            if tableExists and tableExists.count == 0 then
                Utils:Debug("Table management_funds does not exist, so will skip this step")

                exports[Config.ExportNames.s1nLib]:createSocietyAccount({ societyName = societyName })

                return
            end

            local fundSociety = SQL.Execute('SELECT `amount` FROM `management_funds` WHERE `job_name` = ?', { societyName })[1]
            if not fundSociety then
                Utils:Debug(("Society %s doesn't have any funds"):format(societyName))
                return
            end

            exports[Config.ExportNames.s1nLib]:createSocietyAccount({ societyName = societyName, balance = fundSociety.amount })
        end
    end
end

-- Check the database for any issues and fix them
function Functions:CheckDatabase()
    Utils:Debug("Checking database in progress...")

    -- If the script version was <= 1.20.0, we need to rename the transfers in the database
    self:RenameTransfersInRows()

    self:CreateSocietyAccountsIfNotExists()

    self:TransformTransactionUUIDsIntoIDs()

    Utils:Debug("Database check completed")
end

-- Create an IBAN
-- @return string The generated IBAN
function Functions:CreateIban()
    Utils:Debug("Creating IBAN")

    local iban

    -- To avoid duplicates, we will generate a random number and check if it already exists
    repeat
        iban = ("%s%s"):format(Config.IbanPrefix, math.random(Constants.MIN_IBAN_RANDOM, Constants.MAX_IBAN_RANDOM))
    until not Functions:IsIbanValid(iban)

    return iban
end

-- Verify if an iban is associated with an account
-- @param iban The iban to check
function Functions:IsIbanValid(iban)
    if not Utils:CheckType(iban, 'string') then return end

    Utils:Debug(("Checking iban validity for %s"):format(iban))

    local account = SQL.Execute('SELECT * FROM `s1n_bank_accounts` WHERE `iban` = ?', { iban })[1]

    return account ~= nil
end

-- Get the account from an iban
-- @param iban The iban to get the account from
-- @return table|boolean The account found or false if not found
function Functions:GetAccountFromIban(iban)
    iban = string.lower(iban)

    Utils:Debug(("Getting account from IBAN: %s"):format(iban))

    local accounts = SQL.Execute("SELECT * FROM `s1n_bank_accounts` WHERE `iban` = ?", { iban })

    if accounts then
        return accounts[1]
    end

    return false
end

-- Get the account from the name
-- @param name The name to get the account from
-- @return table|boolean The account found or false if not found
function Functions:GetSocietyAccountByName(name)
    Utils:Debug(("Getting society account by name: %s"):format(name))

    local accounts = SQL.Execute("SELECT * FROM `s1n_bank_accounts` WHERE `name` = ? AND `type` = 'societyaccount'", { name })

    if accounts then
        return accounts[1]
    end

    return false
end

-- Check if an account had a credit
-- @param accountIBAN The iban of the account
-- @return boolean If the account had a credit
function Functions:DoesAccountHadACredit(accountIBAN)
    if not Utils:CheckType(accountIBAN, 'string') then return end

    Utils:Debug(("Checking if account %s has a credit"):format(accountIBAN))

    local account = SQL.Execute('SELECT `credit` FROM `s1n_bank_accounts` WHERE `iban` = ?', { accountIBAN })[1]

    if not account then
        Utils:Debug(("Account %s does not exist"):format(accountIBAN))

        return
    end

    if not account.credit then
        Utils:Debug(("Account %s has an empty value for column 'credit'"):format(accountIBAN))

        return
    end

    account.credit = json.decode(account.credit)

    return #account.credit > 0
end

-- Get the credit of an account
-- @param creditObject The credit object
-- @param creditID The ID of the credit
-- @return table|boolean The credit found or false if not found
function Functions:GetCreditById(creditObject, creditID)
    Utils:Debug(("Getting credit by ID: %s"):format(creditID))

    for _, data in pairs(creditObject) do
        if data.id == creditID then
            return data
        end
    end

    return false
end

-- Get the active credits of every account
-- @return table The active credits
function Functions:GetActiveCredits()
    Utils:Debug("Getting active credits")

    local database = SQL.Execute("SELECT * FROM `s1n_bank_accounts`", { })
    local credits = {}

    for _, account in pairs(database) do
        account.credit = json.decode(account.credit)

        if account.credit then
            for _, credit in pairs(account.credit) do
                table.insert(credits, {
                    iban     = account.iban,
                    amount   = credit.amount,
                    paid     = credit.paid,
                    date     = credit.date,
                    duration = credit.duration,
                    id       = credit.id
                })
            end
        end
    end

    return credits
end

-- Get the amount to pay for a credit depending on the duration
-- @param amount The amount of the credit
-- @param duration The duration of the credit
-- @return number The amount to pay
function Functions:GetCreditAmountToPay(amount, duration)
    local days = duration / Constants.SECONDS_IN_ONE_DAY

    if (days <= 7) then
        return amount
    elseif (days > 7 and days < 30) then
        return math.floor(amount / math.floor(days / 7))
    elseif (days == 30) then
        return amount
    elseif (days > 30) then
        return math.floor(amount / math.floor(days / 30))
    end
end

-- Remove money from an account depending on the credit duration and amount
-- @param data The data to remove the money
function Functions:RemoveCreditMoney(data)
    Utils:Debug("Removing credit money")

    local database = SQL.Execute("SELECT `credit` FROM `s1n_bank_accounts` WHERE `iban` = ?", { data.iban })[1]
    local credits = json.decode(database.credit)

    for key, credit in pairs(credits) do
        if credit.id == data.id then
            local amountToPay = Functions:GetCreditAmountToPay(credit.amount, credit.duration)

            local playerSource = exports[Config.ExportNames.s1nLib]:getPlayerSourceFromIdentifier(database.owner)
            if not playerSource then return end

            if database.type == "useraccount" then
                if exports[Config.ExportNames.s1nLib]:RemovePlayerMoneyFromBankAccount(playerSource, amountToPay) then
                    credit.paid = credit.paid + amountToPay

                    if credit.amount == credit.paid then
                        exports[Config.ExportNames.s1nLib]:addPlayerMoneyToBankAccount(playerSource, (Config.Credit.SecurityDeposit / 100) * credit.amount)
                    end
                else
                    table.remove(credits, key)
                end
            elseif database.type == "societyaccount" then
                local accountData = Functions:GetSocietyAccountByName(database.name)

                if exports[Config.ExportNames.s1nLib]:removeMoneyFromSocietyAccount(accountData.name, amountToPay, { removePatternInName = "society_" }) then
                    credit.paid = credit.paid + amountToPay

                    if credit.amount == credit.paid then
                        exports[Config.ExportNames.s1nLib]:addMoneyToSocietyAccount(accountData.name, (Config.Credit.SecurityDeposit / 100) * credit.amount, { removePatternInName = "society_" })
                    end
                else
                    table.remove(credits, key)
                end
            elseif database.type == 'sharedaccount' then
                if database.balance >= amountToPay and credit.amount ~= credit.paid then
                    database.balance = database.balance - amountToPay

                    credit.paid = credit.paid + amountToPay

                    if credit.amount == credit.paid then
                        database.balance = database.balance + (Config.Credit.SecurityDeposit / 100) * credit.amount
                    end
                else
                    table.remove(credits, key)
                end
            end
        end
    end

    SQL.Execute('UPDATE `s1n_bank_accounts` SET credit = ?, balance = ? WHERE `iban` = ?', { json.encode(credits), database.balance, database.iban })
end

-- Sign a contract for a player
-- @param playerSource The player source
-- @param data The data to sign the contract
-- @return string The error message or nil if no error
function Functions:SignContract(playerSource, data)
    if not Config.Credit.Active then
        return Config.Translation.CREDIT_DISABLED
    end

    Utils:Debug(("Trying to sign contract for %s"):format(GetPlayerName(playerSource)))

    local accountData = Functions:GetAccountData(playerSource, data)

    if Functions:DoesAccountHadACredit(accountData.iban) then
        return Config.Translation.NOTIFICATION_ERROR_ACCOUNT_ALREADY_HAS_CREDIT
    end

    local securityDeposit = (Config.Credit.SecurityDeposit / 100) * data.amount
    local durationConfig = Config.Credit.Duration[data.duration + 1]

    local creditData = {
        amount   = data.amount,
        duration = durationConfig.Time,
        date     = os.time(),
        paid     = 0,
    }

    if data.type == 'useraccount' then
        if not exports[Config.ExportNames.s1nLib]:removePlayerMoneyFromBankAccount(playerSource, securityDeposit) then
            return Config.Translation.ACCOUNT_FUNDS_NOT_ENOUGH
        end

        exports[Config.ExportNames.s1nLib]:addPlayerMoneyToBankAccount(playerSource, data.amount)

        local transactionID = Functions:CreateNewTransaction(accountData, 'credit', Config.Translation.LABEL_USER_ACCOUNT_CREDIT, data.amount)
        if not transactionID then
            Utils:Debug("Error creating transaction, no ID returned")
            return Config.Translation.NOTIFICATION_ERROR_SOMETHING_WENT_WRONG
        end

        creditData.id = transactionID

        table.insert(accountData.credit, creditData)
        SQL.Execute('UPDATE `s1n_bank_accounts` SET credit = ? WHERE `iban` = ?', { json.encode(accountData.credit), accountData.iban })

        Functions:CreateNewTransaction(accountData, 'withdraw', Config.Translation.LABEL_PERSONAL_ACCOUNT_WITHDRAW, securityDeposit)

        Functions:RequestAccountUpdate(playerSource, data)

        API:SendDiscordLog(Config.Translation.AMOUNT_CREDITED_ACCOUNT_WEBHOOK:format(data.amount, GetPlayerName(playerSource)))
    elseif data.type == 'societyaccount' then
        if not exports[Config.ExportNames.s1nLib]:removeMoneyFromSocietyAccount(accountData.name, securityDeposit, { removePatternInName = "society_" }) then
            return Config.Translation.ACCOUNT_FUNDS_NOT_ENOUGH
        end

        exports[Config.ExportNames.s1nLib]:addMoneyToSocietyAccount(accountData.name, data.amount, { removePatternInName = "society_" })

        local transactionID = Functions:CreateNewTransaction(accountData, 'credit', Config.Translation.LABEL_SHARED_ACCOUNT_CREDIT, data.amount)
        if not transactionID then
            Utils:Debug("Error creating transaction, no ID returned")
            return Config.Translation.NOTIFICATION_ERROR_SOMETHING_WENT_WRONG
        end

        creditData.id = transactionID

        table.insert(accountData.credit, creditData)
        SQL.Execute('UPDATE `s1n_bank_accounts` SET credit = ? WHERE `iban` = ?', { json.encode(accountData.credit), accountData.iban })

        Functions:CreateNewTransaction(accountData, 'withdraw', Config.Translation.LABEL_SHARED_ACCOUNT_WITHDRAW, securityDeposit)

        Functions:RequestAccountUpdate(playerSource, data)

        API:SendDiscordLog(Config.Translation.AMOUNT_CREDITED_ACCOUNT_WEBHOOK:format(data.amount, GetPlayerName(playerSource)))
    elseif data.type == 'sharedaccount' then
        if accountData.balance < securityDeposit then
            return
        end

        accountData.balance = accountData.balance - securityDeposit
        accountData.balance = accountData.balance + data.amount

        local transactionID = Functions:CreateNewTransaction(accountData, 'credit', Config.Translation.LABEL_SHARED_ACCOUNT_CREDIT, data.amount)
        if not transactionID then
            Utils:Debug("Error creating transaction, no ID returned")
            return Config.Translation.NOTIFICATION_ERROR_SOMETHING_WENT_WRONG
        end

        creditData.id = transactionID

        table.insert(accountData.credit, creditData)
        SQL.Execute('UPDATE `s1n_bank_accounts` SET credit = ?, balance = ? WHERE `iban` = ?', { json.encode(accountData.credit), accountData.balance, accountData.iban })

        Functions:CreateNewTransaction(accountData, 'withdraw', Config.Translation.LABEL_SHARED_ACCOUNT_WITHDRAW, securityDeposit)

        Functions:RequestAccountUpdate(playerSource, data)

        API:SendDiscordLog(Config.Translation.AMOUNT_CREDITED_ACCOUNT_WEBHOOK:format(data.amount, GetPlayerName(playerSource)))
    end

end
exports[Config.ExportNames.s1nLib]:registerServerCallback("signContract", function(source, callback, data)
    callback(Functions:SignContract(source, data))
end)

-- Create an account for a player
-- @param playerSource The player source
-- @param data The data to create the account
function Functions:CreateAccount(playerSource, data)
    Utils:Debug(("Creating account with data: %s"):format(json.encode(data)))

    local frameworkPlayerJob = exports[Config.ExportNames.s1nLib]:getPlayerJob(playerSource)
    if not frameworkPlayerJob then return end

    if (data.type == 'useraccount' or data.type == 'sharedaccount') and Functions:HasUserAccount(playerSource, data.type) then
        return false
    elseif data.type == 'societyaccount' then
        if not Functions:CanCreateSocietyAccount(playerSource) then
            return false, Config.Translation.NO_ROLE_ACCESS_SOCIETY_ACCOUNT
        end

        if self:DoesSocietyAccountExist(frameworkPlayerJob.name) then
            return false, Config.Translation.SOCIETY_ACCOUNT_ALREADY_EXISTS
        end

        exports[Config.ExportNames.s1nLib]:createSocietyAccount({ societyName = frameworkPlayerJob.name }, { removePatternInName = "society_" })
    end

    local iban = Functions:CreateIban()

    local frameworkPlayer = exports[Config.ExportNames.s1nLib]:getPlayerObject(playerSource)
    if not frameworkPlayer then return end

    local frameworkPlayerIdentifier = exports[Config.ExportNames.s1nLib]:getPlayerIdentifier(playerSource)
    if not frameworkPlayerIdentifier then return end

    local accountMembers = {}

    if data.type == 'useraccount' then
        Utils:Debug("Creating user account")
        data.name = ('useraccount-%s'):format(frameworkPlayerIdentifier)
    elseif data.type == 'societyaccount' then
        Utils:Debug("Creating society account")
        data.name = ('society_%s'):format(frameworkPlayerJob.name)
    elseif data.type == 'sharedaccount' then
        Utils:Debug("Creating shared account")
    end

    SQL.Execute('INSERT INTO `s1n_bank_accounts` (owner, iban, name, type, balance, members, credit) VALUES (?, ?, ?, ?, ?, ?, ?)', { frameworkPlayerIdentifier, iban, data.name, data.type, 0, json.encode(accountMembers), '[]' })

    API:SendDiscordLog(Config.Translation.NEW_ACCOUNT_CREATED_WEBHOOK:format(GetPlayerName(playerSource)))

    if Config.CreditCardCheck and Config.CreditCardGive then
        Functions:GiveCreditCard(frameworkPlayer)
    end

    return true
end
exports[Config.ExportNames.s1nLib]:registerServerCallback("createAccount", function(playerSource, callback, data)
    callback(Functions:CreateAccount(playerSource, data))
end)

-- Request an account update for a player to refresh the NUI
-- @param source The player source
-- @param data The data to update the account
function Functions:RequestAccountUpdate(playerSource, data)
    Utils:Debug(("Requesting account update for %s"):format(GetPlayerName(playerSource)))

    local accountData = Functions:GetAccountData(playerSource, data)
    if not accountData then
        return Utils:Debug("Account data not found")
    end

    exports[Config.ExportNames.s1nLib]:triggerClientEvent("requestUpdate", playerSource, function()
        Utils:Debug(("Account update requested for %s"):format(GetPlayerName(playerSource)))
    end, accountData)
end

-- Get the account data for a player
-- @param playerSource The player source
-- @param data The data to get the account
-- @return table | (boolean, string (optional)) The account data or an error message
function Functions:GetAccountData(playerSource, data)
    Utils:Debug(("Getting account data for %s, type=%s"):format(GetPlayerName(playerSource), data.type))

    local frameworkPlayer = exports[Config.ExportNames.s1nLib]:getPlayerObject(playerSource)
    if not frameworkPlayer then return end

    local frameworkPlayerIdentifier = exports[Config.ExportNames.s1nLib]:getPlayerIdentifier(playerSource)
    if not frameworkPlayerIdentifier then return end

    local frameworkPlayerJob = exports[Config.ExportNames.s1nLib]:getPlayerJob(playerSource)
    if not frameworkPlayerJob then return end

    if data.type == 'societyaccount' and not Config.SocietyRanks[string.lower(frameworkPlayerJob.name)] then return false, Config.Translation.NOT_IN_SOCIETY end
    if data.type == 'societyaccount' and not Functions:CanLoginToSocietyAccount(playerSource) then return false, Config.Translation.NO_ROLE_ACCESS_SOCIETY_ACCOUNT end

    local accountData

    if data.type == 'societyaccount' then
        accountData = SQL.Execute('SELECT * FROM `s1n_bank_accounts` WHERE name = ? AND type = ?', { ('society_%s'):format(frameworkPlayerJob.name), data.type })[1]

        if not accountData then
            return false, Config.Translation.NOTIFICATION_ERROR_NO_SOCIETY_ACCOUNT_REGISTERED
        end
    elseif data.type == "useraccount" then
        accountData = SQL.Execute('SELECT * FROM `s1n_bank_accounts` WHERE owner = ? AND type = ?', { frameworkPlayerIdentifier, data.type })[1]

        if not accountData then
            return false, Config.Translation.NOTIFICATION_ERROR_NO_BANK_ACCOUNT
        end
    end

    if data.type == 'sharedaccount' then
        accountData = SQL.Execute('SELECT * FROM `s1n_bank_accounts` WHERE owner = ? AND type = ?', { frameworkPlayerIdentifier, data.type })[1]

        if not accountData then
            accountData = Functions:GetSharedAccountByMember(frameworkPlayerIdentifier)
        end

        if not accountData then
            return false, Config.Translation.NOT_IN_SHARED_ACCOUNT
        end
    end

    accountData.history = Functions:GenerateHistory(Functions:GetAccountHistory(accountData.iban), json.decode(accountData.credit))
    accountData.chart = Functions:GenerateAccountChart(accountData.history)
    accountData.members = json.decode(accountData.members)
    accountData.credit = json.decode(accountData.credit)

    if accountData.type == 'useraccount' then
        accountData.balance = exports[Config.ExportNames.s1nLib]:getPlayerBankMoney(playerSource)
    elseif accountData.type == 'societyaccount' then
        accountData.balance = exports[Config.ExportNames.s1nLib]:getSocietyAccountBalance(accountData.name, { removePatternInName = "society_" })
    end

    return accountData, nil
end
exports[Config.ExportNames.s1nLib]:registerServerCallback("getAccountData", function(playerSource, callback, data)
    callback(Functions:GetAccountData(playerSource, data))
end)
exports("GetAccountData", function(playerSource, data)
    return Functions:GetAccountData(playerSource, data)
end)

-- Check if a user has an account of a specific type
-- @param playerSource The player source
-- @param table|boolean The account found or false if not found
function Functions:HasUserAccount(playerSource, accountType)
    Utils:Debug(("Checking if %s has a %s account"):format(GetPlayerName(playerSource), accountType))

    local frameworkPlayerIdentifier = exports[Config.ExportNames.s1nLib]:getPlayerIdentifier(playerSource)
    if not frameworkPlayerIdentifier then return false end

    local queryResult = SQL.Execute('SELECT `id` FROM `s1n_bank_accounts` WHERE owner = ? AND type = ?', { frameworkPlayerIdentifier, accountType })
    if not queryResult then return false end

    return queryResult[1]
end

-- Check if a society account with the same name exists
-- @param jobName The name of the job
-- @return boolean If the society account exists
function Functions:DoesSocietyAccountExist(jobName)
    Utils:Debug(("Checking if society account %s exists"):format(jobName))

    local queryResult = SQL.Execute('SELECT `id` FROM `s1n_bank_accounts` WHERE name = ? AND type = ?', { ('society_%s'):format(jobName), 'societyaccount' })

    if not queryResult then
        return false
    end

    return queryResult[1]
end

-- Generate the history of an account based on the transactions
-- @param history The history of the account
-- @return table The generated history
function Functions:GenerateAccountChart(history)
    Utils:Debug("Generating account chart")

    table.sort(history, function(a, b)
        return a.date < b.date
    end)

    local accountChart = {}

    for day = 1, 10 do
        accountChart[day - 1] = { deposit = 0, withdraw = 0 }
    end

    for _, transaction in ipairs(history) do
        for day = 1, 10 do
            if math.floor((transaction.date + Constants.SECONDS_IN_ONE_DAY * (day - 1)) / Constants.SECONDS_IN_ONE_DAY) == math.floor(os.time() / Constants.SECONDS_IN_ONE_DAY) then
                if transaction.action == 'deposit' then
                    accountChart[day - 1].deposit = accountChart[day - 1].deposit + transaction.amount
                elseif transaction.action == 'withdraw' then
                    accountChart[day - 1].withdraw = accountChart[day - 1].withdraw + transaction.amount
                end
            end
        end
    end

    return accountChart
end

-- Generate the  history of an account based on the credit
-- @param history The history of the account
-- @param credit The credit of the account
-- @return table The generated history
function Functions:GenerateHistory(history, credit)
    Utils:Debug("Generating history")

    for _, data in pairs(history) do
        if data.action == 'credit' then
            local creditData = Functions:GetCreditById(credit, data.id)

            if creditData then
                data.creditdate = creditData.date
                data.creditduration = creditData.duration
                data.creditamount = creditData.amount
                data.creditamountpaid = creditData.paid
            else
                Utils:Debug(("Credit with ID %s not found"):format(data.id))
            end
        end
    end

    return history
end

-- Get the account history for an iban
-- @param iban The iban to get the history
-- @return table The account history
function Functions:GetAccountHistory(iban)
    Utils:Debug(("Getting account history for %s"):format(iban))

    local history = { }
    local statements = SQL.Execute('SELECT * FROM s1n_bank_statements', { })

    for _, statement in pairs(statements) do
        if statement.iban == iban then
            history[#history + 1] = statement
        end
    end

    return history
end

-- Check if a player is in a shared account
-- @param playerSource The player source
-- @return boolean If the player is in a shared account
function Functions:IsPlayerInSharedAccount(playerSource)
    Utils:Debug(("Checking if %s is in a shared account"):format(GetPlayerName(playerSource)))

    local frameworkPlayerIdentifier = exports[Config.ExportNames.s1nLib]:getPlayerIdentifier(playerSource)
    if not frameworkPlayerIdentifier then return end

    local accountData = SQL.Execute("SELECT * FROM `s1n_bank_accounts` WHERE `type` = 'sharedaccount' AND  `owner` = ?", { frameworkPlayerIdentifier })[1]
    if accountData then return true end

    -- FIXME: Optimize to avoid getting all the accounts
    local accounts = SQL.Execute("SELECT * FROM `s1n_bank_accounts` WHERE `type` = 'sharedaccount'", { })

    for _, account in pairs(accounts) do
        local members = json.decode(account.members)

        if members then
            for _, member in pairs(members) do
                if member.identifier == frameworkPlayerIdentifier then
                    return true
                end
            end
        end
    end

    return false
end

-- Kick a player from a shared account
-- @param playerSource The player source
-- @param data The data to kick the player
-- @return boolean If the player was kicked
function Functions:KickPlayerFromSharedAccount(playerSource, data)
    if not data then return end
    if not data.member then return end

    Utils:Debug(("Kicking %s from %s's shared account"):format(data.member.name, GetPlayerName(playerSource)))

    local accountData = SQL.Execute('SELECT * FROM `s1n_bank_accounts` WHERE `iban` = ?', { data.iban })[1]
    local members = json.decode(accountData.members)
    local kickedMember

    for key, member in pairs(members) do
        if member.identifier == data.member.identifier then
            kickedMember = member
            table.remove(members, key)

            break
        end
    end

    if not kickedMember then return false end

    SQL.Execute('UPDATE `s1n_bank_accounts` SET `members` = ? WHERE `iban` = ?', { json.encode(members), accountData.iban })

    Functions:RequestAccountUpdate(playerSource, data)
    API:SendDiscordLog(Config.Translation.KICKED_FROM_SHARED_ACCOUNT_WEBHOOK:format(GetPlayerName(playerSource), kickedMember.name))

    API:NotifyPlayer(playerSource, Config.Translation.NOTIFICATION_INFO_KICK_PLAYER_FROM_SHARED)

    -- Add a notification to the kicked player if he's online
    local targetPlayerSource = exports[Config.ExportNames.s1nLib]:getPlayerSourceFromIdentifier(kickedMember.identifier)

    if targetPlayerSource then
        API:NotifyPlayer(targetPlayerSource, Config.Translation.NOTIFICATION_INFO_BEEN_KICKED_FROM_SHARED)
    end

    return true
end

-- Save shared members for a shared account
-- @param playerSource The player source
-- @param ownerIdentifier The identifier of the owner of the shared account
-- @return boolean If the shared members were saved
function Functions:SaveSharedMembers(playerSource, ownerIdentifier)
    Utils:Debug(("Saving shared members for ownerIdentifier=%s"):format(ownerIdentifier))

    if Storage.PendingSharedInvites[ownerIdentifier] then
        local accountData = SQL.Execute('SELECT * FROM `s1n_bank_accounts` WHERE owner = ? AND type = ?', { ownerIdentifier, 'sharedaccount' })[1]
        if not accountData then return end

        local members = json.decode(accountData.members)

        for _, member in pairs(Storage.PendingSharedInvites[ownerIdentifier]) do
            table.insert(members, member)

            API:SendDiscordLog(Config.Translation.ADDED_TO_SHARED_ACCOUNT_WEBHOOK:format(GetPlayerName(playerSource), member.name))
        end

        SQL.Execute('UPDATE `s1n_bank_accounts` SET `members` = ? WHERE `iban` = ?', { json.encode(members), accountData.iban })

        Storage.PendingSharedInvites[ownerIdentifier] = nil

        return true
    end

    return false
end

-- Get the shared account where the player is a member
-- @param identifier The identifier of the player
-- @return table|boolean The shared account found or false if not found
function Functions:GetSharedAccountByMember(identifier)
    Utils:Debug(("Getting shared account by member with identifier=%s"):format(identifier))

    local rows = SQL.Execute('SELECT * FROM `s1n_bank_accounts` WHERE type = ?', { 'sharedaccount' })

    if not rows[1] then
        return Utils:Debug("Player isn't member of shared account")
    end

    for _, data in pairs(rows) do
        local members = json.decode(data.members)

        if members then
            for _, member in pairs(members) do
                if member.identifier == identifier then
                    Utils:Debug(("Found shared account with member, iban=%s"):format(data.iban))

                    return data
                end
            end
        end
    end

    return false
end

-- Check if a player can create a society account based on his job and grade
-- @param playerSource The player source
-- @return boolean If the player can create a society account
function Functions:CanCreateSocietyAccount(playerSource)
    Utils:Debug(("Checking if %s can create a society account"):format(GetPlayerName(playerSource)))

    local playerFrameworkJob = exports[Config.ExportNames.s1nLib]:getPlayerJob(playerSource, {
        lowercaseJobName      = true,
        lowercaseJobGradeName = true,
        mapData               = {
            name  = true,
            grade = {
                name = true
            }
        }
    })
    if not playerFrameworkJob then return end

    local jobName = playerFrameworkJob.name
    local jobGradeName = playerFrameworkJob.grade.name

    Utils:Debug(("JobName: %s, JobGradeName: %s"):format(jobName, jobGradeName))

    if Config.SocietyRanks[jobName] then
        if Config.SocietyRanks[jobName][jobGradeName] then
            return Config.SocietyRanks[jobName][jobGradeName].Create
        end
    end

    return false
end

-- Check if a player can login to a society account based on his job and grade
-- @param playerSource The player source
-- @return boolean If the player can login to a society account
function Functions:CanLoginToSocietyAccount(playerSource)
    Utils:Debug(("Checking if %s can login to society account"):format(GetPlayerName(playerSource)))

    local playerFrameworkJob = exports[Config.ExportNames.s1nLib]:getPlayerJob(playerSource, {
        lowercaseJobName      = true,
        lowercaseJobGradeName = true,
        mapData               = {
            name  = true,
            grade = {
                name = true
            }
        }
    })
    if not playerFrameworkJob then return end

    local jobName = playerFrameworkJob.name
    local jobGradeName = playerFrameworkJob.grade.name

    Utils:Debug(("JobName: %s, JobGradeName: %s"):format(jobName, jobGradeName))

    if Config.SocietyRanks[jobName] then
        if Config.SocietyRanks[jobName][jobGradeName] then
            return Config.SocietyRanks[jobName][jobGradeName].Login
        end
    end

    return false
end

-- Close or leave a shared account depending on if the player is the owner or a member of the shared account
-- @param playerSource The player source
function Functions:CloseLeaveSharedAccount(playerSource)
    Utils:Debug(("Closing/leaving shared account for %s"):format(GetPlayerName(playerSource)))

    local frameworkPlayerIdentifier = exports[Config.ExportNames.s1nLib]:getPlayerIdentifier(playerSource)
    if not frameworkPlayerIdentifier then return end

    local account = SQL.Execute("SELECT * FROM `s1n_bank_accounts` WHERE `owner` = ? AND `type` = 'sharedaccount'", { frameworkPlayerIdentifier })[1]

    if account then
        SQL.Execute("DELETE FROM `s1n_bank_accounts` WHERE `owner` = ? AND `type` = 'sharedaccount'", { frameworkPlayerIdentifier })

        Utils:Debug("Account deleted because he's the owner")
    else
        local sharedAccount = Functions:GetSharedAccountByMember(frameworkPlayerIdentifier)

        if sharedAccount then
            local members = json.decode(sharedAccount.members)

            for key, member in pairs(members) do
                if member.identifier == frameworkPlayerIdentifier then
                    Utils:Debug(("Removing member identifier=%s from shared account with iban=%s"):format(member.identifier, sharedAccount.iban))

                    table.remove(members, key)

                    break
                end
            end

            SQL.Execute('UPDATE `s1n_bank_accounts` SET `members` = ? WHERE `iban` = ?', { json.encode(members), sharedAccount.iban })
        end
    end
end

-- Change the iban of an account
-- @param playerSource The player source
-- @param data The data to change the iban
-- @return boolean If the iban was changed
function Functions:ChangeIban(playerSource, data)
    if not data then return end
    if not data.iban then return end

    local targetAccount = Functions:GetAccountFromIban(data.iban)

    if targetAccount then
        Utils:Debug("IBAN already exists")

        return false
    end

    if not exports[Config.ExportNames.s1nLib]:removePlayerCash(playerSource, Config.ChangeIban.Price) then
        return false, Config.Translation.NOT_ENOUGH_MONEY_ACTION
    end

    Utils:Debug(("Changing IBAN for %s to %s"):format(GetPlayerName(playerSource), data.iban))

    local accountData = Functions:GetAccountData(playerSource, data)

    SQL.Execute('UPDATE `s1n_bank_accounts` SET `iban` = ? WHERE `iban` = ?', { data.iban, accountData.iban })
    SQL.Execute('UPDATE `s1n_bank_statements` SET `iban` = ? WHERE `iban` = ?', { data.iban, accountData.iban })

    Functions:RequestAccountUpdate(playerSource, data)

    API:NotifyPlayer(playerSource, Config.Translation.NOTIFICATION_INFO_IBAN_CHANGED:format(data.iban))

    return true
end
exports[Config.ExportNames.s1nLib]:registerServerCallback("changeIban", function(playerSource, callback, data)
    callback(Functions:ChangeIban(playerSource, data))
end)

-- Deposit money to an account
-- @param playerSource The player source
-- @param data The data received from the NUI
-- @return string The error message if any
function Functions:DepositMoney(playerSource, data)
    Utils:Debug(("Depositing money for %s"):format(GetPlayerName(playerSource)))

    local accountData = Functions:GetAccountData(playerSource, data)

    if not exports[Config.ExportNames.s1nLib]:removePlayerCash(playerSource, data.amount) then
        return false, Config.Translation.NOT_ENOUGH_MONEY_ACTION
    end

    if accountData.type == 'useraccount' then
        if not exports[Config.ExportNames.s1nLib]:addPlayerMoneyToBankAccount(playerSource, data.amount) then
            return false
        end

        Functions:CreateNewTransaction(accountData, 'deposit', Config.Translation.LABEL_PERSONAL_ACCOUNT_DEPOSIT, data.amount)
        Functions:RequestAccountUpdate(playerSource, data)

        API:SendDiscordLog(Config.Translation.USER_DEPOSITED_ACCOUNT_WEBHOOK:format(GetPlayerName(playerSource), data.amount))
    elseif accountData.type == 'sharedaccount' then
        accountData.balance = accountData.balance + data.amount
        SQL.Execute('UPDATE `s1n_bank_accounts` SET balance = ? WHERE `iban` = ?', { accountData.balance, accountData.iban })

        Functions:CreateNewTransaction(accountData, 'deposit', Config.Translation.LABEL_SHARED_ACCOUNT_DEPOSIT, data.amount)
        Functions:RequestAccountUpdate(playerSource, data)

        API:SendDiscordLog(Config.Translation.USER_DEPOSITED_ACCOUNT_WEBHOOK:format(GetPlayerName(playerSource), data.amount))
    elseif accountData.type == 'societyaccount' then
        exports[Config.ExportNames.s1nLib]:addMoneyToSocietyAccount(accountData.name, data.amount, { removePatternInName = "society_" })

        Functions:CreateNewTransaction(accountData, 'deposit', Config.Translation.LABEL_SOCIETY_ACCOUNT_DEPOSIT, data.amount)
        Functions:RequestAccountUpdate(playerSource, data)

        API:SendDiscordLog(Config.Translation.USER_DEPOSITED_ACCOUNT_WEBHOOK:format(GetPlayerName(playerSource), data.amount))
    end

    return true
end
-- If they use QBCore and want to replace qb-banking export
if exports[Config.ExportNames.s1nLib]:getCurrentFrameworkName() == "qbcore" then
    exports("AddMoneyToSociety", function(societyName, amount, reason)
        Utils:Debug(("export AddMoneyToSociety called with societyName=%s, amount=%s, reason=%s"):format(societyName, amount, reason))
        local companyName = societyName

        -- Add society_ prefix to the society name if it doesn't have it
        if not string.find(societyName, "society_") then
            societyName = ("society_%s"):format(societyName)
        end

        local societyAccount = Functions:GetSocietyAccountByName(societyName)
        if not societyAccount then return end

        exports[Config.ExportNames.s1nLib]:addMoneyToSocietyAccount(companyName, amount, { removePatternInName = "society_" })
        Functions:CreateNewTransaction(societyAccount, "deposit", reason, amount)

        return true
    end)
end

-- Withdraw money from an account
-- @param playerSource The player source
-- @param data The data received from the NUI
-- @return string The error message if any
function Functions:WithdrawMoney(playerSource, data)
    Utils:Debug(("Withdrawing money for %s"):format(GetPlayerName(playerSource)))

    local accountData = Functions:GetAccountData(playerSource, data)

    if accountData.type == 'useraccount' then
        if not exports[Config.ExportNames.s1nLib]:removePlayerMoneyFromBankAccount(playerSource, data.amount) then
            return false, Config.Translation.ACCOUNT_NOT_ENOUGH_MONEY
        end

        if not exports[Config.ExportNames.s1nLib]:addPlayerCash(playerSource, data.amount) then
            return false
        end

        Functions:CreateNewTransaction(accountData, 'withdraw', Config.Translation.LABEL_PERSONAL_ACCOUNT_WITHDRAW, data.amount)
        Functions:RequestAccountUpdate(playerSource, data)

        API:SendDiscordLog(Config.Translation.USER_WITHDRAWN_ACCOUNT_WEBHOOK:format(GetPlayerName(playerSource), data.amount))

    elseif accountData.type == 'sharedaccount' then
        if accountData.balance < data.amount then
            return false, Config.Translation.ACCOUNT_NOT_ENOUGH_MONEY
        end

        accountData.balance = accountData.balance - data.amount

        if not exports[Config.ExportNames.s1nLib]:addPlayerCash(playerSource, data.amount) then
            return false
        end

        SQL.Execute('UPDATE `s1n_bank_accounts` SET balance = ? WHERE `iban` = ?', { accountData.balance, accountData.iban })

        Functions:CreateNewTransaction(accountData, 'withdraw', Config.Translation.LABEL_SHARED_ACCOUNT_WITHDRAW, data.amount)
        Functions:RequestAccountUpdate(playerSource, data)

        API:SendDiscordLog(Config.Translation.USER_WITHDRAWN_ACCOUNT_WEBHOOK:format(GetPlayerName(playerSource), data.amount))
    elseif accountData.type == 'societyaccount' then
        if not exports[Config.ExportNames.s1nLib]:removeMoneyFromSocietyAccount(accountData.name, data.amount, { removePatternInName = "society_" }) then
            return false, Config.Translation.ACCOUNT_NOT_ENOUGH_MONEY
        end

        if not exports[Config.ExportNames.s1nLib]:addPlayerCash(playerSource, data.amount) then
            return false
        end

        Functions:CreateNewTransaction(accountData, 'withdraw', Config.Translation.LABEL_SOCIETY_ACCOUNT_WITHDRAW, data.amount)
        Functions:RequestAccountUpdate(playerSource, data)

        API:SendDiscordLog(Config.Translation.USER_WITHDRAWN_ACCOUNT_WEBHOOK:format(GetPlayerName(playerSource), data.amount))
    end

    return true
end
-- If they use QBCore and want to replace qb-banking export
if exports[Config.ExportNames.s1nLib]:getCurrentFrameworkName() == "qbcore" then
    exports("RemoveMoneyFromSociety", function(societyName, amount, reason)
        Utils:Debug(("export RemoveMoneyFromSociety called with societyName=%s, amount=%s, reason=%s"):format(societyName, amount, reason))

        local companyName = societyName

        -- Add society_ prefix to the society name if it doesn't have it
        if not string.find(societyName, "society_") then
            societyName = ("society_%s"):format(societyName)
        end

        local societyAccount = Functions:GetSocietyAccountByName(societyName)
        if not societyAccount then return end

        exports[Config.ExportNames.s1nLib]:removeMoneyFromSocietyAccount(companyName, amount, { removePatternInName = "society_" })
        Functions:CreateNewTransaction(societyAccount, "withdraw", reason, amount)

        return true
    end)
end

-- Transfer money from an account to another
-- @param playerSource The player source
-- @param data The data received from the NUI
-- @return (boolean, string) If the transfer was successful and the error message if any
function Functions:TransferMoney(playerSource, data)
    -- TODO: Still needs big refactoring
    Utils:Debug("TransferMoney: called")

    local accountTarget = Functions:GetAccountFromIban(data.id)
    if not accountTarget then
        Utils:Debug("Account doesn't exist")
        return false, Config.Translation.NOTIFICATION_ERROR_ACCOUNT_DOESNT_EXIST
    end

    local frameworkPlayerJob = exports[Config.ExportNames.s1nLib]:getPlayerJob(playerSource, {
        mapData = {
            name = true,
        }
    })
    if not frameworkPlayerJob then return end

    local accountData = Functions:GetAccountData(playerSource, data)
    if not accountData then return end

    if accountData.iban == accountTarget.iban then
        return false, Config.Translation.NOTIFICATION_ERROR_TRANSFER_SAME_ACCOUNT
    end

    if accountTarget.type == 'useraccount' then
        local owner = exports[Config.ExportNames.s1nLib]:getPlayerObjectFromIdentifier(accountTarget.owner)
        local ownerSource = exports[Config.ExportNames.s1nLib]:getPlayerSourceFromIdentifier(accountTarget.owner)

        if not owner then
            Utils:Debug("Target account owner not connected, using database")

            if accountData.type == 'useraccount' then
                if not exports[Config.ExportNames.s1nLib]:removePlayerMoneyFromBankAccount(playerSource, data.amount) then
                    return false, Config.Translation.NOT_ENOUGH_MONEY_ACTION
                end

                if exports[Config.ExportNames.s1nLib]:getCurrentFrameworkName() == "esx" then
                    local user = SQL.Execute('SELECT * FROM users WHERE identifier = ?', { accountTarget.owner })[1]
                    if not user then
                        return false, Config.Translation.NOTIFICATION_ERROR_PROCESSING_REQUEST
                    end

                    user.accounts = json.decode(user.accounts)
                    user.accounts.bank = user.accounts.bank + data.amount

                    SQL.Execute('UPDATE users SET accounts = ? WHERE identifier = ?', { json.encode(user.accounts), accountTarget.owner })
                elseif exports[Config.ExportNames.s1nLib]:getCurrentFrameworkName() == "qbcore" then
                    Utils:Debug("Getting user from database")

                    local user = SQL.Execute('SELECT * FROM players WHERE citizenid = ?', { accountTarget.owner })[1]
                    if not user then
                        return false, Config.Translation.NOTIFICATION_ERROR_PROCESSING_REQUEST
                    end

                    user.money = json.decode(user.money)
                    user.money.bank = user.money.bank + data.amount

                    SQL.Execute('UPDATE players SET money = ? WHERE citizenid = ?', { json.encode(user.money), accountTarget.owner })

                    Utils:Debug("User updated with new balance")
                end

                Functions:CreateNewTransaction(accountData, 'transfer:withdraw', Config.Translation.LABEL_PERSONAL_ACCOUNT_TRANSFER, data.amount)
                Functions:CreateNewTransaction(accountTarget, 'transfer:deposit', Config.Translation.LABEL_PERSONAL_ACCOUNT_TRANSFER, data.amount)
                Functions:RequestAccountUpdate(playerSource, data)

                API:SendDiscordLog(Config.Translation.USER_TRANSFERRED_ACCOUNT_WEBHOOK:format(GetPlayerName(playerSource), data.amount, accountTarget.iban))
            elseif accountData.type == 'sharedaccount' then
                if accountData.balance >= data.amount then
                    if exports[Config.ExportNames.s1nLib]:getCurrentFrameworkName() == "esx" then
                        local user = SQL.Execute('SELECT * FROM users WHERE identifier = ?', { accountTarget.owner })[1]
                        if not user then
                            return false, Config.Translation.NOTIFICATION_ERROR_PROCESSING_REQUEST
                        end

                        user.accounts = json.decode(user.accounts)
                        user.accounts.bank = user.accounts.bank + data.amount

                        SQL.Execute('UPDATE users SET accounts = ? WHERE identifier = ?', { json.encode(user.accounts), accountTarget.owner })
                    elseif exports[Config.ExportNames.s1nLib]:getCurrentFrameworkName() == "qbcore" then
                        local user = SQL.Execute('SELECT * FROM players WHERE citizenid = ?', { accountTarget.owner })[1]
                        if not user then
                            return false, Config.Translation.NOTIFICATION_ERROR_PROCESSING_REQUEST
                        end

                        user.money = json.decode(user.money)
                        user.money.bank = user.money.bank + data.amount

                        SQL.Execute('UPDATE players SET money = ? WHERE citizenid = ?', { json.encode(user.money), accountTarget.owner })
                    end
                    accountData.balance = accountData.balance - data.amount
                    SQL.Execute('UPDATE `s1n_bank_accounts` SET balance = ? WHERE `iban` = ?', { accountData.balance, accountData.iban })

                    Functions:CreateNewTransaction(accountData, 'transfer:withdraw', Config.Translation.LABEL_SHARED_ACCOUNT_TRANSFER, data.amount)
                    Functions:CreateNewTransaction(accountTarget, 'transfer:deposit', Config.Translation.LABEL_PERSONAL_ACCOUNT_TRANSFER, data.amount)
                    Functions:RequestAccountUpdate(playerSource, data)

                    API:SendDiscordLog(Config.Translation.USER_TRANSFERRED_ACCOUNT_WEBHOOK:format(GetPlayerName(playerSource), data.amount, accountTarget.iban))
                else
                    return false, Config.Translation.ACCOUNT_NOT_ENOUGH_MONEY
                end
            elseif accountData.type == 'societyaccount' then
                if not exports[Config.ExportNames.s1nLib]:removeMoneyFromSocietyAccount(accountData.name, data.amount, { removePatternInName = "society_" }) then
                    return false, Config.Translation.ACCOUNT_NOT_ENOUGH_MONEY
                end

                -- TODO: Implement the addMoneyToSocietyAccount offline in s1nLib
                if exports[Config.ExportNames.s1nLib]:getCurrentFrameworkName() == "esx" then
                    local user = SQL.Execute('SELECT * FROM users WHERE identifier = ?', { accountTarget.owner })[1]
                    if not user then
                        return false, Config.Translation.NOTIFICATION_ERROR_PROCESSING_REQUEST
                    end

                    user.accounts = json.decode(user.accounts)
                    user.accounts.bank = user.accounts.bank + data.amount

                    SQL.Execute('UPDATE users SET accounts = ? WHERE identifier = ?', { json.encode(user.accounts), accountTarget.owner })
                elseif exports[Config.ExportNames.s1nLib]:getCurrentFrameworkName() == "qbcore" then
                    local user = SQL.Execute('SELECT * FROM players WHERE citizenid = ?', { accountTarget.owner })[1]
                    if not user then return false, Config.Translation.NOTIFICATION_ERROR_PROCESSING_REQUEST end

                    user.money = json.decode(user.money)
                    user.money.bank = user.money.bank + data.amount

                    SQL.Execute('UPDATE players SET money = ? WHERE citizenid = ?', { json.encode(user.money), accountTarget.owner })
                end

                Functions:CreateNewTransaction(accountData, 'transfer:withdraw', Config.Translation.LABEL_SOCIETY_ACCOUNT_TRANSFER, data.amount)
                Functions:CreateNewTransaction(accountTarget, 'transfer:deposit', Config.Translation.LABEL_PERSONAL_ACCOUNT_TRANSFER, data.amount)
                Functions:RequestAccountUpdate(playerSource, data)

                API:SendDiscordLog(Config.Translation.USER_TRANSFERRED_ACCOUNT_WEBHOOK:format(GetPlayerName(playerSource), data.amount, accountTarget.iban))
            end
        else
            Utils:Debug("Target account owner connected")

            if accountData.type == 'useraccount' then
                if not exports[Config.ExportNames.s1nLib]:removePlayerMoneyFromBankAccount(playerSource, data.amount) then
                    return false, Config.Translation.NOT_ENOUGH_MONEY_ACTION
                end

                if not exports[Config.ExportNames.s1nLib]:addPlayerMoneyToBankAccount(ownerSource, data.amount) then

                    return false
                end

                Functions:CreateNewTransaction(accountData, 'transfer:withdraw', Config.Translation.LABEL_PERSONAL_ACCOUNT_TRANSFER, data.amount)
                Functions:CreateNewTransaction(accountTarget, 'transfer:deposit', Config.Translation.LABEL_PERSONAL_ACCOUNT_TRANSFER, data.amount)
                Functions:RequestAccountUpdate(playerSource, data)

                API:SendDiscordLog(Config.Translation.USER_TRANSFERRED_ACCOUNT_WEBHOOK:format(GetPlayerName(playerSource), data.amount, accountTarget.iban))
            elseif accountData.type == 'sharedaccount' then
                if accountData.balance < data.amount then
                    return false, Config.Translation.ACCOUNT_NOT_ENOUGH_MONEY
                end

                accountData.balance = accountData.balance - data.amount
                if not exports[Config.ExportNames.s1nLib]:addPlayerMoneyToBankAccount(ownerSource, data.amount) then
                    return false
                end
                SQL.Execute('UPDATE `s1n_bank_accounts` SET balance = ? WHERE `iban` = ?', { accountData.balance, accountData.iban })

                Functions:CreateNewTransaction(accountData, 'transfer:withdraw', Config.Translation.LABEL_SHARED_ACCOUNT_TRANSFER, data.amount)
                Functions:CreateNewTransaction(accountTarget, 'transfer:deposit', Config.Translation.LABEL_PERSONAL_ACCOUNT_TRANSFER, data.amount)
                Functions:RequestAccountUpdate(playerSource, data)

                API:SendDiscordLog(Config.Translation.USER_TRANSFERRED_ACCOUNT_WEBHOOK:format(GetPlayerName(playerSource), data.amount, accountTarget.iban))
            elseif accountData.type == 'societyaccount' then
                if not exports[Config.ExportNames.s1nLib]:removeMoneyFromSocietyAccount(accountData.name, data.amount, { removePatternInName = "society_" }) then
                    return false, Config.Translation.ACCOUNT_NOT_ENOUGH_MONEY
                end

                exports[Config.ExportNames.s1nLib]:addPlayerMoneyToBankAccount(ownerSource, data.amount)

                Functions:CreateNewTransaction(accountData, 'transfer:withdraw', Config.Translation.LABEL_SOCIETY_ACCOUNT_TRANSFER, data.amount)
                Functions:CreateNewTransaction(accountTarget, 'transfer:deposit', Config.Translation.LABEL_PERSONAL_ACCOUNT_TRANSFER, data.amount)
                Functions:RequestAccountUpdate(playerSource, data)

                API:SendDiscordLog(Config.Translation.USER_TRANSFERRED_ACCOUNT_WEBHOOK:format(GetPlayerName(playerSource), data.amount, accountTarget.iban))
            end
        end
    elseif accountTarget.type == 'sharedaccount' then
        if accountData.type == 'useraccount' then
            if not exports[Config.ExportNames.s1nLib]:removePlayerMoneyFromBankAccount(playerSource, data.amount) then
                return false, Config.Translation.NOT_ENOUGH_MONEY_ACTION
            end

            accountTarget.balance = accountTarget.balance + data.amount
            SQL.Execute('UPDATE `s1n_bank_accounts` SET balance = ? WHERE `iban` = ?', { accountTarget.balance, accountTarget.iban })

            Functions:CreateNewTransaction(accountData, 'transfer:withdraw', Config.Translation.LABEL_PERSONAL_ACCOUNT_TRANSFER, data.amount)
            Functions:CreateNewTransaction(accountTarget, 'transfer:deposit', Config.Translation.LABEL_PERSONAL_ACCOUNT_TRANSFER, data.amount)
            Functions:RequestAccountUpdate(playerSource, data)

            API:SendDiscordLog(Config.Translation.USER_TRANSFERRED_ACCOUNT_WEBHOOK:format(GetPlayerName(playerSource), data.amount, accountTarget.iban))
        elseif accountData.type == 'sharedaccount' then
            if accountData.balance < data.amount then
                return false, Config.Translation.ACCOUNT_NOT_ENOUGH_MONEY
            end

            accountData.balance = accountData.balance - data.amount
            SQL.Execute('UPDATE `s1n_bank_accounts` SET balance = ? WHERE `iban` = ?', { accountData.balance, accountData.iban })
            accountTarget.balance = accountTarget.balance + data.amount
            SQL.Execute('UPDATE `s1n_bank_accounts` SET balance = ? WHERE `iban` = ?', { accountTarget.balance, accountTarget.iban })

            Functions:CreateNewTransaction(accountData, 'transfer:withdraw', Config.Translation.LABEL_SHARED_ACCOUNT_TRANSFER, data.amount)
            Functions:CreateNewTransaction(accountTarget, 'transfer:deposit', Config.Translation.LABEL_PERSONAL_ACCOUNT_TRANSFER, data.amount)
            Functions:RequestAccountUpdate(playerSource, data)

            API:SendDiscordLog(Config.Translation.USER_TRANSFERRED_ACCOUNT_WEBHOOK:format(GetPlayerName(playerSource), data.amount, accountTarget.iban))
        elseif accountData.type == 'societyaccount' then
            if not exports[Config.ExportNames.s1nLib]:removeMoneyFromSocietyAccount(accountData.name, data.amount, { removePatternInName = "society_" }) then
                return false, Config.Translation.ACCOUNT_NOT_ENOUGH_MONEY
            end

            accountTarget.balance = accountTarget.balance + data.amount
            SQL.Execute('UPDATE `s1n_bank_accounts` SET balance = ? WHERE `iban` = ?', { accountTarget.balance, accountTarget.iban })

            Functions:CreateNewTransaction(accountData, 'transfer:withdraw', Config.Translation.LABEL_SOCIETY_ACCOUNT_TRANSFER, data.amount)
            Functions:CreateNewTransaction(accountTarget, 'transfer:deposit', Config.Translation.LABEL_PERSONAL_ACCOUNT_TRANSFER, data.amount)
            Functions:RequestAccountUpdate(playerSource, data)

            API:SendDiscordLog(Config.Translation.USER_TRANSFERRED_ACCOUNT_WEBHOOK:format(GetPlayerName(playerSource), data.amount, accountTarget.iban))
        end
    elseif accountTarget.type == 'societyaccount' then
        if accountData.type == 'useraccount' then
            if not exports[Config.ExportNames.s1nLib]:removePlayerMoneyFromBankAccount(playerSource, data.amount) then
                return false, Config.Translation.NOT_ENOUGH_MONEY_ACTION
            end

            exports[Config.ExportNames.s1nLib]:addMoneyToSocietyAccount(accountTarget.name, data.amount, { removePatternInName = "society_" })

            Functions:CreateNewTransaction(accountData, 'transfer:withdraw', Config.Translation.LABEL_PERSONAL_ACCOUNT_TRANSFER, data.amount)
            Functions:CreateNewTransaction(accountTarget, 'transfer:deposit', Config.Translation.LABEL_PERSONAL_ACCOUNT_TRANSFER, data.amount)
            Functions:RequestAccountUpdate(playerSource, data)

            API:SendDiscordLog(Config.Translation.USER_TRANSFERRED_ACCOUNT_WEBHOOK:format(GetPlayerName(playerSource), data.amount, accountTarget.iban))
        elseif accountData.type == 'sharedaccount' then
            if accountData.balance < data.amount then
                return false, Config.Translation.ACCOUNT_NOT_ENOUGH_MONEY
            end

            accountData.balance = accountData.balance - data.amount

            exports[Config.ExportNames.s1nLib]:addMoneyToSocietyAccount(accountTarget.name, data.amount, { removePatternInName = "society_" })
            SQL.Execute('UPDATE `s1n_bank_accounts` SET balance = ? WHERE `iban` = ?', { accountData.balance, accountData.iban })

            Functions:CreateNewTransaction(accountData, 'transfer:withdraw', Config.Translation.LABEL_SHARED_ACCOUNT_TRANSFER, data.amount)
            Functions:CreateNewTransaction(accountTarget, 'transfer:deposit', Config.Translation.LABEL_PERSONAL_ACCOUNT_TRANSFER, data.amount)
            Functions:RequestAccountUpdate(playerSource, data)

            API:SendDiscordLog(Config.Translation.USER_TRANSFERRED_ACCOUNT_WEBHOOK:format(GetPlayerName(playerSource), data.amount, accountTarget.iban))
        elseif accountData.type == 'societyaccount' then
            if not exports[Config.ExportNames.s1nLib]:removeMoneyFromSocietyAccount(accountData.name, data.amount, { removePatternInName = "society_" }) then
                return false, Config.Translation.ACCOUNT_NOT_ENOUGH_MONEY
            end

            exports[Config.ExportNames.s1nLib]:addMoneyToSocietyAccount(accountTarget.name, data.amount)

            Functions:CreateNewTransaction(accountData, 'transfer:withdraw', Config.Translation.LABEL_SOCIETY_ACCOUNT_TRANSFER, data.amount)
            Functions:CreateNewTransaction(accountTarget, 'transfer:deposit', Config.Translation.LABEL_PERSONAL_ACCOUNT_TRANSFER, data.amount)
            Functions:RequestAccountUpdate(playerSource, data)

            API:SendDiscordLog(Config.Translation.USER_TRANSFERRED_ACCOUNT_WEBHOOK:format(GetPlayerName(playerSource), data.amount, accountTarget.iban))
        end
    end

    return true
end

-- Create a new transaction
-- @param account The account object
-- @param action The action of the transaction
-- @param label The label of the transaction
-- @param amount The amount of the transaction
-- @return boolean If the transaction was created
function Functions:CreateNewTransaction(account, action, label, amount)
    if not Utils:CheckType(account, 'table') then return end
    if not Utils:CheckType(action, 'string') then return end
    if not Utils:CheckType(label, 'string') then return end
    if not Utils:CheckType(amount, 'number') then return end

    Utils:Debug(("Creating new transaction: action=%s, label=%s, amount=%s"):format(action, label, amount))

    local id = SQL.Execute('INSERT INTO s1n_bank_statements (iban, action, label, amount, date) VALUES (?, ?, ?, ?, ?)', { account.iban, action, label, amount, os.time() })

    return id
end
exports("CreateTransaction", function(account, action, label, amount)
    return Functions:CreateNewTransaction(account, action, label, amount)
end)

-- Handle an action (deposit, withdraw, transfer)
-- @param playerSource The player source
-- @param data The data received from the NUI
-- @return string The error message if any
function Functions:HandleAction(playerSource, data)
    -- TODO: CheckType
    Utils:Debug(("Player: %s, Action: %s, Amount: %s"):format(GetPlayerName(playerSource), data.action, data.amount))

    if data.amount > Config.MaxAmountPerTransaction then
        return false, Config.Translation.NOTIFICATION_ERROR_EXCEED_MAX_AMOUNT:format(Config.MaxAmountPerTransaction)
    end

    -- TODO: Checks values with s1nLib

    if data.amount <= 0 then
        return false, Config.Translation.NOTIFICATION_ERROR_AMOUNT
    end

    if data.action == 'deposit' then
        return self:DepositMoney(playerSource, data)
    elseif data.action == 'withdraw' then
        return self:WithdrawMoney(playerSource, data)
    elseif data.action == 'transfer' then
        return self:TransferMoney(playerSource, data)
    end
end
exports[Config.ExportNames.s1nLib]:registerServerCallback("accountAction", function(playerSource, callback, data)
    callback(Functions:HandleAction(playerSource, data))
end)


-- Give a credit card to a player
-- @param frameworkPlayer The player object
-- @return boolean If the credit card was given
function Functions:GiveCreditCard(frameworkPlayer)
    if not exports[Config.ExportNames.s1nLib]:addInventoryItem({
        playerSource = frameworkPlayer.source,
        itemName     = Config.CreditCardItem,
        amount       = 1
    }, {
        onlyIfNotAlreadyHave = true
    }) then
        Utils:Debug("Couldn't give credit card")

        return false
    end

    return true
end