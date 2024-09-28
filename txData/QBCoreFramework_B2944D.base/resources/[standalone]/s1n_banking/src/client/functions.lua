Functions = {}

local initialized = false

-- Initialize the UI by sending the config data
-- TODO: move this to s1n_lib to handle the UI initialization for all scripts
function Functions:InitUI()
    Utils:Debug("Initializing the UI")

    while not initialized do
        SendNUIMessage({
            action = "init",
            data   = {
                debugModeActivated = Config.debugMode,
                translations       = Config.Translation,
                dynamicValues      = {
                    ["UI_TEXT_SUBMIT_CHANGE_IBAN"] = Config.ChangeIban.Price,
                },
                features           = {
                    credit = {
                        enabled = Config.Credit.Active,
                    },
                },
            }
        })

        Wait(500)
    end

end
RegisterNUICallback("receivedInit", function(data, callback)
    initialized = true

    Utils:Debug("UI initialized")

    callback({ "ok" })
end)

-- Start the invite thread which listens for the player to accept or refuse the shared account invite
-- @param owner playerSource The owner of the shared account
function Functions:StartInviteThread(owner)
    Utils:Debug("Starting invite thread")

    API:NotifyPlayer(Config.Translation.NOTIFICATION_INFO_INVITED_TO_JOIN_SHARED_ACCOUNT)

    local timeout = false

    -- Move this to a key mapping (s1n_lib should handle this)
    CreateThread(function()
        while not timeout do
            if IsControlJustReleased(0, 246) then
                TriggerServerEvent('s1n_bank:acceptSharedInvite', owner)
                break
            end

            if IsControlJustReleased(0, 249) then
                timeout = true

                API:NotifyPlayer(Config.Translation.NOTIFICATION_INFO_REFUSED_SHARED_INVITE)
                break
            end

            Wait(0)
        end
    end)

    SetTimeout(Config.Timeouts.AcceptSharedAccountInvite, function()
        timeout = true

        API:NotifyPlayer(Config.Translation.NOTIFICATION_ERROR_TIMEOUT_SHARED_INVITE)
    end)
end

-- Check if the player can open the UI, if so, opens it
function Functions:CheckOpenUI()
    if Config.CreditCardCheck then
        Utils:Debug("Checking if the player has a credit card")

        exports[Config.ExportNames.s1nLib]:triggerServerCallback("hasItemInInventory", function(result)
            if not result then
                API:NotifyPlayer(Config.Translation.NOTIFICATION_ERROR_NO_CREDIT_CARD)
                return
            end

            self:OpenUI()
        end, Config.CreditCardItem)
    else
        self:OpenUI()
    end
end
exports("checkOpenUI", function()
    Functions:CheckOpenUI()
end)

-- Open the UI
function Functions:OpenUI()
    SendNUIMessage({
        action = "openUI",
        data   = {
            config         = Config,
            closestPlayers = exports[Config.ExportNames.s1nLib]:getClosestPlayers()
        }
    })
    SetNuiFocus(true, true)
end
exports("openUI", function()
    Functions:OpenUI()
end)