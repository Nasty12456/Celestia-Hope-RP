if exports[Config.ExportNames.s1nLib]:getCurrentFrameworkName() == "qbcore" then
    exports[Config.ExportNames.s1nLib]:createCommand({
        name              = "givecash",
        helpText          = "Give Cash",
        arguments         = {
            { name = "id", helpText = "Player ID" },
            { name = "amount", helpText = "Amount" }
        },
        argumentsRequired = true,
        onlyGroups        = {
            "admin",
        },
        onCall            = function(playerSource, arguments)
            local qbPlayer = exports[Config.ExportNames.s1nLib]:getPlayerObject(playerSource)
            if not qbPlayer then return end

            local qbTarget = exports[Config.ExportNames.s1nLib]:getPlayerObject(tonumber(arguments[1]))

            if not qbTarget then
                return API:NotifyPlayer(playerSource, "There is no online player with this ID.")
            end

            local amount = tonumber(arguments[2])

            if not amount then
                return API:NotifyPlayer(playerSource, "The amount is invalid or missing.")
            end

            if amount <= 0 then
                return API:NotifyPlayer(playerSource, "The amount needs to be higher than 0.")
            end

            if qbPlayer.PlayerData.money.cash < amount then
                return API:NotifyPlayer(playerSource, "You don't have enough cash on you.")
            end

            local playerPed = GetPlayerPed(playerSource)
            local playerCoords = GetEntityCoords(playerPed)

            local targetPed = GetPlayerPed(tonumber(arguments[1]))
            local targetCoords = GetEntityCoords(targetPed)

            if #(playerCoords - targetCoords) > 5 then
                return API:NotifyPlayer(playerSource, "The target player is too far away.")
            end

            qbPlayer.Functions.RemoveMoney('cash', amount, 'Cash transfer')
            qbTarget.Functions.AddMoney('cash', amount, 'Cash transfer')

            API:NotifyPlayer(playerSource, ("You successfully sent $%s."):format(amount))
            API:NotifyPlayer(qbTarget.PlayerData.source, ("You just received $%s"):format(amount))
        end,
    })
end