-- Events --

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    if Config.CommandEnabled then
        TriggerServerEvent('qb-givecar:server:RequestCommands')
    end
end)

RegisterNetEvent('qb-givecar:client:RequestCommands', function(isAllowed)
    if isAllowed then
        TriggerEvent('chat:addSuggestion', '/' .. Config.GiveCarCommand, '[' .. Lang:t('other.id') .. '] [' .. Lang:t('other.model') .. ']', {})
    end
end)

RegisterNetEvent('qb-givecar:client:sendText')
AddEventHandler('qb-givecar:client:sendText', function(sender, subject, message)
    TriggerServerEvent('qb-phone:server:sendNewMail', {
        sender = sender,
        subject = subject,
        message = message,
    })
end)