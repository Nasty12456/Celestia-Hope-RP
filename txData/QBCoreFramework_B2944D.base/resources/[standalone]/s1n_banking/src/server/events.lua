RegisterServerEvent('s1n_bank:sendSharedInvite', function(data)
    local source = source

    local frameworkPlayerIdentifier = exports[Config.ExportNames.s1nLib]:getPlayerIdentifier(source)
    if not frameworkPlayerIdentifier then return end

    if not Storage.PendingSharedInvites[frameworkPlayerIdentifier] then
        Storage.PendingSharedInvites[frameworkPlayerIdentifier] = {}
    end

    if not Functions:IsPlayerInSharedAccount(data.id) then
        exports[Config.ExportNames.s1nLib]:triggerClientEvent("receiveSharedInvite", data.id,
                function()
                    Utils:Debug(("Shared invite sent to %s"):format(data.id))
                end,
                frameworkPlayerIdentifier
        )

        API:NotifyPlayer(source, Config.Translation.NOTIFICATION_INFO_SHARED_INVITE_SENT)
    else
        API:NotifyPlayer(source, Config.Translation.NOTIFICATION_ERROR_SHARED_INVITE)
    end
end)

RegisterServerEvent('s1n_bank:acceptSharedInvite', function(ownerPlayerIdentifier)
    local source = source

    local frameworkPlayerIdentifier = exports[Config.ExportNames.s1nLib]:getPlayerIdentifier(source)
    if not frameworkPlayerIdentifier then return end

    table.insert(Storage.PendingSharedInvites[ownerPlayerIdentifier], { identifier = frameworkPlayerIdentifier, name = exports[Config.ExportNames.s1nLib]:getPlayerFullName(source) })

    Functions:SaveSharedMembers(source, ownerPlayerIdentifier)

    API:NotifyPlayer(source, Config.Translation.NOTIFICATION_INFO_ACCEPTED_SHARED_INVITE)

    local accountOwnerSource = exports[Config.ExportNames.s1nLib]:getPlayerSourceFromIdentifier(ownerPlayerIdentifier)
    if not accountOwnerSource then return end

    API:NotifyPlayer(accountOwnerSource, Config.Translation.NOTIFICATION_INFO_PLAYER_JOINED_SHARED_ACCOUNT)
end)

RegisterServerEvent('s1n_bank:kickShared', function(data)
    local source = source

    Functions:KickPlayerFromSharedAccount(source, data)
end)

RegisterServerEvent('s1n_bank:leaveCloseShared', function()
    local source = source

    Functions:CloseLeaveSharedAccount(source)
end)