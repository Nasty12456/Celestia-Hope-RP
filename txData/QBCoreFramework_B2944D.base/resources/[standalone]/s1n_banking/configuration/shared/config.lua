Config = Config or { }

-- To modify the loaded language file, go to the fxmanifest.lua file an replace `english.lua` with the name of the language file you want to use.

-- Set to true to show debug messages in the console
Config.debugMode = true

-- You need to verify that the following scripts are exactly named like this or change the names here
Config.ExportNames = {
    -- FOR QBCore ONLY
    qbManagement = "qb-management",
    qbTarget     = "qb-target",
    qbBanking    = "qb-banking",

    -- For both ESX and QBCore
    oxTarget     = "ox_target",

    -- Dependencies
    s1nLib       = "s1n_lib"
}

-- List of all the available keys : https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/
Config.Keys = {
    -- If you're not using a target script, you can set the key to open the bank menu here
    OpenUI = {
        -- Refer to the first comment to see the list of all the available keys
        Key         = "E",
        -- Distance from the location position (if it's a bank) otherwise from the ATM position
        UseDistance = 1.0
    }
}

-- Set to false if you don't want to use ox-target
Config.UseOxTarget = false

-- Set to true if you want to use qb-target
Config.UseQBTarget = false

-- Set to true to enable the bank card item feature
Config.CreditCardCheck = false

-- <!> THIS FEATURE IS STILL IN DEVELOPMENT, NOT FONCTIONNAL YET <!>
-- CreditCardCheck needs to be set to true to use this feature
Config.CreditCardGive = {
    -- Set to true to give the player a bank card when they create a bank account if they don't have one
    OnCreate = true
}

-- If CreditCardCheck is set to true, this is the name of the item that will be used to check if the player has a bank card
Config.CreditCardItem = "creditcard"

-- List of the ATM models that will be used to open the bank menu
Config.AtmModels = { 'prop_atm_02', 'prop_atm_03', 'prop_fleeca_atm' }

-- List of the bank locations that will be used to open the bank menu
Config.BankLocations = {
    -- First bank
    {
        -- The position of the blip and marker (where you interact)
        Position = vector3(-1212.685669, -330.764832, 37.772217),
        -- Managing the bank blip
        Blip     = {
            -- Set to false to disable the blip
            Active     = true,
            -- The sprite ID of the blip (https://docs.fivem.net/docs/game-references/blips/)
            Sprite     = 108,
            -- The color ID of the blip (https://docs.fivem.net/docs/game-references/blips/)
            Color      = 2,
            -- The scale of the blip
            Scale      = 1.0,
            -- The name of the blip
            Label      = "Bank",
            -- Sets whether or not the blip should only be displayed when nearby, or on the minimap.
            ShortRange = true
        },
        -- Managing the bank marker
        Marker   = {
            -- Set to false to disable the marker
            Active       = true,
            Distance     = 1.0,
            Type         = 2,
            Rotation     = { 0.0, 180.0, 0.0 },
            Scale        = 0.4,
            Color        = { R = 222, G = 186, B = 77, A = 255 },
            BobUpAndDown = true,
            FaceCamera   = true,
        },
        -- Managing the bank ped
        Ped      = {
            -- Set to true to show a ped
            Active   = false,
            -- The model of the ped (https://docs.fivem.net/docs/game-references/ped-models/)
            Model    = "a_m_m_indian_01",
            -- The position of the ped
            Position = vector3(-1212.07, -332.02, 37.78 - 1.0),
            -- The heading of the ped
            Heading  = 24.0
        }
    },
    -- Second bank (EXAMPLE)
    {
        -- The position of the blip and marker (where you interact)
        Position = vector3(-1412.685669, -330.764832, 37.772217),
        -- Managing the bank blip
        Blip     = {
            -- Set to false to disable the blip
            Active     = true,
            -- The sprite ID of the blip (https://docs.fivem.net/docs/game-references/blips/)
            Sprite     = 108,
            -- The color ID of the blip (https://docs.fivem.net/docs/game-references/blips/)
            Color      = 2,
            -- The scale of the blip
            Scale      = 1.0,
            -- The name of the blip
            Label      = "Bank",
            -- Sets whether or not the blip should only be displayed when nearby, or on the minimap.
            ShortRange = true
        },
        -- Managing the bank marker
        Marker   = {
            -- Set to false to disable the marker
            Active       = true,
            Distance     = 1.0,
            Type         = 2,
            Rotation     = { 0.0, 180.0, 0.0 },
            Scale        = 0.4,
            Color        = { R = 222, G = 186, B = 77, A = 255 },
            BobUpAndDown = true,
            FaceCamera   = true,
        },
        -- Managing the bank ped
        Ped      = {
            -- Set to true to show a ped
            Active   = false,
            -- The model of the ped (https://docs.fivem.net/docs/game-references/ped-models/)
            Model    = "a_m_m_indian_01",
            -- The position of the ped
            Position = vector3(-1212.07, -332.02, 37.78 - 1.0),
            -- The heading of the ped
            Heading  = 24.0
        }
    },
    -- Third bank (EXAMPLE)
    {
        -- The position of the blip and marker (where you interact)
        Position = vector3(314.23, -279.17, 54.16),
        -- Managing the bank blip
        Blip     = {
            -- Set to false to disable the blip
            Active     = true,
            -- The sprite ID of the blip (https://docs.fivem.net/docs/game-references/blips/)
            Sprite     = 108,
            -- The color ID of the blip (https://docs.fivem.net/docs/game-references/blips/)
            Color      = 2,
            -- The scale of the blip
            Scale      = 1.0,
            -- The name of the blip
            Label      = "Bank",
            -- Sets whether or not the blip should only be displayed when nearby, or on the minimap.
            ShortRange = true
        },
        -- Managing the bank marker
        Marker   = {
            -- Set to false to disable the marker
            Active       = true,
            Distance     = 1.0,
            Type         = 2,
            Rotation     = { 0.0, 180.0, 0.0 },
            Scale        = 0.4,
            Color        = { R = 222, G = 186, B = 77, A = 255 },
            BobUpAndDown = true,
            FaceCamera   = true,
        },
        -- Managing the bank ped
        Ped      = {
            -- Set to true to show a ped
            Active   = false,
            -- The model of the ped (https://docs.fivem.net/docs/game-references/ped-models/)
            Model    = "a_m_m_indian_01",
            -- The position of the ped
            Position = vector3(-1212.07, -332.02, 37.78 - 1.0),
            -- The heading of the ped
            Heading  = 24.0
        }
    },
    -- Fourth bank (EXAMPLE)
    {
        -- The position of the blip and marker (where you interact)
        Position = vector3(-2962.53, 482.97, 15.7),
        -- Managing the bank blip
        Blip     = {
            -- Set to false to disable the blip
            Active     = true,
            -- The sprite ID of the blip (https://docs.fivem.net/docs/game-references/blips/)
            Sprite     = 108,
            -- The color ID of the blip (https://docs.fivem.net/docs/game-references/blips/)
            Color      = 2,
            -- The scale of the blip
            Scale      = 1.0,
            -- The name of the blip
            Label      = "Bank",
            -- Sets whether or not the blip should only be displayed when nearby, or on the minimap.
            ShortRange = true
        },
        -- Managing the bank marker
        Marker   = {
            -- Set to false to disable the marker
            Active       = true,
            Distance     = 1.0,
            Type         = 2,
            Rotation     = { 0.0, 180.0, 0.0 },
            Scale        = 0.4,
            Color        = { R = 222, G = 186, B = 77, A = 255 },
            BobUpAndDown = true,
            FaceCamera   = true,
        },
        -- Managing the bank ped
        Ped      = {
            -- Set to true to show a ped
            Active   = false,
            -- The model of the ped (https://docs.fivem.net/docs/game-references/ped-models/)
            Model    = "a_m_m_indian_01",
            -- The position of the ped
            Position = vector3(-1212.07, -332.02, 37.78 - 1.0),
            -- The heading of the ped
            Heading  = 24.0
        }
    },
    -- Fifth bank (EXAMPLE)
    {
        -- The position of the blip and marker (where you interact)
        Position = vector3(1174.94, 2706.84, 38.09),
        -- Managing the bank blip
        Blip     = {
            -- Set to false to disable the blip
            Active     = true,
            -- The sprite ID of the blip (https://docs.fivem.net/docs/game-references/blips/)
            Sprite     = 108,
            -- The color ID of the blip (https://docs.fivem.net/docs/game-references/blips/)
            Color      = 2,
            -- The scale of the blip
            Scale      = 1.0,
            -- The name of the blip
            Label      = "Bank",
            -- Sets whether or not the blip should only be displayed when nearby, or on the minimap.
            ShortRange = true
        },
        -- Managing the bank marker
        Marker   = {
            -- Set to false to disable the marker
            Active       = true,
            Distance     = 1.0,
            Type         = 2,
            Rotation     = { 0.0, 180.0, 0.0 },
            Scale        = 0.4,
            Color        = { R = 222, G = 186, B = 77, A = 255 },
            BobUpAndDown = true,
            FaceCamera   = true,
        },
        -- Managing the bank ped
        Ped      = {
            -- Set to true to show a ped
            Active   = false,
            -- The model of the ped (https://docs.fivem.net/docs/game-references/ped-models/)
            Model    = "a_m_m_indian_01",
            -- The position of the ped
            Position = vector3(-1212.07, -332.02, 37.78 - 1.0),
            -- The heading of the ped
            Heading  = 24.0
        }
    },
    -- Sixth bank (EXAMPLE)
    {
        -- The position of the blip and marker (where you interact)
        Position = vector3(-113.16, 6470.27, 31.63),
        -- Managing the bank blip
        Blip     = {
            -- Set to false to disable the blip
            Active     = true,
            -- The sprite ID of the blip (https://docs.fivem.net/docs/game-references/blips/)
            Sprite     = 108,
            -- The color ID of the blip (https://docs.fivem.net/docs/game-references/blips/)
            Color      = 2,
            -- The scale of the blip
            Scale      = 1.0,
            -- The name of the blip
            Label      = "Bank",
            -- Sets whether or not the blip should only be displayed when nearby, or on the minimap.
            ShortRange = true
        },
        -- Managing the bank marker
        Marker   = {
            -- Set to false to disable the marker
            Active       = true,
            Distance     = 1.0,
            Type         = 2,
            Rotation     = { 0.0, 180.0, 0.0 },
            Scale        = 0.4,
            Color        = { R = 222, G = 186, B = 77, A = 255 },
            BobUpAndDown = true,
            FaceCamera   = true,
        },
        -- Managing the bank ped
        Ped      = {
            -- Set to true to show a ped
            Active   = false,
            -- The model of the ped (https://docs.fivem.net/docs/game-references/ped-models/)
            Model    = "a_m_m_indian_01",
            -- The position of the ped
            Position = vector3(-1212.07, -332.02, 37.78 - 1.0),
            -- The heading of the ped
            Heading  = 24.0
        }
    }
}

-- Credit feature
Config.Credit = {
    -- Set to false to disable the credit feature
    Active          = false,
    -- Default amounts that can be directly selected in the menu
    Amounts         = { 20000, 30000, 40000, 50000, 60000, 70000, 80000, 90000, 100000 },
    -- Percentage of the loan that will be required as a security deposit
    SecurityDeposit = 25,
    -- Different credit durations that can be selected in the menu
    Duration        = {
        { Label = "1 week", Time = 60 * 60 * 24 * 7 },
        { Label = "2 weeks", Time = 60 * 60 * 24 * 14 },
        { Label = "1 month", Time = 60 * 60 * 24 * 30 },
        { Label = "3 months", Time = 60 * 60 * 24 * 90 }
    },
}

-- Configuration to access a society account
Config.SocietyRanks = {
    -- Job name (Needs to be the EXACT name of the job IN LOWERCASE !)
    ["police"] = {
        -- Job grades (Needs to be the EXACT name of the job grade IN LOWERCASE !)
        -- Create: Set to true to allow the player to create a society account
        -- Login: Set to true to allow the player to access the society account (if the account is already created)
        ["chief"]      = { Create = true, Login = true },
        ["boss"]       = { Create = true, Login = true },
        ["lieutenant"] = { Create = false, Login = true },
        ["sergeant"]   = { Create = false, Login = true }
    }
}

-- IBAN prefix added to the IBAN when creating a new account
Config.IbanPrefix = "US0"

Config.Timeouts = {
    -- The time in milliseconds after which the player won't be able to accept a shared account invite sent by another player
    AcceptSharedAccountInvite = 2 * 60 * 1000
}

-- The maximum amount that can be deposited, transferred or withdrawn in a single transaction
Config.MaxAmountPerTransaction = 10000000

Config.ChangeIban = {
    -- The price to change the IBAN
    Price = 5000
}