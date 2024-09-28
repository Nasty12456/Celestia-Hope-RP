TwoNa = exports["2na_core"]:getSharedObject()

activeConnections = {}
chatMessages = {}
gameBets = {
    ["CRASH"] = "", -- Just used for game type check purposes
    ["DICE"] = {},
    ["MINES"] = {},
    ["PLINKO"] = {},
    ["ROULETTE"] = {},
    ["SLOT"] = {}
}
gameDatas = {
    crash = {
        history = {},
        currentGame = {
            state = "AWAITING_BETS",
            multiplier = 0.0,
            bets = {}
        }
    }
}

-- Constants 
RouletteMultipliers = {
    red = 2,
    black = 2,
    odd = 2,
    even = 2,
    anyNumber = 36,
    ["19to36"] = 2,
    ["1to18"] = 2,
    ["1to12"] = 37 / 12,
    ["13to24"] = 37 / 12,
    ["25to36"] = 37 / 12,
    ["2:1_1"] = 3,
    ["2:1_2"] = 3,
    ["2:1_3"] = 3,
}
RouletteWheelNumbers = {
    ["all"] = {0, 32, 15, 19, 4, 21, 2, 25, 17, 34, 6, 27, 13, 36, 11, 30, 8, 23, 10, 5, 24, 16, 33, 1, 20, 14, 31, 9, 22, 18, 29, 7, 28, 12, 35, 3, 26},
    ["2:1_1"] = {1, 4, 7, 10, 13, 16, 19, 22, 25, 28, 31, 34},
    ["2:1_2"] = {2, 5, 8, 11, 14, 17, 20, 23, 26, 29, 32, 35},
    ["2:1_3"] = {3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36},
    ["red"] = {32, 19, 21, 25, 34, 27, 36, 30, 23, 5, 16, 1, 14, 9, 18, 7, 12, 3},
    ["black"] = {15, 4, 2, 17, 6, 13, 11, 8, 10, 24, 33, 20, 31, 22, 29, 28, 35, 26}
}

TwoNa.RegisterServerCallback("2na_casino:Server:GetCasinoData", function(source, data, cb) 
    local charIdentifier = TwoNa.GetCharacterIdentifier(source)

    local casinoData = (TwoNa.MySQL.Sync.Fetch("SELECT * FROM 2na_casino WHERE identifier = ?", { charIdentifier }) or {})[1]

    if casinoData then 
        cb({
            identifier = charIdentifier,
            balance = casinoData.balance,
            messages = GenerateMessagesTable(),
            games = gameDatas
        })

        if data.action == "ShowCasino" then 
            table.insert(activeConnections, source)
        end
    else
        TwoNa.MySQL.Sync.Execute("INSERT INTO 2na_casino (identifier, balance) VALUES (?, ?)", { charIdentifier, 0 })

        cb({
            identifier = charIdentifier, 
            balance = 0,
            messages = GenerateMessagesTable(),
            games = gameDatas
        })

        if data.action == "ShowCasino" then 
            table.insert(activeConnections, source)
        end
    end
end)

TwoNa.RegisterServerCallback("2na_casino:Server:ExitCasino", function(source, data, cb) 
    for k, v in ipairs(activeConnections) do 
        if v == source then 
            activeConnections[k] = nil
        end
    end
end)

TwoNa.RegisterServerCallback("2na_casino:Server:UpdatePlayerBalance", function(source, data, cb) 
    local charIdentifier = TwoNa.GetCharacterIdentifier(source)

    if charIdentifier then 
        if data.casinoData then 
            TwoNa.MySQL.Sync.Execute("UPDATE 2na_casino SET balance = ? WHERE identifier = ?", { data.casinoData.balance + tonumber(data.amount), charIdentifier })
        
            TriggerClientEvent("2na_casino:Client:UpdateCasinoData", source, { balance = data.casinoData.balance + tonumber(data.amount) })
        else
            TwoNa.TriggerCallback("2na_casino:Server:GetCasinoData", source, {}, function(casinoData) 
                TwoNa.MySQL.Sync.Execute("UPDATE 2na_casino SET balance = ? WHERE identifier = ?", { casinoData.balance + tonumber(data.amount), charIdentifier })
        
                TriggerClientEvent("2na_casino:Client:UpdateCasinoData", source, { balance = casinoData.balance + tonumber(data.amount) })
    
                cb(true)
            end)
        end
    else
        cb(false)
    end
end)

TwoNa.RegisterServerCallback("2na_casino:Server:MakeBetOnGame", function(source, bet, cb) 
    if gameBets[bet.game] then 
        TwoNa.TriggerCallback("2na_casino:Server:GetCasinoData", source, {}, function(casinoData)
            local totalBetAmount = bet.data.betAmount

            if bet.game == "ROULETTE" then 
                totalBetAmount = 0
                for _, v in ipairs(bet.data.betAmount) do
                    totalBetAmount = totalBetAmount + v.chips[1]
                end
            end

            if tonumber(casinoData.balance) >= tonumber(totalBetAmount) then 
                if bet.game == "CRASH" then 
                    if gameDatas.crash.currentGame.state == "AWAITING_BETS" then 
                        local xPlayer = TwoNa.GetPlayer(source)

                        if xPlayer then 
                            local didBetBefore = false
                            for _, v in ipairs(gameDatas.crash.currentGame.bets) do 
                                if v.serverId == source then 
                                    didBetBefore = true
                                    break
                                end
                            end

                            if not didBetBefore then
                                TwoNa.TriggerCallback("2na_casino:Server:UpdatePlayerBalance", source, { casinoData = casinoData, amount = tonumber(totalBetAmount) * -1 })

                                table.insert(gameDatas.crash.currentGame.bets, { serverId = source, owner = xPlayer.name, amount = totalBetAmount, multiplier = nil, cashOut = nil })
                                
                                SendCasinoDataToClients({ games = gameDatas })

                                SendLogMessage("BetPlacement", { ["Game"] = "Crash", ["Bet Amount"] = "$" .. tostring(totalBetAmount) }, source)
                            else
                                cb(false)
                            end
                        end                    
                    else
                        cb(false)
                    end
                else
                    TwoNa.TriggerCallback("2na_casino:Server:UpdatePlayerBalance", source, { casinoData = casinoData, amount = tonumber(totalBetAmount) * -1 })

                    gameBets[bet.game][source] = bet.data

                    SendLogMessage("BetPlacement", { ["Game"] = bet.game, ["Bet Amount"] = "$" .. tostring(totalBetAmount) }, source)
                end

                cb(true)
            end
        end)
    end
end)

TwoNa.RegisterServerCallback("2na_casino:Server:SendGameResult", function(source, bet, cb)
    if gameBets[bet.game] then 
        local betExists = gameBets[bet.game][source]

        if bet.game == "CRASH" then 
            betExists = false
            for _, v in ipairs(gameDatas.crash.currentGame.bets) do 
                if v.serverId == source and v.multiplier == nil and v.cashOut == nil then 
                    betExists = true
                    break
                end
            end
        end

        if betExists then 
            local valuesDoesMath = true
            if bet.game == "CRASH" then 
                for k, v in ipairs(gameDatas.crash.currentGame.bets) do 
                    if v.serverId == source then 
                        for key, val in ipairs(v) do 
                            if gameDatas.crash.currentGame.bets[k][key] ~= bet.data[k] then 
                                valuesDoesMath = false
                                break
                            end
                        end
                    end
                end
            else
                for k, v in ipairs(gameBets[bet.game][source]) do 
                    if gameBets[bet.game][source][k] ~= bet.data[k] then 
                        valuesDoesMath = false
                        break
                    end
                end
            end

            if valuesDoesMath then
                local logData = { ["Game"] = bet.game }

                local endMoney = 0
                if bet.game == 'CRASH' then
                    if gameDatas.crash.currentGame.state == 'STARTED' and bet.data.multiplier <= gameDatas.crash.currentGame.multiplier and gameDatas.crash.currentGame.multiplier ~= 0 then
                        endMoney = bet.data.betAmount * bet.data.multiplier

                        for k, v in ipairs(gameDatas.crash.currentGame.bets) do 
                            if v.serverId == source then 
                                gameDatas.crash.currentGame.bets[k].cashOut = endMoney
                                gameDatas.crash.currentGame.bets[k].multiplier = bet.data.multiplier
                            end
                        end

                        logData["Multiplier"] = tostring(bet.data.multiplier) .. "x"
                        logData["Cash Out"] = "$" .. tostring(endMoney)
                        SendCasinoDataToClients({ games = gameDatas })
                    else
                        return cb(false)
                    end
                elseif bet.game == "DICE" then
                    if tonumber(bet.data.result) > tonumber(bet.data.rollOver) then 
                        endMoney = bet.data.betAmount * (1 + (tonumber(bet.data.rollOver) / tonumber(bet.data.winChance)))

                        logData["Win Chance"] = bet.data.winChance
                        logData["Roll Over"] = bet.data.rollOver
                        logData["Cash Out"] = "$" .. tostring(endMoney)
                    else
                        return cb(false)
                    end
                elseif bet.game == "MINES" then
                    if bet.data.didWin then 
                        endMoney = bet.data.betAmount * (1 / (1 - (bet.data.mineAmount / (25 - bet.data.blockClicked))))

                        logData["Mine Amount"] = bet.data.mineAmount
                        logData["Block Clicked"] = bet.data.blockClicked
                        logData["Cash Out"] = "$" .. tostring(endMoney)
                    end
                elseif bet.game == "PLINKO" then
                    local betPerBall = bet.data.betAmount / #bet.data.multipliers

                    for _, v in ipairs(bet.data.multipliers) do 
                        endMoney = endMoney + betPerBall * tonumber(v) 
                    end

                    logData["Bet Amount"] = bet.data.betAmount
                    logData["Multiplier"] = tostring(bet.data.multiplier) .. "x"
                    logData["Cash Out"] = "$" .. tostring(endMoney)
                elseif bet.game == "ROULETTE" then
                    for _, v in ipairs(bet.data.betAmount) do
                        local didChipWin = false

                        if type(v.chipId) == "number" then 
                            if v.chipId == bet.data.winningNumber then 
                                didChipWin = true
                            end
                        else
                            if v.chipId == "red" then 
                                for _,v in ipairs(RouletteWheelNumbers.red) do 
                                    if v == bet.data.winningNumber then 
                                        didChipWin = true
                                        break
                                    end
                                end
                            elseif v.chipId == "black" then
                                for _,v in ipairs(RouletteWheelNumbers.black) do 
                                    if v == bet.data.winningNumber then 
                                        didChipWin = true
                                        break
                                    end
                                end
                            elseif v.chipId == "odd" then
                                didChipWin = not math.floor(bet.data.winningNumber / 2) == (bet.data.winningNumber / 2)
                            elseif v.chipId == "even" then
                                didChipWin = math.floor(bet.data.winningNumber / 2) == (bet.data.winningNumber / 2)
                            elseif v.chipId == "19to36" then
                                if bet.data.winningNumber >= 19 and bet.data.winningNumber <= 36 then 
                                    didChipWin = true
                                end
                            elseif v.chipId == "1to18" then
                                if bet.data.winningNumber >= 1 and bet.data.winningNumber <= 18 then 
                                    didChipWin = true
                                end
                            elseif v.chipId == "1to12" then
                                if bet.data.winningNumber >= 1 and bet.data.winningNumber <= 12 then 
                                    didChipWin = true
                                end
                            elseif v.chipId == "13to24" then
                                if bet.data.winningNumber >= 13 and bet.data.winningNumber <= 24 then 
                                    didChipWin = true
                                end
                            elseif v.chipId == "25to36" then
                                if bet.data.winningNumber >= 25 and bet.data.winningNumber <= 36 then 
                                    didChipWin = true
                                end
                            elseif v.chipId == "2:1_1" then
                                for _,v in ipairs(RouletteWheelNumbers["2:1_1"]) do 
                                    if v == bet.data.winningNumber then 
                                        didChipWin = true
                                        break
                                    end
                                end
                            elseif v.chipId == "2:1_2" then
                                for _,v in ipairs(RouletteWheelNumbers["2:1_2"]) do 
                                    if v == bet.data.winningNumber then 
                                        didChipWin = true
                                        break
                                    end
                                end
                            elseif v.chipId == "2:1_3" then
                                for _,v in ipairs(RouletteWheelNumbers["2:1_3"]) do 
                                    if v == bet.data.winningNumber then 
                                        didChipWin = true
                                        break
                                    end
                                end
                            end
                        end

                        if didChipWin then 
                            if type(v.chipId) == 'number' then 
                                v.chipId = "anyNumber"
                            end

                            endMoney = endMoney + RouletteMultipliers[v.chipId] * v.chips[1]
                        end

                        logData["Cash Out"] = "$" .. tostring(endMoney)
                    end
                elseif bet.game == "SLOT" then
                    local maxItemCount = 1

                    for _, v in ipairs(bet.data.slots) do 
                        
                        local itemCount = 0
                        for _, val in ipairs(bet.data.slots) do 
                            if v.item == val.item then 
                                itemCount = itemCount + 1
                            end
                        end

                        if itemCount > maxItemCount then 
                            maxItemCount = itemCount
                        end
                    end

                    endMoney = Config.SlotMultipliers[tostring(maxItemCount)] * bet.data.betAmount

                    if endMoney > 0 then 
                        logData["Same Item Amount"] = maxItemCount
                        logData["Bet Amount"] = bet.data.betAmount
                        logData["Cash Out"] = "$" .. tostring(endMoney)
                    end
                end

                if endMoney > 0 then 
                    if bet.game ~= 'CRASH' then 
                        gameBets[bet.game][source] = nil
                    end

                    SendLogMessage("GameResult", logData, source)

                    TwoNa.TriggerCallback("2na_casino:Server:UpdatePlayerBalance", source, { amount = endMoney })

                    cb(true)
                end
            else
                cb(false)
            end
        else
            cb(false)
        end
    else
        cb(false)
    end
    
    cb(true)
end)

TwoNa.RegisterServerCallback("2na_casino:Server:DepositMoney", function(source, data, cb) 
    local charIdentifier = TwoNa.GetCharacterIdentifier(source)
    local xPlayer = TwoNa.GetPlayer(source)

    if xPlayer and charIdentifier and tonumber(data.amount or 0) > 0 then
        TwoNa.TriggerCallback("2na_casino:Server:GetCasinoData", source, {}, function(casinoData) 
            if data.method == "bank" then
                if tonumber(xPlayer.getBank()) >= tonumber(data.amount) then
                    xPlayer.removeBank(data.amount)
    
                    TwoNa.MySQL.Sync.Execute("UPDATE 2na_casino SET balance = ? WHERE identifier = ?", { casinoData.balance + tonumber(data.amount), charIdentifier })
    
                    TriggerClientEvent("2na_casino:Client:UpdateCasinoData", source, { balance = casinoData.balance + tonumber(data.amount) })
                else
                    cb(false)
                end 
            elseif data.method == "cash" then
                if tonumber(xPlayer.getMoney()) >= tonumber(data.amount) then
                    xPlayer.removeMoney(data.amount)
    
                    TwoNa.MySQL.Sync.Execute("UPDATE 2na_casino SET balance = ? WHERE identifier = ?", { casinoData.balance + tonumber(data.amount), charIdentifier })
    
                    TriggerClientEvent("2na_casino:Client:UpdateCasinoData", source, { balance = casinoData.balance + tonumber(data.amount) })
                else
                    cb(false)
                end 
            else
                cb(false)
            end
        end)
    else
        cb(false)
    end
end)

TwoNa.RegisterServerCallback("2na_casino:Server:WithdrawMoney", function(source, data, cb) 
    local charIdentifier = TwoNa.GetCharacterIdentifier(source)
    local xPlayer = TwoNa.GetPlayer(source)

    if xPlayer and charIdentifier then
        local casinoData = TwoNa.TriggerCallback("2na_casino:Server:GetCasinoData", source, {}, function(casinoData) 
            if data.method == "bank" then
                if tonumber(casinoData.balance) >= tonumber(data.amount) then
                    TwoNa.MySQL.Sync.Execute("UPDATE 2na_casino SET balance = ? WHERE identifier = ?", { casinoData.balance - tonumber(data.amount), charIdentifier })
    
                    TriggerClientEvent("2na_casino:Client:UpdateCasinoData", source, { balance = casinoData.balance - tonumber(data.amount) })
    
                    xPlayer.addBank(data.amount)
                else
                    cb(false)
                end 
            elseif data.method == "cash" then
                if tonumber(casinoData.balance) >= tonumber(data.amount) then
                    TwoNa.MySQL.Sync.Execute("UPDATE 2na_casino SET balance = ? WHERE identifier = ?", { casinoData.balance - tonumber(data.amount), charIdentifier })
    
                    TriggerClientEvent("2na_casino:Client:UpdateCasinoData", source, { balance = casinoData.balance - tonumber(data.amount) })
    
                    xPlayer.addMoney(data.amount)
                else
                    cb(false)
                end 
            else
                cb(false)
            end
        end)
    else
        cb(false)
    end
end)

TwoNa.RegisterServerCallback("2na_casino:Server:SendMessage", function(source, data, cb) 
    local lastMessageOfUser = nil
    for k,v in ipairs(chatMessages) do 
        if v.serverId == source then 
            if lastMessageOfUser then
                if lastMessageOfUser.createdAt < v.createdAt then 
                    lastMessageOfUser = v
                end 
            else
                lastMessageOfUser = v
            end
        end
    end

    if lastMessageOfUser then 
        if (os.time() - (lastMessageOfUser.createdAt)) < Config.ChatTimeout then 
            return
        end
    end

    local xPlayer = TwoNa.GetPlayer(source)
    if xPlayer then
        table.insert(chatMessages, { serverId = source, content = xPlayer.name .. ": " .. data.message, createdAt = os.time() })

        SendCasinoDataToClients({ messages = GenerateMessagesTable() })

        SendLogMessage("ChatMessage", { ["Author"] = xPlayer.name, ["Message"] = data.message }, source)

        cb(true)
    else
        cb(false)
    end
end)