if Config.AccessTypes.Command.Enabled then 
    RegisterCommand("showcasino", function() 
        TriggerEvent("2na_casino:Client:ShowCasino")
    end)
end