-- Event called when the Account UI needs to be updated with new data
exports[Config.ExportNames.s1nLib]:registerEvent("requestUpdate", function(callback, data)
    SendNUIMessage({
        action = "updateAccount",
        data   = {
            updatedData = data
        }
    })

    if callback then
        callback()
    end
end)

-- Event called when a player receives a shared invite
exports[Config.ExportNames.s1nLib]:registerEvent("receiveSharedInvite", function(callback, owner)
    Functions:StartInviteThread(owner)

    if callback then
        callback()
    end
end)

RegisterNetEvent("s1n_bank:notify", function(message)
    API:NotifyPlayer(message)
end)