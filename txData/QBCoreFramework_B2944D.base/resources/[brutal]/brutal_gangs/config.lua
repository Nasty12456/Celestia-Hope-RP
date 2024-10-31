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
    Inventory = 'qb_inventory', -- 'ox_inventory' / 'qb_inventory' / 'quasar_inventory' / 'chezza_inventory' / 'codem_inventory' / 'core_inventory' // Custom can be add in the cl_utils.lua!!!
    TextUI = 'ox_lib', -- false / 'brutal_textui' / 'ox_lib' / 'okokTextUI' / 'ESXTextUI' / 'QBDrawText' // Custom can be add in the cl_utils.lua!!!
    Target = 'qb-target', -- 'oxtarget' / 'qb-target' // if the TextUI is set to false target will step its place 
    BrutalNotify = true, -- Buy here: (4€+VAT) https://store.brutalscripts.com | Or set up your own notify >> cl_utils.lua
    SteamName = false, -- true = Steam name | false = character name
    DateFormat = '%d/%m/%Y', -- Date format

    UnemployedJob = "unemployed",
    HQBlip = {use = true, sprite = 40, color = 32, size = 0.8},
    Marker = {marker = 20, bobUpAndDown = true, rotate = false, size = {0.3, 0.2, 0.2}, rgb = {15, 100, 210}},

    Commands = {
        GangMenu = {
            Command = 'gangmenu', 
            Suggestion = 'To open the gang menu'
        },

        GetGangVehicleBack = {
            Command = 'getgangvehicleback', --  /getgangvehicleback all | /getgangvehicleback DHR 432
            Suggestion = 'To get back your vehicle(s)'
        },

        CreateGraffiti = {
            Command = 'graffiti',
            Suggestion = 'To create a new graffiti',
            Item = "spraycan"
        },

        CleanGraffiti = {
            Command = 'cleangraffiti',
            Suggestion = 'To clean a graffiti',
            Item = "sprayremover"
        },

        -- Admin commands

        EditGangs = {
            AdminGroups = {'superadmin', 'admin', 'mod', 'god'},
            Command = 'editgangs', 
            Suggestion = 'To edit the gangs'
        },

        SetGangLeader = {
            AdminGroups = {'superadmin', 'admin', 'mod', 'god'},
            Command = 'setgangleader', 
            Suggestion = 'To set up the gang leader'
        },
    },

    Levels = {
        [0] = {
            maxMembersCount = 6,

            vehicles = {amount = 6, price = nil},
            stash = {size = 100, price = nil},
            ranks = {amount = 3, price = nil},
            raid = {available = false, price = nil},
        },

        [1] = {
            price = {money = 50000, rep = 3750},
            maxMembersCount = 12,

            vehicles = {amount = 18, price = {money = 15000, rep = 525}},
            stash = {size = 200, price = {money = 5000, rep = 175}},
            safe = {available = true, size = 20, price = {money = 25000, rep = 875}},
            ranks = {amount = 6, price = {money = 0, rep = 650}},
            raid = {available = false, price = nil},
        },

        [2] = {
            price = {money = 150000, rep = 11250},
            maxMembersCount = 18,

            vehicles = {amount = 30, price = {money = 15000, rep = 525}},
            stash = {size = 300, price = {money = 5000, rep = 175}},
            safe = {available = true, size = 30, price = {money = 3000, rep = 105}},
            ranks = {amount = 9, price = {money = 0, rep = 650}},
            raid = {available = true, price = {money = 25000, rep = 875}},
        },

        [3] = {
            price = {money = 250000, rep = 18750},
            maxMembersCount = 24,

            vehicles = {amount = 48, price = {money = 15000, rep = 525}},
            stash = {size = 400, price = {money = 5000, rep = 175}},
            safe = {available = true, size = 40, price = {money = 3000, rep = 105}},
            ranks = {amount = 12, price = {money = 0, rep = 650}},
            raid = {available = true, price = {money = 25000, rep = 875}},
        },
    },

    HQS = {
        ["ballas"] = {
            MapPosition = {
                vector2(-36.8547, -1753.4171),
                vector2(-61.3669, -1785.3739),
                vector2(-21.2381, -1821.4756),
                vector2(-50.6818, -1858.8644),
                vector2(29.3174, -1930.7737),
                vector2(86.4986, -1860.3062),
            },

            MiddlePoint = vector3(7.7007, -1816.5464, 25.3697),
            HQCanBeCaptured = true,

            DefaultCoords = {
                Cloakrooms = {
                    vector3(0.7138, -1819.6553, 29.1527),
                },
    
                Stashes = {
                    vector3(2.5605, -1817.7943, 29.1526),
                },

                BalanceManages = {
                    vector3(-0.4499, -1809.0541, 29.1527),
                },

                Garages = {
                    {
                        open = vector3(11.8271, -1817.3561, 25.2843),
                        spawn = vector4(13.5363, -1820.2806, 24.7847, 143.9035)
                    },
                },
            },
        },

        ["triads"] = {
            MapPosition = {
                vector2(-641.1872, -1268.0148),
                vector2(-568.8250, -1197.5732),
                vector2(-548.0913, -1102.7590),
                vector2(-552.4677, -966.7898),
                vector2(-624.6595, -969.4564),
                vector2(-636.4352, -1035.5703),
                vector2(-666.9618, -1072.7643),
                vector2(-749.0092, -1121.3713),
            },

            MiddlePoint = vector3(-641.7220, -1234.5129, 11.5514),
            HQCanBeCaptured = true,

            DefaultCoords = {
                Cloakrooms = {
                    vector3(-648.8576, -1229.3621, 11.5516),
                },
    
                Stashes = {
                    vector3(-652.6179, -1230.2782, 11.5516),
                },

                BalanceManages = {
                    vector3(-644.4189, -1244.2264, 11.5516),
                },

                Garages = {
                    {
                        open = vector3(-645.2076, -1221.4576, 11.0470),
                        spawn = vector4(-644.1460, -1217.9924, 10.8716, 303.2067)
                    },
                },
            },
        },

        ["vagos"] = {
            MapPosition = {
                vector2(326.2715, -2140.4065),
                vector2(248.8809, -2071.6580),
                vector2(355.7063, -1947.0470),
                vector2(427.0373, -2020.0443),
            },

            MiddlePoint = vector3(338.9244, -2042.7440, 21.2988),
            HQCanBeCaptured = true,

            DefaultCoords = {
                Cloakrooms = {
                    vector3(325.5719, -1999.3409, 24.2077),
                },
    
                Stashes = {
                    vector3(329.4389, -1998.6117, 24.2077),
                },

                BalanceManages = {
                    vector3(338.2400, -1979.8922, 24.2078),
                },

                Garages = {
                    {
                        open = vector3(323.1876, -2017.5780, 21.2353),
                        spawn = vector4(321.0982, -2021.5391, 20.3820, 141.2121)
                    },
                },
            },
        },

        ["lostmc"] = {
            MapPosition = {
                vector2(931.9505, -122.5973),
                vector2(986.2697, -156.0796),
                vector2(1022.2856, -119.8539),
                vector2(980.7446, -76.5461),
            },

            MiddlePoint = vector3(969.5955, -126.4073, 74.3605),
            HQCanBeCaptured = true,

            DefaultCoords = {
                Cloakrooms = {
                    vector3(971.9257, -98.7307, 74.8464),
                },
    
                Stashes = {
                    vector3(986.6417, -92.7903, 74.8459),
                },

                BalanceManages = {
                    vector3(976.9885, -103.8749, 74.8452),
                },

                Garages = {
                    {
                        open = vector3(960.9912, -123.2064, 74.3532),
                        spawn = vector4(961.9102, -125.5999, 74.0335, 134.2543)
                    },
                },
            },
        },

        ["families"] = {
            MapPosition = {
                vector2(-181.5696, -1765.1079),
                vector2(-49.3258, -1607.2705),
                vector2(-252.9951, -1444.2129),
                vector2(-274.8223, -1535.6073),
                vector2(-340.4381, -1653.6207),
                vector2(-252.6444, -1706.5421),
            },
            
            MiddlePoint = vector3(-194.6743, -1606.9457, 34.0031),
            HQCanBeCaptured = true,

            DefaultCoords = {
                Cloakrooms = {
                    vector3(-162.5451, -1612.9545, 33.6494),
                },
    
                Stashes = {
                    vector3(-164.0853, -1607.2548, 33.6494),
                },

                BalanceManages = {
                    vector3(-163.7477, -1619.0095, 33.6494),
                },

                Garages = {
                    {
                        open = vector3(-142.5249, -1631.2947, 32.9337),
                        spawn = vector4(-138.1050, -1634.1799, 31.8673, 321.9159)
                    },
                },
            },
        },

        ["angels"] = {
            MapPosition = {
                vector2(1186.1561, -1819.9590),
                vector2(1401.5608, -1750.3341),
                vector2(1377.2861, -1690.7479),
                vector2(1275.9623, -1539.6001),
                vector2(1175.1179, -1611.6343),
                vector2(1112.2068, -1621.6501),
            },
            
            MiddlePoint = vector3(1252.8992, -1676.1508, 44.0245),
            HQCanBeCaptured = true,

            DefaultCoords = {
                Cloakrooms = {
                    vector3(1272.4738, -1714.6812, 54.7714),
                },
    
                Stashes = {
                    vector3(1268.7084, -1710.2638, 54.7714),
                },

                BalanceManages = {
                    vector3(1275.4862, -1710.6750, 54.7714),
                },

                Garages = {
                    {
                        open = vector3(1286.8423, -1726.0486, 53.0865),
                        spawn = vector4(1287.5776, -1728.0398, 52.8059, 114.7845)
                    },
                },
            },
        },
    },

    Scout = {
        MaximumTime = 15, -- in minutes
        MinimumOnlineMembers = 1, -- minimum members online to start
    },

    Raid = {
        Price = {money = 15000, rep = 1750},
        MaximumTime = 30, -- in minutes
        MinimumOnlineMembers = 1, -- minimum members online to start
        CooldownAfterDeath = 10, -- in minutes
        StashLooting = {use = true, time = 5}, -- use: true / false | time = 1 = 1min
        Limit = 72, -- in hours
    },

    Graffiti = {
        ShowDistance = 100.0,

        MinDistances = 10.0,
        MaxGraffitiPerGang = 25,

        LimitPerMember = 10, -- in minutes
        CleanLimitPerMember = 10, -- in minutes

        PlaceReputation = 50,
        CleanReputation = 25,

        BlacklistedZones = {
            {coords = vector3(455.81, -997.04, 43.69), radius = 200.0}, -- Police
            {coords = vector3(324.76, -585.72, 59.15), radius = 100.0}, -- Hospital
            {coords = vector3(-376.73, -119.47, 40.73), radius = 100.0}, -- Mechanic
        },

        Icons = {
            {name = "Vagos", prop = "sprays_vagos", png = "Vagos.png"},
            {name = "The Mandnem", prop = "sprays_mandem", png = "The_Mandnem.png"},
            {name = "The Guild", prop = "sprays_guild", png = "The_Guild.png"},
            {name = "Street Team", prop = "sprays_st", png = "Street_Team.png"},
            {name = "Seaside", prop = "sprays_seaside", png = "Seaside.png"},
            {name = "SCU", prop = "sprays_scu", png = "SCU.png"},
            {name = "Rust", prop = "sprays_rust", png = "Rust.png"},
            {name = "Ron", prop = "sprays_ron", png = "Ron.png"},
            {name = "Ramee", prop = "sprays_ramee", png = "Ramee.png"},
            {name = "NBC", prop = "sprays_nbc", png = "NBC.png"},
            {name = "Mayhem", prop = "sprays_mayhem", png = "Mayhem.png"},
            {name = "Lost MC", prop = "sprays_lost", png = "Lost_MC.png"},
            {name = "Kingz", prop = "sprays_kingz", png = "Kingz.png"},
            {name = "Hydra", prop = "sprays_hydra", png = "Hydra.png"},
            {name = "Hoa", prop = "sprays_hoa", png = "Hoa.png"},
            {name = "Gulag Gang", prop = "sprays_gg", png = "Gulag_Gang.png"},
            {name = "GSF", prop = "sprays_gsf", png = "GSF.png"},
            {name = "Chang Gang", prop = "sprays_cg", png = "Chang_Gang.png"},
            {name = "Cerberus", prop = "sprays_cerberus", png = "Cerberus.png"},
            {name = "BSK", prop = "sprays_bsk", png = "BSK.png"},
            {name = "Bondi Boys MC", prop = "sprays_bcf", png = "Bondi_Boys_Mc.png"},
            {name = "BCF", prop = "sprays_bcf", png = "BCF.png"},
            {name = "Ballas", prop = "sprays_ballas", png = "Ballas.png"},
            {name = "Angels", prop = "sprays_angels", png = "Angels.png"},
        },
    },

    Tasks = {
        ["drug"] = {
            Label = "NARCOTICS HEIST",
            Description = "In the Narcotics Heist, steal a drug shipment from a cartel and sell it before they catch you.",
            TimeToCompletion = 20, -- in minutes
            TimeToRestart = 1440, -- in minutes
            Reward = {money = {min = 5000, max = 20000}, rep = {min = 250, max = 1000}},

            VanPosition = {
                {
                    Van = vector4(-463.3471, -63.0104, 44.2518, 218.4606),
                    Guards = {
                        {model = "g_m_y_korean_02", coords = vector4(-459.7697, -62.7800, 44.5134, 42.0405), weapon = "WEAPON_ASSAULTRIFLE"},
                        {model = "g_m_y_korean_01", coords = vector4(-468.8365, -62.5431, 44.5134, 345.1089), weapon = "WEAPON_ASSAULTRIFLE"},
                        {model = "g_m_y_mexgoon_03", coords = vector4(-459.6652, -56.9242, 44.5134, 75.7623), weapon = "WEAPON_ASSAULTRIFLE"},
                    },
                },

                {
                    Van = vector4(155.0316, -1233.0797, 28.9633, 254.9915),
                    Guards = {
                        {model = "g_m_y_korean_02", coords = vector4(149.0482, -1230.9833, 29.1985, 223.3919), weapon = "WEAPON_ASSAULTRIFLE"},
                        {model = "g_m_y_korean_01", coords = vector4(147.3018, -1232.9353, 29.1985, 250.9159), weapon = "WEAPON_ASSAULTRIFLE"},
                        {model = "g_m_y_mexgoon_03", coords = vector4(146.1674, -1235.1293, 29.1985, 255.9488), weapon = "WEAPON_ASSAULTRIFLE"},
                    },
                },
            },
            EndingPoint = {
                {
                    MainCoords = vector3(1162.4951, -1496.4705, 34.4312), 
                    CustomersVehicle = vector4(1158.1821, -1490.3347, 34.4314, 2.1476),
                    Customers = {
                        {model = "g_m_y_mexgoon_03", coords = vector4(1156.4387, -1493.8158, 33.6925, 239.6427)},
                        {model = "g_m_y_mexgang_01", coords = vector4(1159.7421, -1493.9291, 33.6925, 142.1639)},
                    },
                },

                {
                    MainCoords = vector3(676.3511, -2648.5149, 5.8198), 
                    CustomersVehicle = vector4(668.6371, -2655.3589, 5.8093, 152.9441),
                    Customers = {
                        {model = "g_m_y_mexgoon_03", coords = vector4(671.9014, -2653.2356, 5.0812, 15.0290)},
                        {model = "g_m_y_mexgang_01", coords = vector4(668.8821, -2651.4241, 5.0812, 286.6457)},
                    },
                },
            }
        },

        ["disposalofthebody"] = {
            Label = "BODY DISPOSAL",
            Description = "You must discreetly get rid of evidence by disposing of a body without leaving any trace for law enforcement.",
            TimeToCompletion = 20, -- in minutes
            TimeToRestart = 1440, -- in minutes
            Reward = {money = {min = 10000, max = 15000}, rep = {min = 500, max = 800}},

            VanPosition = {
                {coords = vector4(679.8264, 68.4786, 83.2498, 182.2196)},
            },
            DeadBodyPosition = {
                {coords = vector3(-1077.0720, 712.9972, 163.4137), heading = 127.0},
            },
            EndingPoint = {
                {
                    MainCoords = vector3(67.0433, -2755.7847, 6.0046), 
                    Boat = {model = 'tropic', coords = vector4(8.6673, -2797.2100, 0.2756, 181.5510)},
                    ThrowPoint = vector3(-250.7096, -4219.0371, -3.2772),
                },
            }
        },

        ["homeless"] = {
            Label = "HOMELESS KIDNAPPING",
            Description = "You must abduct a target from the streets without drawing attention from bystanders or authorities.",
            TimeToCompletion = 20, -- in minutes
            TimeToRestart = 1440, -- in minutes
            Reward = {money = {min = 6000, max = 12000}, rep = {min = 450, max = 1350}},

            HomelessPedPosition = {
                {coords = vector3(18.5995, -1228.6848, 28.4795), heading = 280.0},
                {coords = vector3(357.6796, -835.1513, 28.2916), heading = 176.0},
                {coords = vector3(-517.6873, -865.7912, 28.5060), heading = 280.0},
            },
            EndingPoint = {
                {
                    MainCoords = vector3(1377.6155, -747.5517, 66.47), 
                    CustomersVehicle = {model = 'dubsta2', coords = vector4(1386.2517, -742.9697, 67.2858, 339.2372)},
                    Customers = {
                        {model = "g_m_y_mexgang_01", coords = vector4(1387.3867, -745.9840, 66.1903, 90.7682)},
                        {model = "g_m_y_mexgoon_03", coords = vector4(1383.4774, -744.2767, 66.1852, 151.0328)},
                    },
                },

                {
                    MainCoords = vector3(-1157.2125, -1454.5078, 3.4823), 
                    CustomersVehicle = {model = 'dubsta2', coords = vector4(-1155.9701, -1462.3113, 4.3237, 125.4273)},
                    Customers = {
                        {model = "g_m_y_mexgoon_03", coords = vector4(-1151.7054, -1462.2007, 3.4187, 20.5159)},
                        {model = "g_m_y_mexgang_01", coords = vector4(-1156.8384, -1460.3912, 3.3861, 311.5188)},
                    },
                },
            }
        },

        ["assassination"] = {
            Label = "ASSASSINATION CONTRACT",
            Description = "You must eliminate a high-value target quickly and discreetly, leaving no witnesses behind.",
            TimeToCompletion = 20, -- in minutes
            TimeToRestart = 1440, -- in minutes
            Reward = {money = {min = 7500, max = 30000}, rep = {min = 250, max = 1150}},

            TargetPedPosition = {
                {startcoords = vector3(-332.3789, -672.7446, 32.3814), finishcoords = vector3(304.8678, -740.3984, 29.3166)},
                {startcoords = vector3(553.8753, 152.7980, 99.2896), finishcoords = vector3(-239.1566, 244.2611, 92.0406)},
                {startcoords = vector3(-1274.0237, 315.4701, 65.5117), finishcoords = vector3(-1392.7247, -299.2366, 43.6122)},
            },
            EndingPoint = {
                {
                    MainCoords = vector3(265.9774, 3178.4739, 41.6437), 
                    Customers = {
                        {model = "g_m_y_mexgoon_03", coords = vector4(260.6587, 3178.2278, 41.7484, 283.4235)},
                    },
                },
                {
                    MainCoords = vector3(1534.0110, 6328.8813, 23.4418), 
                    Customers = {
                        {model = "g_m_y_mexgoon_03", coords = vector4(1538.7380, 6324.4023, 23.0684, 37.5559)},
                    },
                },
            }
        },
    },
   
    -----------------------------------------------------------
    -----------------------| TRANSLATE |-----------------------
    -----------------------------------------------------------

    MoneyForm = '$', -- Money form

    Locales = {
        CurrencyForm = "USD",
        ReputationForm = "REP",

        DefaultGradeName = "Member",
        
        MemberRankName = "Member",
        LeaderRankName = "Leader",

        Cloakrooms = "Cloakroom",
        Stashes = "Stash",
        BalanceManages = "Balance Manage",
        Garages = "Garage",
        Safe = "Safe",

        Vehicles = "Vehicles",
        VehiclesDescription = "With this upgrade you can store more cars in the gang garage.",
        Stash = "Stash",
        StashDescription = "This upgrade will increase the storage capacity of the stash.",
        MaxRanks = "Max Ranks",
        MaxRanksDescription = "With this upgrade the gang leader can create more ranks.",
        Raid = "Raid",
        RaidDescription = "With this upgrade your gang will be able to start a raid against another gang.",
        Safe = "Safe",
        SafeDescription = "With this upgrade you get a safe that only special gang members can access.",
        SafeDescription2 = "This upgrade will increase the storage capacity of the safe.",

        CoordsEditingText = "~y~Press ~INPUT_CELLPHONE_SELECT~ to set the new coords.~w~\nPress ~INPUT_CELLPHONE_CANCEL~ to ~r~cancel~w~ the process.",

        TaskStart = "Task Start",

        Blips = {
            HQ = "HQ",

            Safe = "Safe",
            Vehicle = "Vehicle",
            House = "House",
            Port = "Port",
            Boat = "Boat",
            Drop = "Drop",
            Company = "Company",
            DrugSelling = "Drug Selling",
            Money = "Get Money",
            Homeless = "Homeless",
            MeetingPoint = "Meeting point",
            Target = "Target",
        }
    },

    Texts = {
        [1] = {'[E] - Dress Menu', 38, 'Open the dress menu', 'fa-solid fa-person-half-dress'},
        [2] = {'[E] - Stash Menu', 38, 'Open the stash menu', 'fa-solid fa-box-open'}, 
        [3] = {'[E] - Garage Menu', 38, 'Open the garage menu', 'fa-solid fa-warehouse'}, 
        [4] = {'[E] - Vehicle storage', 38, 'To storage the vehicle', 'fa-solid fa-car'}, 
        [5] = {'[E] - Safe Menu', 38, 'Open the safe menu', 'fa-solid fa-shield'}, 
        [6] = {'[E] - Balance Manage', 38, 'Open the balance menu', 'fa-solid fa-coins'}, 
        [7] = {'[E] - Continue the task', 38},
        [8] = {'[E] - Start the task', 38},  
    },
    
    -- Notify function EDITABLE >> cl_utils.lua
    Notify = { 
        [1] = {"Gangs", "You're too far!", 5000, "error"},
        [2] = {"Gangs", "The job already exists!", 5000, "error"},
        [3] = {"Gangs", "You don't have permission to do this.", 5000, "error"},
        [4] = {"Gangs", "You've successfully invited a new member!", 5000, "success"},
        [5] = {"Gangs", "You've been successfully added to a gang!", 5000, "success"},
        [6] = {"Gangs", "You've kicked them out of the gang!", 5000, "success"},
        [7] = {"Gangs", "You've been kicked out of the gang!", 5000, "info"},
        [8] = {"Gangs", "Invalid Gang!", 5000, "error"},
        [9] = {"Gangs", "S/he is already a leader!", 5000, "error"},
        [10] = {"Gangs", "You have successfully added a new leader!", 5000, "success"},
        [11] = {"Gangs", "You're a gang leader now!", 5000, "info"},
        [12] = {"Gangs", "Invalid Player ID!", 5000, "error"},
        [13] = {"Gangs", "This rank already exists!", 5000, "error"},
        [14] = {"Gangs", "You've successfully created the new rank!", 5000, "success"},
        [15] = {"Gangs", "You've deleted the selected rank!", 5000, "success"},
        [16] = {"Gangs", "Before deleting make sure that nobody have this rank!", 5000, "error"},
        [17] = {"Gangs", "For example: /setgangleader [id] [job]", 5000, "error"},
        [18] = {"Gangs", "Successfully update!", 5000, "success"},
        [19] = {"Gangs", "There isn't enough money for that!", 5000, "error"},
        [20] = {"Gangs", "You can't turn this vehicle into a gang car because it's not yours!", 7000, "error"},
        [21] = {"Gangs", "The vehicle is not in the garage!", 5000, "error"},
        [22] = {"Gangs", "You've got it back:", 5000, "success"},
        [23] = {"Gangs", "No vehicle to get back!", 5000, "error"},
        [24] = {"Gangs", "Upgrade needed for this action!", 5000, "error"},
        [25] = {"Gangs", "Another vehicle occupies the space!", 5000, "error"},
        [26] = {"Gangs", "S/he is already a member of the group!", 5000, "error"},
        [27] = {"Gangs", "Fill in all the fields!", 5000, "error"},
        [28] = {"Gangs", "You cannot delete it!", 5000, "error"},
        [29] = {"Gangs", "You're too far from the middle of hq!", 5000, "error"},
        [30] = {"Gangs", "This HQ is already in use!", 5000, "error"},
        [31] = {"Gangs", "Invalid HQ! The hq isn't defined in the config!", 5000, "error"},
        [32] = {"Gangs", "Successful pin!", 5000, "success"},
        [33] = {"Gangs", "Your rank has been changed to:", 5000, "info"},
        [34] = {"Gangs", "The rank's name must be between 3-12 characters!", 5000, "error"},
        [35] = {"Gangs", "You have already reached today's limit!", 5000, "error"},
        [36] = {"Gangs", "You've successfully started!", 5000, "success"},
        [37] = {"Gangs", "You cannot start it right now!", 5000, "error"},
        [38] = {"Gangs", "New level of gang:", 5000, "success"},
        [39] = {"Gangs", "There isn't that much money available in the safe!", 5000, "error"},
        [40] = {"Gangs", "You don't have enough money!", 5000, "error"},
        [41] = {"Gangs", "Your gang is under attack!", 5000, "info"},
        [42] = {"Gangs", "You have successfully deleted the job!", 5000, "success"},
        [43] = {"Gangs", "You cannot put graffiti on this place.", 5000, "error"},
        [44] = {"Gangs", "Someone has already put graffiti nearby.", 5000, "error"},
        [45] = {"Gangs", "You have reached maximum graffiti in the team!", 5000, "error"},
        [46] = {"Gangs", "There is no near graffiti!", 5000, "error"},
        [47] = {"Gangs", "You do not have the necessary item!", 5000, "error"},
        [48] = {"Gangs", "You have to get out of the car!", 5000, "error"},
        [49] = {"Gangs", "You have to park your car here!", 5000, "error"},
        [50] = {"Gangs", "You failed!", 5000, "error"},
        [51] = {"Gangs", "For example: /setgangleader [job] [player id]", 5000, "error"},
        [52] = {"Gangs", "No drugs on your hands!", 5000, "error"},
        [53] = {"Gangs", "The gang name and label must be at least 3 characters long!", 5000, "error"},
        [54] = {"Gangs", "You have successfully created the job!", 5000, "success"},
        [55] = {"Gangs", "You have successfully saved it!", 5000, "success"},
        [56] = {"Gangs", "The task has failed!", 5000, "error"},
        [57] = {"Gangs", "There is already a task in progress!", 5000, "error"},
        [58] = {"Gangs", "The selected task is already in use!", 5000, "error"},
        [59] = {"Gangs", "You have successfully completed the task!", 5000, "success"},
        [60] = {"Gangs", "You can only graffiti every 10 minutes! Try again later!", 5000, "error"},
        [61] = {"Gangs", "You can only clean graffiti every 10 minutes!", 5000, "error"},
        [62] = {"Gangs", "They all must die!", 5000, "error"},
        [63] = {"Gangs", "The vehicle must be empty!", 5000, "error"},
        [64] = {"Gangs", "There must be a vehicle near!", 5000, "error"},
        [65] = {"Gangs", "Catch the homeless man!", 5000, "info"},
        [66] = {"Gangs", "Already in progress!", 5000, "error"},
        [67] = {"Gangs", "No spaces in the gang name!", 5000, "error"},
    },

    TaskMessages = {
        TaskStarted = "TASK STARTED",
        NextPart = "NEXT PART",
        TaskCompleted = "TASK COMPLETED",
        Warning = '<span style="color:red;">WARNING</span>',
        Success = '<span style="color:lightgreen;">SUCCESS</span>',
        Failed = '<span style="color:red;">FAILED</span>',
        Info = '<span style="color:lightblue;">INFORMATION</span>',

        Scout = "Watch your enemies to get information about them!",
        Scout2 = "You have successfully got the data on them!",
        Scout3 = "The task could not be completed in time!",

        Raid1 = "Stay on the enemy's HQ until time runs out!",
        Raid2 = "Defend your HQ and kill your enemies!",
        Raid3 = "You've lost the raid!",
        Raid4 = "You've won the raid!",

        StashLoot1 = "STASH LOOT",
        StashLoot2 = "Now you can loot out the enemy's stash",

        DriveTo = "Drive to the designated place!",

        BodyDisposal1 = "Break the car!",
        BodyDisposal2 = "Drive to the location and pick up the body!",
        BodyDisposal3 = "Put it in the car!",
        BodyDisposal4 = "Go to the port!",
        BodyDisposal5 = "Get the body bag out of the trunk!",
        BodyDisposal6 = "Put the body bag in the boat!",
        BodyDisposal7 = "Drop the body in the water at the designated place!",
        BodyDisposal8 = "Go back to the port!",
        BodyDisposal9 = "Let's go back to the starting point!",

        Drug1 = "Steal the van full of drugs!",
        Drug2 = "Go to your customers!",
        Drug3 = "Move the drugs to the other car.",
        Drug4 = "Pick up the money from the customer!",

        Homeless1 = "Catch and put the homeless man in the trunk!",
        Homeless2 = "Go to your customers!",
        Homeless3 = "Put the homeless man in the customer's trunk!",
        Homeless4 = "Pick up the money from the customer!",

        Assassination1 = "Kill the target without getting close!",
        Assassination2 = "Put the body on your shoulders!",
        Assassination3 = "Put the body in the trunk!",
        Assassination4 = "Go to your customers!",
        Assassination5 = "Drop the body!",
        Assassination6 = "Pick up the money from the customer!",
    },
    
    Webhooks = {
        Locale = {
            ['editGangDatas1'] = "⌛ Gang details updated...",
            ['gangCreation1'] = "🆕 New gang has been created...",
            ['gangDeleted1'] = "🆕 Gang has been deleted...",
            ['scout1'] = "🔍 They got the data from another gang...",
            ['raidStart1'] = "⚔️ Raid has started...",
            ['raidEnd1'] = "⚔️ Raid has ended...",

            ['editGangDatas2'] = "edited the gang's data.",
            ['gangCreation2'] = "created a new gang.",
            ['gangDeleted2'] = "deleted a gang.",
            ['scout2'] = "started the scouting...",
            ['raidStart2'] = "started a raid...",

            ['Identifier'] = "Identifier",
            ['GangName'] = "Gang Name",
            ['GangLabel'] = "Gang Label",
            ['Balance'] = "Balance",
            ['Reputation'] = "Reputation Points",
            ['Status'] = "Status 📈",
            ['Enemy'] = "Enemy 😈",
            ['TargetGang'] = "Target Gang",
            ['Table'] = "Table",
            ['Lost'] = "LOST",
            ['Won'] = "WON",

            ['Time'] = "Time ⏲️"
        },

        -- To change a webhook color you need to set the decimal value of a color, you can use this website to do that - https://www.mathsisfun.com/hexadecimal-decimal-colors.html
        Colors = {
            ['editGangDatas1'] = 3093151, 
            ['gangCreation1'] = 3145375,
            ['gangDeleted1'] = 16121856,
            ['scout1'] = 3145375,
            ['raidStart1'] = 3145375,
            ['raidEnd1'] = 5845663,
        }
    },
}
