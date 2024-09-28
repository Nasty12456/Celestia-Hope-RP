Config = {
    Core = 'QBCORE',  -- ESX / QBCORE | Other core setting on the 'core' folder and the client and server utils.lua
    BrutalNotify = true, -- Buy here: (4€+VAT) https://store.brutalscripts.com | Or set up your own notify >> cl_utils.lua
    CopsJobs = {'police', 'fbi'}, -- Add the cops jobs
    RequiredCopsCount = 0, -- This is how many cops are needed to be in the server to start a robbery
    GiveBlackMoney = true, -- true / false | ONLY IN ESX
    Cooldown = 0, -- The time between robberies | in minutes

    PoliceAlertBlip = {label = 'Truck Robbery', size = 1.0, sprite = 161, color = 1},
    TruckBlip = {label = 'Truck', size = 1.0, sprite = 85, color = 43},
    CollectableBlip = {label = 'Collectable', size = 0.7, sprite = 568, colour = 2},
    EnemyBlip = {label = 'NPC', size = 0.7, sprite = 270, colour = 1},
    
    BossModel = 'a_m_y_soucent_02',
    BossCoords = vector4(257.4908, -1722.8832, 29.6541, 317.6606),

    EnemyCount = 10,
    EnemiesModel = "a_m_m_soucent_03",
    EnemiesCoords = vector4(-556.6471, -1798.4000, 22.5874, 329.6938),

    Trucks = {
        [1] = {
            truckSpawn = vector4(-151.5961, -1920.3593, 24.7167, 45.3662),
            destination = vector3(130.6463, -1063.3026, 29.1924),
        },
    },

    TruckRewardItems = {
        {label = 'Gold', item = 'gold', count = {5, 10}, sellPrice = 1000},
        {label = 'Diamond', item = 'diamond', count = {5, 10}, sellPrice = 2000},
    },

    ItemsSellToBoss = {
        use = true, -- Use item sell functions? | you can use your custom too
        availableTime = 30, -- in minutes [That's how long the player have to deliver the items after the robbery]
        coords = vector4(-1233.7051, -1428.0791, 3.3256, 37.4345), -- Sell coords
        model = 'a_m_m_eastsa_01', -- Sell NPC model
        blip = {use = true, label = 'Items Sell', size = 0.9, sprite = 500, color = 2} -- Sell Blip
    },
    
    -----------------------------------------------------------
    -----------------------| TRANSLATE |-----------------------
    -----------------------------------------------------------

    MoneyForm = '$',
    SecondForm = 'second',
    GrabMoney = 'Grabbing money',

    HelpNotify = {
        [1] = {'Press ~INPUT_PICKUP~ to speak with the Boss', 38},
        [2] = {'Press ~INPUT_PICKUP~ to place the dinamite', 38},
        [3] = {'Press ~INPUT_PICKUP~ to loot out the truck.', 38},
        [4] = {'Hold [G] to bail out', 47},
        [5] = {'Press ~INPUT_PICKUP~ to pick up the papers.', 38},
        [6] = {'Press ~INPUT_PICKUP~ to sell the items', 38},
    },

    Notify = {
        [1] =  {'Notification', "Hacking: FAILED!", 5000, 'error'},
        [2] =  {'Notification', "Hacking: SUCCESSFUL!", 5000, 'success'},
        [3] =  {'Notification', "Hacking: TIME OUT!", 5000, 'error'},
        [4] =  {'Notification', "There is already a robbery in progress.", 5000, 'error'},
        [5] =  {'Notification', "There was a robbery a while ago, please wait!", 5000, 'error'},
        [6] =  {'Notification', "Not enough cops in the City!", 5000, 'error'},
        [7] =  {'Notification', "Robbery failed: The truck has arrived!", 5000, 'error'},
        [8] =  {'Notification', "You cant rob a vehicle that is moving.", 5000, 'error'},
        [9] =  {'Notification', "Put the gun away!", 5000, 'error'},
        [10] =  {'Notification', "Time's up! The Boss has left!", 5000, 'error'},
        [11] =  {'Notification', "You have nothing useful!", 5000, 'error'},
        [12] =  {'Notification', "You sold:", 8000, 'success'},
        [13] =  {'Notification', "You got:", 5000, 'success'},
    },

    InstructionTexts = {
        [1] = {'Go to the coords and steal the tablet to get the coords of the money carrier.'},
        [2] = {'Go to the back of the truck and blow the doors off!'},
        [3] = {'The truck is marked on the map! Rob it!'},
        [4] = {'Sell the items in the designated place!'},
    },

    SuccessRobbery = {
        Use = true,
        missionTextLabel = "~y~TRUCK ROBBERY~s~", 
        passFailTextLabel = "COMPLETED.",
        messageLabel = "Run away from the police.",
        
        totalPayOut = "Total Payout",
    },

    FailedRobbery = {
        Use = true,
        missionTextLabel = "~y~TRUCK ROBBERY~s~", 
        passFailTextLabel = "FAILED.",
        messageLabel = "This time it failed."
    },

    IdentifierType = 'steam',  -- steam / license / discord
    Webhooks = {
        Locale = {
            ['robberyProcess'] = '⌛ Robbery started...',
            ['robberyFinished'] = '✅ Robbery finished.',

            ['HasStarted'] = 'started the Truck Robbery!',
            ['HasFinished'] = 'finished the Truck Robbery!',
            ['RobberHasQuit'] = '**The robber has quit the game!\nThe robbery is finished!**',

            ['Identifier'] = 'Identifier',
            ['Time'] = 'Time ⏲️'
        },

        -- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html
        Colors = {
            ['robberyProcess'] = 3145631, 
            ['robberyFinished'] = 16711680
        }
    },


} 

Config.BrutalNotify = false

-- QBCore#4011 V9 -- Discord.gg/qbcoreframework