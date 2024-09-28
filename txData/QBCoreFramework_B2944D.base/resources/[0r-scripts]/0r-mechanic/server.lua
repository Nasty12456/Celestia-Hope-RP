local vehData = {}
bossMenuData = {}
Citizen.CreateThread(function()
    MySQL.Async.fetchAll("SELECT * FROM 0r_mechanics",{}, function(result)
        for plate, data in pairs(result) do
            vehData[data.plate] = json.decode(data.data)
        end
    end)
    -- if Config.Framework == "esx" then
    --     local func = function()
    --         for mName,mData in pairs(Config.Locations) do
    --             if mData.job ~= "none" then
    --                 exports['esx_addonaccount']:AddSharedAccount(('society_%s'):format(mData.job), mName, 0)
    --                 TriggerEvent('esx_society:registerSociety', mData.job, mData.job, ('society_%s'):format(mData.job),('society_%s'):format(mData.job), ('society_%s'):format(mData.job), {type = 'private'})
    --             end
    --         end
    --     end
    --     pcall(func)
    -- end
    local func = function()
        local bossMenus = MySQL.Sync.fetchAll("SELECT * FROM 0r_bossmenu")
        for k, v in pairs(Config.Locations) do
            if v.Society.Enable and v.Society.Type == "default" then
                local found = false
                for _, bossMenu in pairs(bossMenus) do
                    bossMenu.index = tonumber(bossMenu.index)
                    if k == bossMenu.index then
                        bossMenuData[k] = {
                            money = bossMenu.money,
                            index = bossMenu.index,
                            --employees = json.decode(bossMenu.employees)
                        }
                        found = true
                        break
                    end
                end
                if not found then
                    bossMenuData[k] = {
                        money = Config.Locations[k].defaultPriceInBossMenu,
                        index = k,
                        --employees = {}
                    }
                    MySQL.Async.execute("INSERT INTO 0r_bossmenu (`index`, money) VALUES (@index, @money)", {
                        ["@index"] = k,
                        --["@employees"] = json.encode({}),
                        ["@money"] = Config.Locations[k].defaultPriceInBossMenu,
                    })
                end
            end
        end
    end
    pcall(func)
end)




addElement = function(section, data)
    if not vehData[data.plate] then
        vehData[data.plate] = {}
    end

    if section == "fitment" then
        vehData[data.plate][section] = data.fitment
    elseif data.mod == "Stock" then
        vehData[data.plate][section] = nil
    else
        vehData[data.plate][section] = data.mod
    end


    MySQL.Async.fetchAll("SELECT * FROM 0r_mechanics WHERE plate = @plate", {
        ["@plate"] = data.plate
    }, function(output)
        if #output > 0 then
            MySQL.Async.execute("UPDATE 0r_mechanics SET data = @data WHERE plate = @plate",{
                ["@plate"] = data.plate,
                ["@data"] = json.encode(vehData[data.plate]),
            })
        else
            MySQL.Async.execute("INSERT INTO 0r_mechanics (plate, data) VALUES (@plate, @data)",{
                ["@plate"] = data.plate,
                ["@data"] = json.encode(vehData[data.plate]),
            })
        end
    end)

    return TriggerClientEvent("0r-mechanic:client:updateVehData", -1, vehData)
end

-- RegisterServerEvent("0r-mechanic:server:hireEemployee", function(index, employee)
--     TriggerClientEvent("0r-mechanic:client:updateBossMenuData", -1, bossMenuData)
-- end)




RegisterServerEvent("0r-mechanic:server:syncFitment", function(vehicleId, fitmentData)
    TriggerClientEvent("0r-mechanic:client:syncFitment", -1, vehicleId, fitmentData)
end)

RegisterServerEvent("0r-mechanic:server:useNitro", function(vehicleId)
    TriggerClientEvent("0r-mechanic:client:useNitro", -1, vehicleId)
end)

RegisterServerEvent("0r-mechanic:server:addElement", addElement)

Citizen.CreateThread(function()
    while Framework == nil do
        Citizen.Wait(100)
    end
    if Config.Framework == "esx" then
        GetPlayersInJob = function(job)
            local players = Framework.GetPlayers()
            local playersInJob = {}
            for i = 1, #players do
                local xPlayer = Framework.GetPlayerFromId(players[i])
                if xPlayer.job.name == job then
                    table.insert(playersInJob, {
                        source = xPlayer.source,
                        name = xPlayer.getName(),
                    })
                end
            end
            return playersInJob
        end
        GetActivePlayers = function(job)
            local players = GetPlayers()
            local activePlayers = {}
            for i = 1, #players do
                players[i] = tonumber(players[i])
                local xPlayer = GetPlayer(players[i])
                if xPlayer and xPlayer.job.name ~= job then
                    table.insert(activePlayers, {
                        source = xPlayer.source,
                        name = xPlayer.getName(),
                    })
                end
            end
            return activePlayers
        end
        --deposit money
        Framework.RegisterServerCallback("0r-mechanic:moneyAction", function(source, cb, data)
            local mechanicIndex = data.index
            local mechanicData = Config.Locations[mechanicIndex]
            local xPlayer = GetPlayer(source)
            local type = data.type
            local xPlayer = GetPlayer(source)
            if xPlayer then
                local playerJob = xPlayer.job.name
                local playermoney = GetMoney(source, "cash")
                local mechanicIndex = nil
                for k,v in pairs(Config.Locations) do
                    if v.job == playerJob then
                        mechanicIndex = k
                        break
                    end
                end
                if type == "deposit" then
                    if playermoney >= amount then
                        RemoveMoney(source, amount, "cash")
                        if mechanicData.Society.Type == "default" then
                            bossMenuData[mechanicIndex].money += amount
                            MySQL.Async.execute("UPDATE 0r_bossmenu SET money = @money WHERE `index` = @index", {
                                ["@money"] = bossMenuData[mechanicIndex].money,
                                ["@index"] = mechanicIndex
                            })
                            cb({
                                pocket = GetMoney(source, "cash"),
                                money = bossMenuData[mechanicIndex].money
                            })
                        else
                            local money = mechanicData.Society.getSocietyMoney(mechanicData.job)
                            mechanicData.Society.addSocietyMoney(mechanicData.job, amount)
                            cb({
                                pocket = GetMoney(source, "cash"),
                                money = money + amount
                            })
                        end
                    else
                        cb(false)
                    end
                else
                    if mechanicData.Society.Type == "default" then
                        if bossMenuData[mechanicIndex].money >= amount then
                            AddMoney(source, amount)
                            bossMenuData[mechanicIndex].money -= amount
                            MySQL.Async.execute("UPDATE 0r_bossmenu SET money = @money WHERE `index` = @index", {
                                ["@money"] = bossMenuData[mechanicIndex].money,
                                ["@index"] = mechanicIndex
                            })
                            cb({
                                pocket = GetMoney(source, "cash"),
                                money = bossMenuData[mechanicIndex].money
                            })
                        else
                            cb(false)
                        end
                    else
                        local money = mechanicData.Society.getSocietyMoney(mechanicData.job)
                        if money >= amount then
                            AddMoney(source, amount)
                            mechanicData.Society.removeSocietyMoney(mechanicData.job, amount)
                            cb({
                                pocket = GetMoney(source, "cash"),
                                money = money - amount
                            })
                        else
                            cb(false)
                        end
                    end
                end
            end
        end)
        
        Framework.RegisterServerCallback("0r-mechanic:hireEmployee", function(source, cb, targetId)
            local xPlayer = GetPlayer(source)
            local target = GetPlayer(targetId)
            if not xPlayer or not target then
                return
            end
            local currentJob = xPlayer.getJob()
            cb(target.setJob(currentJob, 1) or false)
        end)

        --fire employee
        Framework.RegisterServerCallback("0r-mechanic:fireEmployee", function(source, cb, targetId)
            local xPlayer = GetPlayer(source)
            local target = GetPlayer(targetId)
            if not xPlayer or not target then
                return
            end
            cb(target.setJob("unemployed", 0) or false)
        end)
        Framework.RegisterServerCallback("0r-mechanic:getBossMenuData", function(source, cb, index)
            local data = Config.Locations[index]
            local moneyData = bossMenuData[index]
            if not data then return end
            if data.Society.Type == "custom" then
                moneyData = {money = data.Society.getSocietyMoney(data.job)}
            end
            cb( {
                data = moneyData, 
                players = GetPlayersInJob(Config.Locations[index].job),
                activePlayers = GetActivePlayers(),
                playerMoneyInPocket = GetMoney(source, "cash")
            })
        end)
        Framework.RegisterServerCallback("0r-mechanic:server:buyComponent", function(source, cb, data)
            local xPlayer = GetPlayer(source)

            if not xPlayer then
                return
            end

            local currentMechanic = Config.Locations[data.currentMechanic]
            if currentMechanic and currentMechanic.Society.Enable and currentMechanic.Society.Type == "default" then
                local societyMoney = bossMenuData[data.currentMechanic]
                if societyMoney then
                    if societyMoney.money >= data.price then
                        societyMoney.money -= data.price
                        --mysql option
                        MySQL.Async.execute("UPDATE 0r_bossmenu SET money = @money WHERE `index` = @index", {
                            ["@money"] = societyMoney.money,
                            ["@index"] = data.currentMechanic
                        })
                        return cb({status = true})
                    end
                end
            elseif currentMechanic and currentMechanic.Society.Enable and currentMechanic.Society.Type == "custom" then
                local societyMoney = currentMechanic.Society.getSocietyMoney(currentMechanic.job)
                if societyMoney >= data.price then
                    currentMechanic.Society.removeSocietyMoney(currentMechanic.job, data.price)
                    return cb({status = true})
                end
            end

            Notification(Config.Locale["dont_have_money"])
            return cb({status = false})
        end)

        Framework.RegisterServerCallback("buyBasketData", function(source, cb, data)
            local type = data[1]
            local basketData = data[2]
            local currentMechanic = data[3]
            local totalPrice = 0
            if next(basketData) then
                for k,v in pairs(basketData) do
                    if v.component.price then
                        totalPrice += v.component.price
                    end
                end
            end
            local currentMechanic = Config.Locations[currentMechanic]
            if currentMechanic and currentMechanic.Society.Enable and currentMechanic.Society.Type == "default" and type == "bossmenu" then 
                -- print(currentMechanic)
                local societyMoney = bossMenuData[currentMechanicIndex]
                -- print(181, societyMoney.money, totalPrice)
                if societyMoney then
                    if societyMoney.money >= totalPrice then
                        societyMoney.money -= totalPrice
                        MySQL.Async.execute("UPDATE 0r_bossmenu SET money = @money WHERE `index` = @index", {
                            ["@money"] = societyMoney.money,
                            ["@index"] = currentMechanicIndex
                        })
                        return cb({status = true})
                    end
                end
            elseif currentMechanic and currentMechanic.Society.Enable and currentMechanic.Society.Type == "custom" and type == "bossmenu" then
                local societyMoney = currentMechanic.Society.getSocietyMoney(currentMechanic.job)
                if societyMoney >= totalPrice then
                    currentMechanic.Society.removeSocietyMoney(currentMechanic.job, totalPrice)
                    return cb({status = true})
                end
            else
                local pMoney = GetMoney(source, type)
                if pMoney >= totalPrice then
                    RemoveMoney(source, totalPrice, type)
                    return cb({status = true})
                end
            end

            Notification(Config.Locale["dont_have_money"])
            return cb({status = false})

        end)
        Framework.RegisterServerCallback('0r-mechanic:server:getVehData', function(source, cb)
            cb(vehData)
        end)

    elseif Config.Framework == "qbcore" then
        GetPlayersInJob = function(job)
            local players = Framework.Functions.GetPlayers()
            local playersInJob = {}
            for i = 1, #players do
                local xPlayer = Framework.Functions.GetPlayer(players[i])
                if xPlayer.PlayerData.job.name == job then
                    table.insert(playersInJob, {
                        source = xPlayer.PlayerData.source,
                        name = xPlayer.PlayerData.charinfo.firstname.. " " .. xPlayer.PlayerData.charinfo.lastname,
                    })
                end
            end
            return playersInJob
        end
        GetActivePlayers = function(job)
            local players = GetPlayers()
            local activePlayers = {}
            for i = 1, #players do
                players[i] = tonumber(players[i])
                local xPlayer = GetPlayer(players[i])
                -- print("player kanka" , xPlayer)
                if xPlayer and xPlayer.PlayerData.job.name ~= job then
                    table.insert(activePlayers, {
                        source = xPlayer.PlayerData.source,
                        name = xPlayer.PlayerData.charinfo.firstname .. " " .. xPlayer.PlayerData.charinfo.lastname,
                    })
                end
            end
            return activePlayers
        end
-- money action 
        Framework.Functions.CreateCallback("0r-mechanic:moneyAction", function(source, cb, data)
            local mechanicIndex = data.index
            local mechanicData = Config.Locations[mechanicIndex]
            local xPlayer = GetPlayer(source)
            local type = data.type
            local amount = data.amount
            if xPlayer then
                local playerJob = xPlayer.PlayerData.job.name
                local playermoney = GetMoney(source, "cash")
                if type == "deposit" then
                    if playermoney >= amount then
                        RemoveMoney(source, amount, "cash")
                        if mechanicData.Society.Type == "default" then
                            bossMenuData[mechanicIndex].money += amount
                            MySQL.Async.execute("UPDATE 0r_bossmenu SET money = @money WHERE `index` = @index", {
                                ["@money"] = bossMenuData[mechanicIndex].money,
                                ["@index"] = mechanicIndex
                            })
                            cb({
                                pocket = GetMoney(source, "cash"),
                                money = bossMenuData[mechanicIndex].money
                            })
                        else
                            local money = mechanicData.Society.getSocietyMoney(mechanicData.job)
                            mechanicData.Society.addSocietyMoney(mechanicData.job, amount)
                            cb({
                                pocket = GetMoney(source, "cash"),
                                money = money + amount
                            })
                        end
                    else
                        cb(false)
                    end
                else
                    if mechanicData.Society.Type == "default" then
                        if bossMenuData[mechanicIndex].money >= amount then
                            AddMoney(source, amount)
                            bossMenuData[mechanicIndex].money -= amount
                            MySQL.Async.execute("UPDATE 0r_bossmenu SET money = @money WHERE `index` = @index", {
                                ["@money"] = bossMenuData[mechanicIndex].money,
                                ["@index"] = mechanicIndex
                            })
                            cb({
                                pocket = GetMoney(source, "cash"),
                                money = bossMenuData[mechanicIndex].money
                            })
                        else
                            cb(false)
                        end
                    else
                        local money = mechanicData.Society.getSocietyMoney(mechanicData.job)
                        if money >= amount then
                            AddMoney(source, amount)
                            mechanicData.Society.removeSocietyMoney(mechanicData.job, amount)
                            cb({
                                pocket = GetMoney(source, "cash"),
                                money = money - amount
                            })
                        else
                            cb(false)
                        end
                    end
                end
            end
        end)
        Framework.Functions.CreateCallback("0r-mechanic:hireEmployee", function(source, cb, targetId)
            local xPlayer = GetPlayer(source)
            local target = GetPlayer(targetId)
            if not xPlayer or not target then
                return
            end
            local currentJob = xPlayer.PlayerData.job.name
            target.Functions.SetJob(currentJob, 1)
            cb({
                name = target.PlayerData.charinfo.firstname.. " " .. target.PlayerData.charinfo.lastname,
                source = target.PlayerData.source
            } or false)
        end)
        -- fire employee
        Framework.Functions.CreateCallback("0r-mechanic:fireEmployee", function(source, cb, targetId)
            local xPlayer = GetPlayer(source)
            local target = GetPlayer(targetId)
            if not xPlayer or not target then
                return
            end
            cb(target.Functions.SetJob("unemployed", 0) or false)
        end)
        Framework.Functions.CreateCallback("0r-mechanic:getBossMenuData", function(source, cb, index)
            local data = Config.Locations[index]
            local moneyData = bossMenuData[index]
            if not data then return end
            if data.Society.Type == "custom" then
                moneyData = {money = data.Society.getSocietyMoney(data.job)}
            end
            cb({
                data = moneyData, 
                players = GetPlayersInJob(data.job),
                activePlayers = GetActivePlayers(data.job),
                playerMoneyInPocket = GetMoney(source, "cash")
            })
        end)
        Framework.Functions.CreateCallback('0r-mechanic:server:buyComponent', function(source, cb, data)
            local xPlayer = GetPlayer(source)

            if not xPlayer then
                -- -- print("no player")
                return
            end

            local currentMechanic = Config.Locations[data.currentMechanic]
            if currentMechanic and currentMechanic.Society.Enable and currentMechanic.Society.Type == "default" then
                local societyMoney = bossMenuData[data.currentMechanic]
                if societyMoney then
                    if societyMoney.money >= data.price then
                        societyMoney.money -= data.price
                        --mysql option
                        MySQL.Async.execute("UPDATE 0r_bossmenu SET money = @money WHERE `index` = @index", {
                            ["@money"] = societyMoney.money,
                            ["@index"] = data.currentMechanic
                        })
                        return cb({status = true})
                    end
                end
            elseif currentMechanic and currentMechanic.Society.Enable and currentMechanic.Society.Type == "custom" then
                local societyMoney = currentMechanic.Society.getSocietyMoney(currentMechanic.job)
                if societyMoney >= data.price then
                    currentMechanic.Society.removeSocietyMoney(currentMechanic.job, data.price)
                    return cb({status = true})
                end
            else
                local pMoney = GetMoney(source, Config.Settings.colorandfitmentpricefrom)
                if pMoney >= data.price then
                    RemoveMoney(source, data.price, Config.Settings.colorandfitmentpricefrom)
                    return cb({status = true})
                end
            end

            Notification(Config.Locale["dont_have_money"])
            return cb({status = false})
        end)
        Framework.Functions.CreateCallback("buyBasketData", function(source, cb, data)
            local type = data[1]
            local basketData = data[2]
            local currentMechanicIndex = data[3]
            -- print(currentMechanicIndex, 437)
            local totalPrice = 0
            if next(basketData) then
                for k,v in pairs(basketData) do
                    if v.component.price then
                        totalPrice += v.component.price
                    end
                end
            end
            local currentMechanic = Config.Locations[currentMechanicIndex]
            if currentMechanic and currentMechanic.Society.Enable and currentMechanic.Society.Type == "default" and type == "bossmenu" then 
                local societyMoney = bossMenuData[currentMechanicIndex]
                if societyMoney then
                    if societyMoney.money >= totalPrice then
                        societyMoney.money -= totalPrice
                        MySQL.Async.execute("UPDATE 0r_bossmenu SET money = @money WHERE `index` = @index", {
                            ["@money"] = societyMoney.money,
                            ["@index"] = currentMechanicIndex
                        })
                        return cb({status = true})
                    end
                end
            elseif currentMechanic and currentMechanic.Society.Enable and currentMechanic.Society.Type == "custom" and type == "bossmenu" then
                local societyMoney = currentMechanic.Society.getSocietyMoney(currentMechanic.job)
                if societyMoney >= totalPrice then
                    currentMechanic.Society.removeSocietyMoney(currentMechanic.job, totalPrice)
                    return cb({status = true})
                end
            else
                local pMoney = GetMoney(source, type)
                -- -- print(181, pMoney)
                if pMoney >= totalPrice then
                    RemoveMoney(source, totalPrice, type)
                    return cb({status = true})
                end
            end
            Notification(Config.Locale["dont_have_money"])
            return cb({status = false})
        end)
        Framework.Functions.CreateCallback('0r-mechanic:server:getVehData', function(source, cb)
            cb(vehData)
        end)
    end
end)

Citizen.CreateThread(function()
    checkAndCreateOrdersTable()
    checkAndCreateOrdersTable2()
end)

function checkAndCreateOrdersTable()
    local table = MySQL.query.await("SHOW TABLES LIKE '0r_mechanics'")
    if next(table) then
        sqlReady = true
    else
        MySQL.query.await([[
            CREATE TABLE IF NOT EXISTS `0r_mechanics` (
            `plate` text DEFAULT NULL,
            `data` longtext DEFAULT '[]'
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
        ]])
        sqlReady = true
    end
end

function checkAndCreateOrdersTable2()
    local table = MySQL.query.await("SHOW TABLES LIKE '0r_bossmenu'")
    if next(table) then
        sqlReady = true
    else
        MySQL.query.await([[
            CREATE TABLE IF NOT EXISTS `0r_bossmenu` (
            `index` varchar(50) DEFAULT NULL,
            `money` int(11) DEFAULT NULL
            ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
        ]])
        sqlReady = true
    end
end