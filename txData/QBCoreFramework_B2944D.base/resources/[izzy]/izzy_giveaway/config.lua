Config = {
    Framework = "qb", -- qb / esx / olqb / oldesx
    Identifier = "discord", -- steam / discord / license
    MySQL = "oxmysql", -- oxmysql / ghmattimysql / mysql-async
    
    Admins = {
        "discord:366666266049773568",
        "discord:507683090714329089",
        "discord:1178242093433495595",
    },

    Command = "giveaway",
    JoinMoneyType = "bank", -- cash / bank

    Notify = function(src, text, type, length)
        QBCore.Functions.Notify(src, text, type, length)
    end,
}


Translations = {
    ["CanNotBeNull"] = "Der Geschenkartikel darf nicht leer sein.",
    ["CantJoin"] = "Sie können an dieser Lotterie nicht teilnehmen.",
    ["InvalidInput"] = "Füllen Sie die Lücken vollständig aus.",
    ["NotAdmin"] = "Du bist kein Admin.",
    ["AlreadyStarted"] = "Eine lotterie läuft bereits.",
    ["GameFull"] = "Verlosung voll.",
    ["NoMoney"] = "Du hast nicht genug Geld",
    ["AlreadyJoined"] = "Sie haben bereits an dieser Lotterie teilgenommen.",
    ["Success"] = "Verlosung erfolgreich erstellt.", 
}