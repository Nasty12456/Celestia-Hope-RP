zr_config = {}
zr_interval = 10000 -- Scoreboard update interval (10000 ms = 10 seconds)
zr_discord_avatar_token = ''
zr_default_avatar = 'https://cdn.discordapp.com/avatars/1000374686892433418/c54501700e1c15db4133902190a89ad3.png' -- Default avatar to display if you don't setup your discord API.
zr_config_ping = 'ms' 
zr_config_position = 'left' -- Switch between 'right' or 'left'.
zr_config_color = '#00CCB8' -- Default Scoreboard Hex color
zr_config_playername = 'game' -- 'game', 'character', 'unknown'
zr_config_anonname = "Hidden User" -- Custom name you want to display for players if you choose the 'unknown' option.

-- Command and Shortcut 
zr_config.OpenCommand = "showscoreboard"  -- Command for opening the scoreboard
zr_config.DefaultKey = "F9"  -- Default key shortcut for scoreboard

-- Roles
zr_config.roles = {
    {license = 'license:db0a170242ac74228c6fd86386c7fcebf5e7b7c9', role = 'Server Admin', color= '#FFFFF', icon=''},
    {license = 'license:abcdefg123456', role = 'Server Support', color='#FFFFF', icon=''},
    -- Add more roles as needed
}
-- Default role = 
zr_config.roles_default = {license = '', role = 'Player', color= '#FFFFF', icon=''}


-- Job list
zr_config.jobs = {
    {id='police', name='Police', icon='zr-assets/zr-icon/zr-police-icon.svg'},
    {id='taxi', name='Taxi', icon='zr-assets/zr-icon/zr-taxi-icon.svg'},
    {id='ems', name='Ems', icon='zr-assets/zr-icon/zr-ems-icon.svg'},
    {id='mechanic', name='Mechanic', icon='zr-assets/zr-icon/zr-mechanic-icon.svg'},
    {id='realestate', name='Realestate', icon='zr-assets/zr-icon/zr-realestate-icon.svg'},
    {id='trucker', name='Trucker', icon='zr-assets/zr-icon/zr-truck-icon.svg'}
}

-- Heists
zr_config.heists = {
    {job='police', threshold=1, img='zr-assets/zr-img/zr-store.png', name='Store Robbery'},
    {job='police', threshold=6, img='zr-assets/zr-img/zr-jewlery.png', name='Jewelery Robbery'},
    {job='police', threshold=1, img='zr-assets/zr-img/zr-house.png', name='House Robbery'},
    {job='police', threshold=6, img='zr-assets/zr-img/zr-fleeca.png', name='Fleeca Robbery'},
    {job='police', threshold=1, img='zr-assets/zr-img/zr-paletobank.png', name='Paleto Robbery'},
    {job='police', threshold=6, img='zr-assets/zr-img/zr-pacificbank.png', name='Pacific Robbery'},
}

-- Keybinds
zr_config.keybinds = {
    {
        key = "F1",
        description = "Opens the Interaction Menu, providing access to settings and actions."
    },
    {
        key = "F2",
        description = "Displays the Inventory Menu, where you can view and manage your items."
    },
    {
        key = "F3",
        description = "Accesses the Map Menu, allowing you to view and set waypoints."
    },
    {
        key = "F4",
        description = "Opens the Vehicle Controls, giving you options for vehicle management and modifications."
    },
    {
        key = "F5",
        description = "Shows the Player Stats, including health, armor, and other statistics."
    },
    {
        key = "F6",
        description = "Brings up the Communication Menu, letting you send messages to other players."
    },
    {
        key = "F7",
        description = "Accesses the Quick Actions Menu, offering various one-click actions for convenience."
    }
}



-- Commands
zr_config.commands = {
    -- Police Commands
    {
        name = '/arrest',
        description = 'Arrests the player you are targeting, placing them under custody.',
        job = 'Police'
    },
    {
        name = '/search',
        description = 'Searches the player for illegal items or contraband.',
        job = 'Police'
    },
    {
        name = '/ticket',
        description = 'Issues a traffic ticket to the targeted vehicle.',
        job = 'Police'
    },
    {
        name = '/callbackup',
        description = 'Requests backup from other officers in the area.',
        job = 'Police'
    },
    {
        name = '/raid',
        description = 'Initiates a raid on a location, with a warrant if required.',
        job = 'Police'
    },
    {
        name = '/pursuit',
        description = 'Begins a pursuit of a fleeing suspect.',
        job = 'Police'
    },
    {
        name = '/setroadblock',
        description = 'Sets up a roadblock at your current location.',
        job = 'Police'
    },
    {
        name = '/trafficstop',
        description = 'Pulls over a vehicle for a traffic violation.',
        job = 'Police'
    },
    {
        name = '/checkwarrants',
        description = 'Checks if the targeted player has any outstanding warrants.',
        job = 'Police'
    },
    {
        name = '/investigate',
        description = 'Starts an investigation at a crime scene.',
        job = 'Police'
    },

    -- Ambulance Commands
    {
        name = '/heal',
        description = 'Heals the player next to you, restoring their health to full.',
        job = 'Ambulance'
    },
    {
        name = '/revive',
        description = 'Revives the player next to you if they are downed.',
        job = 'Ambulance'
    },
    {
        name = '/transport',
        description = 'Transport the injured player to the nearest hospital.',
        job = 'Ambulance'
    },
    {
        name = '/callmedic',
        description = 'Calls for a medic to assist with a critical situation.',
        job = 'Ambulance'
    },
    {
        name = '/bandage',
        description = 'Bandages the injured player, stopping their bleeding.',
        job = 'Ambulance'
    },
    {
        name = '/checkpulse',
        description = 'Checks the pulse of the player to assess their condition.',
        job = 'Ambulance'
    },
    {
        name = '/administerdrugs',
        description = 'Administers medical drugs to stabilize the patient.',
        job = 'Ambulance'
    },

    -- Mechanic Commands
    {
        name = '/repair',
        description = 'Repairs the vehicle you are targeting, fixing any damage.',
        job = 'Mechanic'
    },
    {
        name = '/customize',
        description = 'Opens the vehicle customization menu for modifications.',
        job = 'Mechanic'
    },
    {
        name = '/tow',
        description = 'Tows the vehicle to the nearest repair shop or impound.',
        job = 'Mechanic'
    },
    {
        name = '/clean',
        description = 'Cleans the vehicle, removing dirt and debris.',
        job = 'Mechanic'
    },
    {
        name = '/upgrade',
        description = 'Upgrades the vehicle with performance enhancements.',
        job = 'Mechanic'
    }
}

-- Annoucements
zr_config.annoucements = {
    {
        img = 'zr-assets/zr-img/zr-race.png',
        title = 'Los Santos Race',
        description = 'Join the Racing Extravaganza on March 18th at 8:00 PM GMT for a chance to win $350,000 Dollars and showcase your driving skills.Join the Join the Racing Extravaganza on March 18th at 8:00 PM GMT for a chance to win $350,000 Dollars and showcase your driving skills.',
        type = 'Cash Prize',
        text = '$350,000'
    },
    {
        img = 'zr-assets/zr-img/zr-update.png',
        title = 'New features and improvements',
        description = '• Enhanced the user interface for the inventory system.<br>• Fixed the problem with job-related item pickups.<br>• Adjusted vehicle handling for a more realistic experience.<br>• Fixed bugs in the new heist system.',
        type = 'Version: 1.1.5',
        text = 'Date: 28 August'
    },
    {
        img = 'zr-assets/zr-img/zr-wedding.png',
        title = 'Wedding Bash',
        description = 'Join the Wedding Bash on April 12th at 6:00 PM! Dress up and be part of this joyous celebration of love and laughter.',
        type = 'Date Time:',
        text = 'April 12th'
    },
}