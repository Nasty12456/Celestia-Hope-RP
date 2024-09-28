API_KEYS = {
    Discord = "OTg3ODA5NTQwMTk4MjY5MDI5.GM9Lg2.v7Q8-WYO9VpEK7-oGXwert2_EDkg2kefNb_SlY",
    Video = "M6mb0Wuuezw8vdUhYm0bKJS9YLQNFQfl",
    Image = "XW4l5sI3AHv0NWrHTiCSYncXes5KEgT6" 
}

RegisterNetEvent('test-playerconnecting', function()
    local src = source
    TriggerClientEvent('0bug-apiKeys', src, API_KEYS)
end)

AddEventHandler('playerConnecting', function()
    local src = source
    TriggerClientEvent('0bug-apiKeys', src, API_KEYS)
end)