TwoNa = exports["2na_core"]:getSharedObject()

RegisterNetEvent("2na_casino:Client:ShowCasino")
AddEventHandler("2na_casino:Client:ShowCasino", function() 
    TwoNa.TriggerServerCallback("2na_casino:Server:GetCasinoData", { action = "ShowCasino" }, function(data) 
        data.serverId = GetPlayerServerId(PlayerId())
        data.bannedWords = Config.BannedWords
        data.chatTimeout = Config.ChatTimeout
        SetNuiFocus(true, true)

        SendNUIMessage({
            action = "ShowCasino",
            data = data
        })
    end)
end)

RegisterNetEvent("2na_casino:Client:HideCasino")
AddEventHandler("2na_casino:Client:HideCasino", function() 
    SetNuiFocus(false, false)

    SendNUIMessage({
        action = "HideCasino"
    })

    TwoNa.TriggerServerCallback("2na_casino:Server:ExitCasino")
end)

RegisterNetEvent("2na_casino:Client:UpdateCasinoData")
AddEventHandler("2na_casino:Client:UpdateCasinoData", function(data) 
    data.serverId = GetPlayerServerId(PlayerId())
    data.bannedWords = Config.BannedWords
    data.chatTimeout = Config.ChatTimeout

    SendNUIMessage({
        action = "UpdateCasinoData",
        data = data
    })
end)

if Config.AccessTypes.Object.Enabled then 
    exports['qb-target']:AddTargetModel(Config.Object.List, {
        options = {
            {
                event = '2na_casino:Client:ShowCasino',
                type = 'client',
                icon = "fas fa-credit-card",
                label = "Enter Casino",
            },
        },
        distance = 1.5,
    })
end