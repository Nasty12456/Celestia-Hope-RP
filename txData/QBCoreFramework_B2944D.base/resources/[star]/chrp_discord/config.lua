local seconds = 1000
Config = {}

Config.DiscordInfo = {
    botToken = 'S7ffTP5lqMhFOVs0U4ok7fb-WZr84F6V', -- Your Discord bot token here
    guildID = 'GUILD_ID_HERE', -- Your Discord's server ID here(Aka Guild ID)
}

Config.DiscordWhitelist = { -- Restrict if someone can fly in if they lack specific Discord role(s)
    enabled = true, -- Enable?
    deniedMessage = 'https://discord.gg/ : Join our Discord server and verify to play!', -- Message for those who lack whitelisted role(s)
    whitelistedRoles = {
        '835370971501297706', -- Maybe like a civilian role or whitelisted role(can add multiple to table)
    }
}

Config.DiscordQueue = {
    enabled = true, -- Enable? Requires
    refreshTime = 2.5 * seconds, -- How long between queue refreshes(Default: 2.5 * seconds)
    maxConnections = GetConvar("sv_maxclients", 100), -- How many slots do you have avaliable in total for server
    title = 'Celestia Hope RP', -- Maybe server name here?

    image = { -- Image shown on adaptive card
        link = 'https://i.imgur.com/i0CI67V.gif', -- Link to image, maybe like a server logo?
        width = '512px', -- Width of image(would not go much higher than this)
        height = '300px' -- Height
    },

    currentQueueText = 'Current Queue', -- Title above queue but below image

    currentSpotText = 'Current Queue: %s | Total Online: %s/%s', -- Current queue place text

    footerText = 'Visit our web store to reserve a priority queue!', -- The text right above the buttons on the adaptive card

    overflowQueueText = 'And %s more players!\n',

    buttons = { -- The little buttons at the bottom of the screen
        button1 = { -- Webstore button config
            title = 'Tebex',
            iconUrl = 'https://i.imgur.com/8msLEGN.png', -- Little button icon image link
            url = '' -- Link button goes to
        },
        button2 = {
            title = 'Discord',
            iconUrl = 'https://i.imgur.com/4a1Rdgf.png',
            url = ''
        }
    },
    roles = {

        { -- This ones provided by default are purely for example
            name = 'Citizen', -- Name you want displayed as role on queue card
            roleId = 'ROLE_ID_HERE', -- Role ID of role
            points = 0 -- Points to add to queue(Higher the number, higher the queue)
        },

        {
            name = 'Premium Citizen',
            roleId = 'ROLE_ID_HERE',
            points = 1
        },

        {
            name = 'Staff',
            roleId = 'ROLE_ID_HERE',
            points = 2
        },
        
        {
            name = 'Premium Citizen',
            roleId = 'ROLE_ID_HERE',
            points = 3
        },

        {
            name = 'Staff',
            roleId = 'ROLE_ID_HERE',
            points = 4
        },
        {
            name = 'Premium Citizen',
            roleId = 'ROLE_ID_HERE',
            points = 5
        },

        {
            name = 'Staff',
            roleId = 'ROLE_ID_HERE',
            points = 6
        },
    }
}

strings = {
    verifyConnection = 'Verifying connection...',
    verifyLauncher = 'Verifying Launcher...',
    verifyDiscord = 'Verifying Discord...',
    verifyQueue = 'Adding to queue...',
    notInDiscord = 'You must join the discord: https://discord.gg/ to fly in!',
    noDiscord = 'You must have Discord downloaded, installed, and running to connect!',
    error = 'An error has occured, please try again!'
}
