Config = {}

--[[]

    If you do want to use logging featurue of the script then you shoul fill these fields
    You just need to create a webhook inside of the Discord channel you want script to send the log to
    If you don't want to use this feature then leave the strings empty.

--]]
Config.DiscordWebhooks = {
    BetPlacement = "https://discord.com/api/webhooks/1209508905282052166/YxFjyhDw-yiK7zPneoPGAqFT3ER5L1bFleLJ9bwWgIln2PSODP4Q_3kOUH5_Mdp82l0F",
    GameResult   = "https://discord.com/api/webhooks/1209508905282052166/YxFjyhDw-yiK7zPneoPGAqFT3ER5L1bFleLJ9bwWgIln2PSODP4Q_3kOUH5_Mdp82l0F",
    ChatMessage  = "https://discord.com/api/webhooks/1209508905282052166/YxFjyhDw-yiK7zPneoPGAqFT3ER5L1bFleLJ9bwWgIln2PSODP4Q_3kOUH5_Mdp82l0F"
}

-- Access types for casino if you want to make the casino work in a special map, etc. then use the object option.
Config.AccessTypes = {
    Command = {
        Enabled = true
    },

    Object = {
        Enabled = false, -- WARNING: Only qb-target is supported
        List = {} -- Object names should be placed inside of here like this "a" so this field should look like this List = { "myobject1", "myobject2", "myobject3" }
    },
}

-- These key words will be replaced as **** in the chat to prevent users from using bad words.
Config.BannedWords = {
    "bastard",
    "fuck",
    "motherfucker",
    "bitch",
    "bullshit",
    "fucker",
    "cunt",
    "pussy"
}

-- How much time should server make user to wait to send a message after sending one
Config.ChatTimeout = 2 

--[[

    Theese are the multipliers for the slot game.
    Left side (1,2,3,4,5) indicates how many same items are placed on the center of the slot game
    Right side (values placed after the '=') are the multipliers

]]--
Config.SlotMultipliers = {
    ["1"] = 0,
    ["2"] = 0.85,
    ["3"] = 2,
    ["4"] = 3.5,
    ["5"] = 5
}

-- Duration of the "awaiting bets" phase in crash game in seconds
Config.CrashWaitBetDuration = 5