local function init()
    exports[Config.ExportNames.s1nLib]:checkVersion("s1n_banking", GetCurrentResourceName())

    if Config.DiscordWebhook.enable then
        exports[Config.ExportNames.s1nLib]:initDiscordWebhook("s1n_banking", Config.DiscordWebhook)
    end

    Functions:CheckDatabase()

    Threads:StartCheckCreditsLoop()
end

RegisterServerEvent("onResourceStart", function(resourceName)
    if GetCurrentResourceName() ~= resourceName then
        return
    end

    init()
end)