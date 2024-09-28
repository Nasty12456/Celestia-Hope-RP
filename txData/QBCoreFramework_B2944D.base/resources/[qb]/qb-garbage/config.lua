AK4Y = {}

AK4Y.Framework = "qb" -- qb / oldqb | qb = export system | oldqb = triggerevent system
AK4Y.FrameWorkScriptName = "qb-core"
AK4Y.FrameGetObjectEvent = 'QBCore:GetObject'
AK4Y.sql = "oxmysql" --Check fxmanifest.lua when you change it! | ghmattimysql / oxmysql / mysql-async
AK4Y.MoneyResetTime = 1950 --Minute
AK4Y.TaskResetTime = 1440 --Minute
AK4Y.DailyLimit = 50000 --Daily withdraw money limit
AK4Y.NeededXP = 1000 --Need xp for level up
AK4Y.MaxKmForRoutes = 20 --Max km for progress kms.
AK4Y.Vehicle = "trash2" --Spawn trash vehicle name.
AK4Y.RandomItemChange = 5 --% item change for random items.
AK4Y.RandomItems = {
    "water_bottle",
    "bread"
}

AK4Y.Blip = {
    Sprite = 318,
    Scale = 0.7,
    Color = 39,
    Label = "Garbage Depot"
}

AK4Y.Interaction = {
    InteractionType = "target", --target or drawtext
    TargetName = "qb-target",
}

AK4Y.StartZone = {
    StartPed = vector4(-322.25, -1545.87, 31.02, 267.96),
    SpawnCoords = {
        [1] = vector4(-324.39, -1527.97, 27.26, 0.78),
        [2] = vector4(-332.87, -1523.42, 27.3, 268.62),
    },
    DropVehicleCoord = vector3(-315.07, -1521.13, 27.56),
}

AK4Y.JobRoutes = {
    [0] = {
        id = 1,
        RouteName = "Route #1",
        RouteSmallText = "Lorem ipsum dolor",
        RouteDistance = 5, --Number (km)
        Photo = "https://cdn.discordapp.com/attachments/956491704398118962/1123467267741589534/image.png",
        RouteStartStreet = "Alta Street",
        RouteFinishStreet = "Power Street",
        Price = 15, --Number
        Level = 0,
        Route = {
            [1] = vector3(-325.15, -1359.15, 31.61),
            [2] = vector3(-174.98, -1283.24, 31.67),
            [3] = vector3(-174.77, -1285.68, 31.72),
            [4] = vector3(-175.6, -1291.33, 31.68),
            [5] = vector3(-7.38, -1034.61, 29.45),
            [6] = vector3(-7.93, -1037.64, 29.51),
            [7] = vector3(6.52, -1029.47, 29.54),
            [8] = vector3(9.05, -1030.3, 29.55),
            [9] = vector3(33.02, -1009.56, 29.81),
            [10] = vector3(74.94, -875.42, 30.77),
            [11] = vector3(159.26, -777.53, 32.05),
            [12] = vector3(159.56, -775.77, 32.2),
            [13] = vector3(159.98, -774.05, 32.29),
            [14] = vector3(237.83, -681.5, 37.71),
            [15] = vector3(250.93, -661.32, 38.71),
            [16] = vector3(285.82, -616.0, 44.27),
            [17] = vector3(289.14, -617.05, 44.2),
            [18] = vector3(319.31, -183.96, 57.69),
            [19] = vector3(317.43, -183.3, 57.82),
            [20] = vector3(314.03, -182.31, 57.73),

        }
    },
    [1] = {
        id = 2,
        RouteName = "Route #2",
        RouteSmallText = "Lorem ipsum dolor",
        RouteDistance = 9, --Number (km)
        Photo = "https://cdn.discordapp.com/attachments/1123475571767263273/1123475596996001892/image.png",
        RouteStartStreet = "Carson Ave",
        RouteFinishStreet = "Las Lagunas Blvd",
        Price = 17, --Number
        Level = 3,
        Route = {
            [1] = vector3(-241.77, -1470.68, 31.88),
            [2] = vector3(-243.44, -1472.88, 31.86),
            [3] = vector3(-244.52, -1474.84, 31.82),
            [4] = vector3(-22.58, -1534.31, 30.57),
            [5] = vector3(-10.84, -1528.68, 30.32),
            [6] = vector3(-9.02, -1527.22, 30.13),
            [7] = vector3(-12.89, -1542.35, 29.88),
            [8] = vector3(130.31, -1524.54, 29.43),
            [9] = vector3(131.49, -1522.75, 29.47),
            [10] = vector3(133.99, -1520.69, 29.57),
            [11] = vector3(126.89, -1511.9, 29.53),
            [12] = vector3(129.1, -1487.86, 29.44),
            [13] = vector3(127.68, -1487.24, 29.6),
            [14] = vector3(116.52, -1462.35, 29.73),
            [15] = vector3(103.38, -1317.55, 29.57),
            [16] = vector3(105.52, -1316.25, 29.64),
            [17] = vector3(92.01, -1302.71, 29.26),
            [18] = vector3(92.51, -1305.28, 29.51),
            [19] = vector3(84.52, -1291.06, 29.52),
            [20] = vector3(6.29, -729.97, 32.42),
            [21] = vector3(7.7, -725.59, 32.57),
            [22] = vector3(-4.1, -203.98, 53.19),
            [23] = vector3(5.02, -205.39, 53.09),
            [24] = vector3(5.89, -203.03, 53.02),
            --[25] = vector3(-22.58, -1534.31, 30.57),
        }
    },
    [2] = {
        id = 3,
        RouteName = "Route #3",
        RouteSmallText = "Lorem ipsum dolor",
        RouteDistance = 11, --Number (km)
        Photo = "https://cdn.discordapp.com/attachments/1123475571767263273/1123477898616131584/image.png",
        RouteStartStreet = "Calais Ave",
        RouteFinishStreet = "Elgin Ave",
        Price = 23, --Number
        Level = 5,
        Route = {
            [1] = vector3(-541.38, -1220.3, 18.73),
            [2] = vector3(-541.9, -1222.42, 18.9),
            [3] = vector3(-632.96, -1225.58, 12.52),
            [4] = vector3(-634.24, -1227.58, 12.51),
            [5] = vector3(-716.49, -1170.11, 10.95),
            [6] = vector3(-714.71, -1133.22, 10.1),
            [7] = vector3(-708.46, -1140.65, 11.14),
            [8] = vector3(-710.79, -1142.47, 11.16),
            [9] = vector3(-763.62, -907.91, 20.13),
            [10] = vector3(-718.63, -882.14, 23.95),
            [11] = vector3(-717.3, -880.88, 23.91),
            [12] = vector3(-569.34, -858.47, 26.74),
            [13] = vector3(-364.13, -958.31, 31.36),
            [14] = vector3(-363.73, -961.21, 31.53),
            [15] = vector3(116.42, -1049.2, 29.48),
            [16] = vector3(127.94, -1053.48, 29.58),
            [17] = vector3(130.96, -1053.77, 29.67),
            [18] = vector3(121.71, -1088.34, 29.49),
            [19] = vector3(125.07, -1088.48, 29.66),
            [20] = vector3(152.27, -1064.9, 29.5),
            [21] = vector3(154.56, -1065.77, 29.5),
            [22] = vector3(173.53, -1073.52, 29.5),
            [23] = vector3(173.25, -1076.49, 29.61),
            --[24] = vector3(5.89, -203.03, 53.02),
            --[25] = vector3(-22.58, -1534.31, 30.57),
        }
    },
    [3] = {
        id = 4,
        RouteName = "Route #4",
        RouteSmallText = "Lorem ipsum dolor",
        RouteDistance = 9, --Number (km)
        Photo = "https://cdn.discordapp.com/attachments/1123475571767263273/1123481352243793960/image.png",
        RouteStartStreet = "Davis Ave",
        RouteFinishStreet = "Aguja Street",
        Price = 25, --Number
        Level = 6,
        Route = {
            [1] = vector3(-360.31, -1868.14, 21.36),
            [2] = vector3(-360.21, -1864.84, 21.65),
            [3] = vector3(-360.67, -1861.0, 21.65),
            [4] = vector3(-589.92, -1738.29, 23.04),
            [5] = vector3(-587.85, -1740.68, 23.07),
            [6] = vector3(-615.22, -1610.03, 27.26),
            [7] = vector3(-617.55, -1609.88, 27.33),
            [8] = vector3(-619.61, -1609.83, 27.26),
            [9] = vector3(-621.8, -1609.87, 27.34),
            [10] = vector3(-626.59, -1611.05, 26.96),
            [11] = vector3(-724.87, -1506.33, 5.46),
            [12] = vector3(-723.66, -1509.0, 5.45),
            [13] = vector3(-845.2, -1112.47, 7.37),
            [14] = vector3(-846.49, -1110.11, 7.51),
            [15] = vector3(-849.95, -1111.68, 7.37),
            [16] = vector3(-922.09, -1161.74, 5.08),
            [17] = vector3(-1019.23, -1119.42, 2.49),
            [18] = vector3(-1023.1, -1125.04, 2.6),
            [19] = vector3(-1055.74, -1145.1, 2.46),
            [20] = vector3(-1130.38, -1181.16, 2.69),
            [21] = vector3(-1132.12, -1181.9, 2.7),
            [22] = vector3(-1147.41, -1190.4, 2.95),
            [23] = vector3(-1147.25, -1380.06, 5.35),
            [24] = vector3(-1179.15, -1403.38, 5.02),
            [25] = vector3(-1177.89, -1405.51, 5.05),
        }
    },
    [4] = {
        id = 5,
        RouteName = "Route #5",
        RouteSmallText = "Lorem ipsum dolor",
        RouteDistance = 13, --Number (km)
        Photo = "https://cdn.discordapp.com/attachments/1123475571767263273/1123488309730086942/image.png",
        RouteStartStreet = "Davis Ave",
        RouteFinishStreet = "Davis Ave",
        Price = 39, --Number
        Level = 7,
        Route = {
            [1] = vector3(-132.86, -1782.73, 30.2),
            [2] = vector3(-10.8, -1812.7, 26.19),
            [3] = vector3(-13.15, -1812.93, 26.28),
            [4] = vector3(1.92, -1822.8, 25.62),
            [5] = vector3(0.1, -1824.84, 25.73),
            [6] = vector3(131.0, -1887.41, 23.78),
            [7] = vector3(190.17, -1916.8, 22.91),
            [8] = vector3(396.87, -1925.2, 25.08),
            [9] = vector3(414.18, -1898.85, 25.99),
            [10] = vector3(411.48, -1900.57, 25.91),
            [11] = vector3(414.62, -1903.78, 25.97),
            [12] = vector3(421.43, -1883.61, 26.75),
            [13] = vector3(434.01, -1877.95, 27.41),
            [14] = vector3(475.11, -1861.86, 27.98),
            [15] = vector3(494.13, -1887.3, 26.4),
            [16] = vector3(560.51, -1774.88, 29.65),
            [17] = vector3(561.76, -1776.01, 29.82),
            [18] = vector3(563.7, -1774.39, 29.78),
            [19] = vector3(425.4, -1526.13, 29.55),
            [20] = vector3(424.42, -1524.16, 29.55),
            [21] = vector3(422.42, -1521.43, 29.7),
            [22] = vector3(422.54, -1518.89, 29.57),
            [23] = vector3(423.81, -1517.8, 29.7),
            --[24] = vector3(-1179.15, -1403.38, 5.02),
            --[25] = vector3(-1177.89, -1405.51, 5.05),
        }
    },
    [5] = {
        id = 6,
        RouteName = "Route #6",
        RouteSmallText = "Lorem ipsum dolor",
        RouteDistance = 18, --Number (km)
        Photo = "https://cdn.discordapp.com/attachments/1123475571767263273/1123488309730086942/image.png",
        RouteStartStreet = "Olympic Fwy",
        RouteFinishStreet = "Power Street",
        Price = 32, --Number
        Level = 9,
        Route = {
            [1] = vector3(-346.79, -1068.08, 23.34),
            [2] = vector3(-349.39, -1070.0, 23.42),
            [3] = vector3(-350.8, -1071.95, 23.3),
            [4] = vector3(-363.19, -961.54, 31.35),
            [5] = vector3(-363.19, -959.22, 31.45),
            [6] = vector3(7.3, -710.89, 33.03),
            [7] = vector3(8.05, -709.1, 33.17),
            [8] = vector3(450.96, -696.68, 28.19),
            [9] = vector3(468.53, -947.67, 28.18),
            [10] = vector3(466.43, -947.22, 28.34),
            [11] = vector3(454.2, -932.58, 28.76),
            [12] = vector3(453.8, -917.44, 28.75),
            [13] = vector3(339.19, -960.41, 29.76),
            [14] = vector3(315.92, -946.19, 29.75),
            [15] = vector3(313.56, -946.25, 29.79),
            [16] = vector3(242.54, -823.62, 30.36),
            [17] = vector3(244.27, -824.1, 30.38),
            [18] = vector3(51.2, -831.01, 30.38),
           -- [19] = vector3(425.4, -1526.13, 29.55),
           -- [20] = vector3(424.42, -1524.16, 29.55),
           -- [21] = vector3(422.42, -1521.43, 29.7),
           -- [22] = vector3(422.54, -1518.89, 29.57),
           -- [23] = vector3(423.81, -1517.8, 29.7),
           --[24] = vector3(-1179.15, -1403.38, 5.02),
           --[25] = vector3(-1177.89, -1405.51, 5.05),
        }
    },
}

AK4Y.Tasks = {
    [0] = {
        id = 0,
        TaskName = "#1 Finish Your First Job",
        TaskDescription = "You will get a reward when you finish your first mission.",
        Reward = {
            Price = 7000,
            Exp = 500,
        } ,
        requiredCount = 1,
        hasCount = 0,
        Collected = false,
    },
    [1] = {
        id = 1,
        TaskName = "#2 Finish Your Second Job",
        TaskDescription = "You will receive rewards when you complete two missions.",
        Reward = {
            Price = 56,
            Exp = 700,
        } ,
        requiredCount = 2,
        hasCount = 0,
        Collected = false,
    },
    [2] = {
        id = 2,
        TaskName = "#3 Find Rare Item",
        TaskDescription = "The mission progresses with each valuable item you find.",
        Reward = {
            Price = 358,
            Exp = 3563,
        } ,
        requiredCount = 5,
        hasCount = 0,
        Collected = false,
    },
    [3] = {
        id = 3,
        TaskName = "#4 Finish 5 Job",
        TaskDescription = "Each time you finish a job, the bar advances one level.",
        Reward = {
            Price = 358,
            Exp = 3563,
        } ,
        requiredCount = 5,
        hasCount = 0,
        Collected = false,
    },
    [4] = {
        id = 4,
        TaskName = "#5 Find Your First Rare Item",
        TaskDescription = "You will get a reward when you find the first valuable item.",
        Reward = {
            Price = 358,
            Exp = 3563,
        } ,
        requiredCount = 1,
        hasCount = 0,
        Collected = false,
    },
    [5] = {
        id = 5,
        TaskName = "#6 Finish 5 Task",
        TaskDescription = "Each time you finish a mission, the bar advances one level.",
        Reward = {
            Price = 358,
            Exp = 3563,
        } ,
        requiredCount = 5,
        hasCount = 0,
        Collected = false,
    },
}

function OnVehicleSpawn(plate)
    TriggerEvent("vehiclekeys:client:SetOwner", plate)
end

function FindRareItem()
    TriggerServerEvent('qb-garbage:AddTask', 4, 1)
    Wait(500)
    TriggerServerEvent('qb-garbage:AddTask', 2, 1)
end

function OnJobFinish()
    TriggerServerEvent('qb-garbage:AddTask', 0, 1)
    Wait(500)
    TriggerServerEvent('qb-garbage:AddTask', 1, 1)
    Wait(500)
    TriggerServerEvent('qb-garbage:AddTask', 3, 1)
end

function OnTasksFinish()
    TriggerServerEvent('qb-garbage:AddTask', 5, 1)
end

AK4Y.Clothing ={
	male ={
        ['tshirt_1'] = 59, ['tshirt_2'] = 0, -- düzenlendi
        ['torso_1'] = 56, ['torso_2'] = 0,-- düzenlendi
        ['decals_1'] = 0, ['decals_2'] = 0,
        ['arms'] = 63, -- düzenlendi
        ['pants_1'] = 36, ['pants_2'] = 0, -- düzenlendi
        ['shoes_1'] = 25, ['shoes_2'] = 0,
        ['helmet_1'] = 58, ['helmet_2'] = 0,
        ['chain_1'] = 0, ['chain_2'] = 0,
        ['ears_1'] = -1, ['ears_2'] = 0,
        ['mask_1'] = 0, ['mask_2'] = 0,
        ['bags_1'] = 0, ['bags_2'] = 0,
        ['glasses_1'] = 0, ['glasses_2'] = 0,
        ['bproof_1'] = 0,  ['bproof_2'] = 0
	},
	female={
	    ['arms'] = 0,
	    ['tshirt_1'] = 2, 	['tshirt_2'] = 0,
	    ['torso_1'] = 161, 	['torso_2'] = 0,
	    ['decals_1'] = 0, 	['decals_2'] = 0,
	    ['pants_1'] = 69, 	['pants_2'] = 0,
	    ['shoes_1'] = 27, 	['shoes_2'] = 7,
	    ['helmet_1'] = -1, 	['helmet_2'] = 0,
	    ['chain_1'] = 0, 	['chain_2'] = 0,
	    ['ears_1'] = -1, 	['ears_2'] = 0,
	    ['mask_1'] = 0, 	['mask_2'] = 0,
	    ['bags_1'] = 0, 	['bags_2'] = 0,
	    ['glasses_1'] = 18, ['glasses_2'] = 0,
	    ['bproof_1'] = 5,  	['bproof_2'] = 0,
	    ['watches_1'] = 0,  ['watches_2'] = 0,
	    ['bracelets_1'] = 0,['bracelets_2'] = 0,
	}
}

AK4Y.Languages = {
    ["wear_clothes"] = "You need wear clothes to start job.",
    ["weared_clothes"] = "You weared clothes.",
    ["unweared_clothes"] = "You unweared clothes.",
    ["no_price"] = "You have to enter price!",
    ["no_spawnpoint"] = "All spawn points are full!",
    ["next_checkpoint"] = "All garbage bags are done, proceed to the next location!",
    ["bags_left"] = "Bags left: ",
    ["vehicle_deleted"] = "The mission was canceled because the vehicle was deleted.",
    ["done_work"] = "You are done working! Go back to the depot.",
    ["0$_withdraw"] = "You can't withdraw 0$",
    ["max_withdraw"] = "The maximum amount you can withdraw: ",
    ["no_money"] = "You don't have this amount in your account.",
    ["max_withdraw_limit"] = "You can't withdraw more than the daily limit.",
    ["withdrawed"] = "The money was deposited into the bank account.",
    ["task_successfully"] = "You take this task reward.", -- Edited
    ["integar_value"] = "You must enter an integer value!",
    ["leave_job"] = "You left your job",
    ["speak"] = "[E] Speak", -- EKLEME
    ["level_not_yet"] = "Your level is not yet for this job.",
    ["take_garbage"] = "Take Garbage",
    ["drop_garbage_to_vehicle"] = "[E] Drop Garbage To Vehicle",
    ["drop_vehicle"] = "[E] - Drop Vehicle",
    ["start_job"] = "Start Job",
    ["enter_vehicle"] = "Enter Vehicle",
    ["move_to_checkpoint"] = "Move To Checkpoint",
    ["collect_garbage"] = "Collect Garbage",
    ["descriptionText"] = "Lorem ipsum dolor sit amet consectetur. Nibh dictumst massa et ullamcorper proin.",
    ["earningsDescription"] = "Lorem ipsum dolor sit amet cons Nibh dictumst",
    ["profileDescription"] = "Lorem ipsum dolor sit amet consecte. Montes",
    ["earningInformation"] = "Lorem ipsum dolor sit amet consNibh dictumst"
}

function FrameworkNotify(text ,type)
    QBCore.Functions.Notify(text, type)
end