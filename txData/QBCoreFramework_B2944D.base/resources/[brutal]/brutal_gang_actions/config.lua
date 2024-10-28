----------------------------------------------------------------------------------------------
-------------------------------------| BRUTAL GANGS :) |--------------------------------------
----------------------------------------------------------------------------------------------

--[[
Hi, thank you for buying our script, We are very grateful!

For help join our Discord server:     https://discord.gg/85u2u5c8q9
More informations about the script:   https://docs.brutalscripts.com
--]]

Config = {
    Core = 'QBCORE',  -- 'ESX' / 'QBCORE' | Other core setting on the 'core' folder.
    Target = 'qb-target', -- 'oxtarget' / 'qb-target' 
    BrutalNotify = true, -- Buy here: (4€+VAT) https://store.brutalscripts.com | Or set up your own notify >> cl_utils.lua
    PanelControlMode = 'scroll', -- scroll, key
    AllowedJobs = {'ballas', 'triads', 'vagos', 'lostmc', 'families', 'angels'}, -- set to 'false' to allow it to anybody

    HeadBag = {
        BlackFade = true,
    },
    
    HandCuff = {
        Freeze = false, -- Do you want to freeze the player while he is cuffed? true / false
        CuffObject = true, -- Do you want to use Cuff Object on the player's hand? true / false
        -- More controls: https://docs.fivem.net/docs/game-references/controls/
        DisableControls = {24,257,25,263,32,34,31,30,45,22,44,37,23,288,289,170,167,73,199,59,71,72,36,47,264,257,140,141,142,143,75}, -- Disabled controls while the player is cuffed.
        Trigger = 'brutal_gang_actions:cuff',
    },

    Hostage = {
        AllowedWeapons = {
            `WEAPON_PISTOL`,
            `WEAPON_COMBATPISTOL`,
        },
        DisableControls = {24,257,25,263,32,34,31,30,45,22,44,37,23,288,289,170,167,73,199,59,71,72,36,47,264,257,140,141,142,143,75},
    },

    TyreSlash = {
        AllowedWeapons = {
            `WEAPON_KNIFE`,
            `WEAPON_BOTTLE`,
            `WEAPON_DAGGER`,
            `WEAPON_HATCHET`,
            `WEAPON_MACHETE`,
            `WEAPON_SWITCHBLADE`
        },
    },

    Knockout = {
        KnockEffect = 'ragdoll', --'animation' or 'ragdoll'
        Cooldown = {use = true, time = 60}, -- time in sec 
        Time = 5, -- time in sec, how much time should be the player passed out
    },

    Commands = {  -- to turn off a command just simply leave empty the command line, like this: Command = '',
        JobMenu = {
            Command = 'gjobmenu',
            Control = '',  -- Controls list:  https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
            Suggestion = 'Open Job Menu'
        },

        PutBagOnMyself = {
            Command = 'mebag', 
            Control = '',  -- Controls list:  https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
            Suggestion = 'Put Bag on your head',
            Item = {'', true, true} -- item name | leave it empty to not use any item, like this: '', remove it when put on head or not, give it when removed from head or not
        },

        PutBagOnOtherPeople = {
            Command = 'bag',
            Control = '',  -- Controls list:  https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
            Suggestion = 'Put Bag on others head',
            Item = {'', true, true} -- item name | leave it empty to not use any item, like this: '', remove it when put on head or not, give it when removed from head or not
        },

        Hostage = {
            Command = 'hostage',
            Control = '',  -- Controls list:  https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
            Suggestion = 'Hostage an other people'
        },

        PutPlayerInVehicle = {
            Command = 'putplayerinvehicle',
            Control = '',  -- Controls list:  https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
            Suggestion = 'Put player in vehicle',
            BlacklistedVehicles = {'bf400'}, -- false =  not in use
        },

        PierceTyre = {
            Command = 'piercetyre',
            Control = '',  -- Controls list:  https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
            Suggestion = 'Pierce the tyre'
        },

        Knockout = {
            Command = 'knockout',
            Control = '',  -- Controls list:  https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
            Suggestion = 'Knockout player'
        },

        PullPlayer = {
            Command = 'pull',
            Control = '',  -- Controls list:  https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
            Suggestion = 'Pull player',
            Item = {'', true, true} -- item name | leave it empty to not use any item, like this: '', remove it when put on head or not, give it when removed from head or not
        },

        HandCuff = {
            Command = 'cuff',
            Control = '',  -- Controls list:  https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
            Suggestion = 'To cuff a player faster',
            Item = {'', true, true} -- item name | leave it empty to not use any item, like this: '', remove it when put on head or not, give it when removed from head or not
        },
    },

    -----------------------------------------------------------
    -----------------------| TRANSLATE |-----------------------
    -----------------------------------------------------------

    Locales = {
        Bag = 'Bag',
        BagDescription = 'Quickly subdue players by placing a bag over their head.',
        Hostage = 'Hostage',
        HostageDescription = 'Take control of the situation by holding a player hostage.',
        PutInVehicle = 'Pick up',
        PutInVehicleDescription = 'Securely place the player in the trunk to transport them.',
        Tyre = 'Slash tyre',
        TyreDescription = 'Disable vehicles by slashing the tire, leaving them stranded.',
        Knockout = 'Knockout',
        KnockoutDescription = 'Knock out players with a swift hit, rendering them unconscious.',
        Pull = 'Pull',
        PullDescription = 'Drag players by a rope tied to their leg, immobilizing them.',
        Cuff = 'Cuff',
        CuffDescription = 'Restrict player movement by cuffing their hands behind their back.',
    },
    
    -- Notify function EDITABLE >> cl_utils.lua
    Notify = { 
        [1] = {"Gang Actios", "There is no player nearby", 5000, "error"},
        [2] = {"Gang Actios", "You need the right weapon", 5000, "error"},
        [3] = {"Gang Actios", "There is no vehicle nearby", 5000, "error"},
        [4] = {"Gang Actios", "The tyre is already slashed", 5000, "error"},
        [5] = {"Gang Actios", "Your hands are not free", 5000, "error"},
        [6] = {"Gang Actios", "This is not a right vehicle for this", 5000, "error"},
        [7] = {"Gang Actios", "Your job is not allove this", 5000, "error"},
        [8] = {"Gang Actios", "You don't have the right item", 5000, "error"},
        [9] = {"Gang Actios", "You have to wait a little", 5000, "error"},
    },
    
}
