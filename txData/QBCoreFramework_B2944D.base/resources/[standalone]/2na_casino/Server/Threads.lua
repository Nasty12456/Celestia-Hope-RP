Citizen.CreateThread(function() 
    while true do 
        if gameDatas.crash.currentGame.state == "AWAITING_BETS" then 
            Citizen.Wait(Config.CrashWaitBetDuration * 1000)

            gameDatas.crash.currentGame.state = "STARTED"

            SendCasinoDataToClients({ games = gameDatas })
        elseif gameDatas.crash.currentGame.state == "STARTED" then

            math.randomseed(os.time())

            gameDatas.crash.currentGame.multiplier = gameDatas.crash.currentGame.multiplier + (math.random(1, 15) / 100)

            SendCasinoDataToClients({ games = gameDatas })

            local shouldCrash = false
            if (math.log(gameDatas.crash.currentGame.multiplier * 10) * 10) > math.random(1, 100) then 
                shouldCrash = true
            end

            Citizen.Wait(100)

            if shouldCrash then 
                gameDatas.crash.currentGame.state = "CRASHED"

                SendCasinoDataToClients({ games = gameDatas })
            end
        elseif gameDatas.crash.currentGame.state == "CRASHED" then
            gameDatas.crash.currentGame.state = "AWAITING_BETS"
            gameDatas.crash.currentGame.bets = {}
            table.insert(gameDatas.crash.history, gameDatas.crash.currentGame.multiplier)
            gameDatas.crash.currentGame.multiplier = 0.0

            Citizen.Wait(1000)

            SendCasinoDataToClients({ games = gameDatas })
        end

        Citizen.Wait(100)
    end
end)