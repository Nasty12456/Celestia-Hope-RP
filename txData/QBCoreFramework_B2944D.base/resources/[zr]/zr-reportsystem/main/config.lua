Config = {}

Config.Locale = "en"

Config.resolutions = "720p" -- or "1080p" , "480p" , "360p" /  Image quality of the video to be recorded.
Config.timeout = 30000 -- In milliseconds, the amount of seconds the video will be divided so that it does not exceed the Discord loading size



Config.DefaultAvatar = "./img/avatar.png"

Config.ImageAPI = "https://api.fivemanage.com/api/image"
Config.VideoAPI = "https://api.fivemanage.com/api/video"




Config.Admin = {
    "c9109e161d294aa63f3e5d28ec27cab3d7e08466", --Nasty
    "bd7a89ac503ce8b2c69ea9fa567e6c73516b584a", --jacob
    "591d2af6b6e9178d53cec2177d685543f0e53a8d", --Ali
    "0893d749544710555c8a1be335415d7ac72130be", --Andrew
    

}

Config.ChatCommand = {
    [1] = {
        command = "adduser", -- You add a new user to the ticket.
        useAdmin = true 
    }
}

Config.Command = {
    Report = "report",
    Record_Start = "startrecord",
    Record_Stop = "stoprecord",
    Screen_Shot = "screenshot"
}

Config.CommandKeyboard = {
    Report = "I",
    Record_Start = "f6",
    Record_Stop = "f7",
    Screen_Shot = "f9"
}

Config.HealEvent = function(targetped)
    SetEntityHealth(targetped, 100)
end

Config.ReviveEvent = function(targetped)
    SetEntityHealth(targetped, 100)

end

Config.KillPlayer = function(targetped)
    SetEntityHealth(targetped, 0)
end

Config.Questions = {
    {
        title = "Can I track the status of my report?",
        text = "Yes, you can view the status of your reports in the 'My Reports' section.",
        visible = false
    }, 
    {
        title = "Can I track the status of my report?",
        text = "Yes, you can view the status of your reports in the 'My Reports' section.",
        visible = false
    }, 
    {
        title = "Can I track the status of my report?",
        text = "Yes, you can view the status of your reports in the 'My Reports' section.",
        visible = false
    }, 
    {
        title = "Can I track the status of my report?",
        text = "Yes, you can view the status of your reports in the 'My Reports' section.",
        visible = false
    }, 
    {
        title = "Can I track the status of my report?",
        text = "Yes, you can view the status of your reports in the 'My Reports' section.",
        visible = false
    }, 
    {
        title = "Can I track the status of my report?",
        text = "Yes, you can view the status of your reports in the 'My Reports' section.",
        visible = false
    }
}

Config.priorityList = {
    {
        text = TranslateCap("critical"),
        type = 'critical',
        color = '#F53D6B'
    },
    {
        text = TranslateCap("important"),
        type = 'important',
        color = '#FFA500'
    },
    {
        text = TranslateCap("normal"),
        type = 'normal',
        color = '#4CAF50'
    },
}

Config.categoryList = {
    {
        text =  TranslateCap("system_issue"),
        type = "bug",
    },
    {
        text = TranslateCap("player_report"),
        type = "player",
    },
    {
        text = TranslateCap("question"),
        type = "question",
    },
}

Config.Notification = {
    ["newReport"] = {
        title = "New Report",
        description = "A new report request has been created.",
        time = 5000,
        icon = "ticket"
    },
    ["addMessage"] = {
        title = "New Message",
        description = "New message arrived, Ticket ID: %s",
        time = 5000,
        icon = "message"
    },
    ["solvedReport"] = {
        title = "Report Solved",
        description = "This Ticket Was Marked as Solved by %s",
        time = 5000,
        icon = "ticket"
    },
    ["claim"] = {
        title = "Claim Report",
        description = "Claim Report, Ticket ID: %s",
        time = 5000,
        icon = "ticket"
    },
    ["addMedia"] = {
        title = "Add Media",
        description = "New media added to the gallery.",
        time = 5000,
        icon = "media"
    },
    ["addUser"] = {
        title = "Add User",
        description = "You were added to a report request.",
        time = 5000,
        icon = "ticket"
    },
}

Config.death_reasons = {
    ["self"] = 'committed suicide',
    ["unknown"] = 'died',
    ["melee"] = 'murdered',
    ["torch"] = 'burned',
    ["knife"] = 'stabbed',
    ["pistol"] = 'shot with a pistol',
    ["sub"] = 'shot with an SMG',
    ["rifle"] = 'shot with a rifle',
    ["light"] = 'killed with a light weapon',
    ["shotgun"] = 'blasted with a shotgun',
    ["sniper"] = 'sniped',
    ["heavy"] = 'obliterated',
    ["minigun"] = 'shredded',
    ["bomb"] = 'blown up',
    ["veh"] = 'run over',
    ["vk"] = 'crushed',
    ["default"] = 'killed'
}

Config.Logs = {
    ["playerConnecting"] = {
        text = "%s logged in to the server"
    },
    ["playerDropped"] = {
        text = "%s logged out of the server"
    }
}
