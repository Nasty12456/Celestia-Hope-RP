Config = {}
Config.Target = 'qb-target'
Config.Menu = 'qb-menu'
Config.CoolDownTime = 20 -- CoolDown Time in minutes between when starting a run until they can do a new run
Config.NoteItem = "moneyorder" -- item they recieve when washing the money

-- Location of money order ped where you exchange the money order
Config.MoneyOrderPedLoc = vector4(-2953.71, 436.9, 14.28, 358.13) -- if you change this change the box one too
Config.MoneyOrderPed = 'g_m_m_chiboss_01' -- Ped you turn the money order in to.
Config.MoneyOrderBoxZone = {
    coords = vector3(-1058.85, -240.7, 54.0),
    length = 0.8,
    width = 1,
    heading = 30,
    debugPoly = false,
    minZ = 53.0,
    maxZ = 55.0
}
-- START
-- Script wise these need to be different things but they are the meant to be the same person for the 'mission'
Config.MoneyWashingPed = 'g_m_m_chiboss_01' --Starting Ped
Config.MoneyMeetupPed = 'g_m_m_chiboss_01' --Starting Ped's twin who takes you inside the laundry. 
--END 

Config.WashItems = {
    [1] = {
        item = "markedbills",
        amount = 1, --Minimum amount required to wash item. (CAN WASH AS MANY AS YOU WANT ABOVE THIS NUMBER AT A TIME)
        price = math.random(4500, 5500), -- how much each marked bill is worth
        MaxAmount = 30, -- Max amount you can wash at a time
    },
}

Config.MoneyWashingStart = { --Add as many or as little of these as you want. It will select one random location every server restart. This is where you acquire the money washing location which is also random every restart. 
    vector4(1871.64, 3339.91, 43.53, 295.1),
}
Config.MoneyWashingMeetup = { --This is where the entrance to the laundry will be. Random selection every time you start the run. 
    [1] = {
        ped = vector4(619.65, 2785.2, 43.48, 10.04), --Meetup Location for laundry. 
        door = vector3(614.45, 2785.14, 43.48), --This is where the player and the ped will walk towards during the cutscene.
        cam = vector3(620.04, 2804.04, 45.68), --Location of Camera for the cutscene that shows you entering the laundry. 
        camrot = vector3(0.0, 0.0, 150.343277) --Camera Rotation. make sure first two values are always 0.0
    },
    [2] = {
        ped = vector4(1557.77, 2158.2, 78.63, 277.93), --Meetup Location for laundry. 
        door = vector3(1557.62, 2162.37, 78.67), --This is where the player and the ped will walk towards during the cutscene.
        cam = vector3(1564.06, 2163.69, 79.44), --Location of Camera for the cutscene that shows you entering the laundry. 
        camrot = vector3(0.0, 0.0, 129.355277) --Camera Rotation. make sure first two values are always 0.0
    },
    [3] = {
        ped = vector4(2902.61, 4415.0, 48.83, 293.02), --Meetup Location for laundry. 
        door = vector3(2898.85, 4422.18, 48.6), --This is where the player and the ped will walk towards during the cutscene.
        cam = vector3(2919.48, 4440.5, 58.69), --Location of Camera for the cutscene that shows you entering the laundry. 
        camrot = vector3(0.0, 0.0, 138.3903) --Camera Rotation. make sure first two values are always 0.0
    },
    [4] = {
        ped = vector4(835.19, 2177.45, 52.31, 146.18), --Meetup Location for laundry. 
        door = vector3(839.54, 2176.67, 52.29), --This is where the player and the ped will walk towards during the cutscene.
        cam = vector3(825.96, 2168.32, 58.89), --Location of Camera for the cutscene that shows you entering the laundry. 
        camrot = vector3(0.0, 0.0, -51.41302) --Camera Rotation. make sure first two values are always 0.0
    },
    [5] = {
        ped = vector4(790.11, -99.93, 82.04, 148.18), --Meetup Location for laundry. 
        door = vector3(794.57, -102.83, 82.03), --This is where the player and the ped will walk towards during the cutscene.
        cam = vector3(803.46, -116.06, 89.04), --Location of Camera for the cutscene that shows you entering the laundry. 
        camrot = vector3(0.0, 0.0, 34.902306) --Camera Rotation. make sure first two values are always 0.0
    },
    [6] = {
        ped = vector4(2518.34, 2609.25, 37.94, 284.04), --Meetup Location for laundry. 
        door = vector3(2519.79, 2614.3, 37.96), --This is where the player and the ped will walk towards during the cutscene.
        cam = vector3(2540.58, 2605.58, 40.31), --Location of Camera for the cutscene that shows you entering the laundry. 
        camrot = vector3(0.0, 0.0, 76.791733) --Camera Rotation. make sure first two values are always 0.0
    },
    [7] = {
        ped = vector4(515.0, 169.06, 99.37, 252.78), --Meetup Location for laundry. 
        door = vector3(516.33, 172.27, 99.81), --This is where the player and the ped will walk towards during the cutscene.
        cam = vector3(524.35, 171.89, 101.43), --Location of Camera for the cutscene that shows you entering the laundry. 
        camrot = vector3(0.0, 0.0, 96.841644) --Camera Rotation. make sure first two values are always 0.0
    },
}