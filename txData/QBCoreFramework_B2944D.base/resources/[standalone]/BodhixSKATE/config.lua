--------------------------------------
--<!>-- BODHIX | STUDIO --<!>--
--------------------------------------
--------------------------------------
--<!>--  SKATE | CAREER --<!>--
--------------------------------------

-- Support & Feedback: https://discord.gg/PjN7AWqkpF

Config = {}
Config.Debug = false -- True / False for Debug System

Config.Framework = "qb" -- Pick your framework: "qb" or "esx" - Default: "qb"

-- Settings
Config.ItemName = 'skateboard'
Config.MaxSpeedKmh = 40 -- This does not really change that much unless you get a boost somehow.
Config.maxJumpHeigh = 5.0 -- We suggest not to mess to much with this (And yes, you can jump very high).
Config.LoseConnectionDistance = 2.0 -- This is the distance from you to the skateboard (Don't mess with this, unless you know, what you are doing).
Config.MinimumSkateSpeed = 2.0
Config.MinGroundHeight = 1.0

Config.Language = {
    Info = {
        ['controls'] = 'Press E to remove | Press G to jump on',
    }
}

skate = {
    BeachParkCoords = { x = -1365.0873, y = -1417.0070,  z = 2.6691,  w = 97.1605 },           
    ParkCoords = { x = -931.6293,   y = -789.1327,   z = 14.9210,  w = 209.3628 },    
} 
