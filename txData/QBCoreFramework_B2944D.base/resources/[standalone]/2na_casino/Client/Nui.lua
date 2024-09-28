RegisterNUICallback("HideCasino", function() 
    TriggerEvent("2na_casino:Client:HideCasino")
end)

RegisterNUICallback("MakeBetOnGame", function(data, cb) 
    TwoNa.TriggerServerCallback("2na_casino:Server:MakeBetOnGame", data,  function(resp) 
        cb(resp)
    end)
end)

RegisterNUICallback("SendGameResult", function(data, cb) 
    TwoNa.TriggerServerCallback("2na_casino:Server:SendGameResult", data,  function(resp) 
        cb(resp)
    end)
end)

RegisterNUICallback("SendMessage", function(data, cb) 
    TwoNa.TriggerServerCallback("2na_casino:Server:SendMessage", data, function(resp) 
        cb(resp)
    end)
end)

RegisterNUICallback("DepositMoney", function(data, cb) 
    TwoNa.TriggerServerCallback("2na_casino:Server:DepositMoney", data)
end)

RegisterNUICallback("WithdrawMoney", function(data, cb) 
    TwoNa.TriggerServerCallback("2na_casino:Server:WithdrawMoney", data)
end)