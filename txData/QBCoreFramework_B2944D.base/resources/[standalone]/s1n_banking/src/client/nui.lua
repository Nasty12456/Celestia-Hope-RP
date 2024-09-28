RegisterNuiCallback('close', function(data, cb)
    SetNuiFocus(false, false)
end)

RegisterNuiCallback('createAccount', function(data, cb)
    exports[Config.ExportNames.s1nLib]:triggerServerCallback("createAccount", function(result, error)
        if not result then
            API:NotifyPlayer(error or Config.Translation.NOTIFICATION_ERROR_ALREADY_HAVE_ACCOUNT_TYPE)
        end
        cb(result)
    end, data)
end)

RegisterNuiCallback('getAccountData', function(data, cb)
    exports[Config.ExportNames.s1nLib]:triggerServerCallback("getAccountData", function(result, error)
        if not result then
            API:NotifyPlayer(error or Config.Translation.NOTIFICATION_ERROR_NO_BANK_ACCOUNT)
        end

        cb(result)
    end, data)
end)

RegisterNuiCallback('accountAction', function(data, cb)
    exports[Config.ExportNames.s1nLib]:triggerServerCallback("accountAction", function(success, errorMessage)
        if not success then
            API:NotifyPlayer(errorMessage or Config.Translation.NOTIFICATION_ERROR_SOMETHING_WENT_WRONG)
        end

        cb(success)
    end, data)
end)

RegisterNuiCallback('changeIban', function(data, cb)
    exports[Config.ExportNames.s1nLib]:triggerServerCallback("changeIban", function(result, error)
        if not result then
            API:NotifyPlayer(error or Config.Translation.NOTIFICATION_ERROR_IBAN_ALREADY_USED)
        end

        cb(result)
    end, data)
end)

RegisterNuiCallback('sendSharedInvite', function(data, cb)
    TriggerServerEvent('s1n_bank:sendSharedInvite', data)
end)

RegisterNuiCallback('kickShared', function(data, cb)
    TriggerServerEvent('s1n_bank:kickShared', data)
end)

RegisterNuiCallback('signContract', function(data, cb)
    exports[Config.ExportNames.s1nLib]:triggerServerCallback('signContract', function(error)
        if error then
            API:NotifyPlayer(error)
        end

        cb(error)
    end, data)
end)

RegisterNuiCallback('closeLeaveShared', function(data, cb)
    TriggerServerEvent('s1n_bank:leaveCloseShared')
end)