Config = {}

-- Enabled additional debug prints as well as displays all the possible (automatic) drop zones on the map
Config.debug = false


--- SETTINGS FOR ESX
Config.esxSettings = {
    enabled = false,

    -- Whether or not to use the new ESX export method
    useNewESXExport = true,
}

--- SETTINGS FOR QBCORE
Config.qbSettings = {
    enabled = true,
}

-------------------------------------------------
--- ITEM
-------------------------------------------------
Config.item = {
    enabled = true,

    flareItemName = 'kq_airdrop_flare',
    cooldown = 60, -- time in seconds

    drop = {
        flare = true,
        crates = {
            'coke',
            'tequila',
        },
    }
}

-------------------------------------------------
--- GENERAL
-------------------------------------------------

Config.misc = {
    -- Time in minutes as how long the loot should remain on the ground for
    dropLifetime = 10,

    -- Size of the flare/smoke
    flareScale = 1.5,

    -- How long the smoke should stay for
    flareLifetime = 60, -- time in seconds

    -- Whether or not to show the planes on the map
    planeBlips = true,

    -- Whether or not to show the crates on the map
    crateBlips = true,

    crateBlipsLifetime = 60, -- time in seconds
}

-------------------------------------------------
--- LOOT PICKUP ANIMATION
-------------------------------------------------
Config.pickupAnimation = {
    duration = 2, -- in seconds
    dict = 'mp_take_money_mg',
    anim = 'put_cash_into_bag_loop',
    flag = 1,
}

-------------------------------------------------
--- PLANE
-------------------------------------------------

Config.plane = {
    -- Model of the plane. We recommend using bigger planes to make them more visible to the players
    -- Recommended: titan, streamer216
    model = 'titan',

    -- Color of the plane
    color = { r = 30, g = 40, b = 0 },

    -- Velocity of the plane in m/s
    -- This only affects the flight speed before the drop is dropped. The plane will always slow down right
    -- before dropping the crates

    -- Recommended values between 20 and 100. Anything under or over may cause visual issues
    flightSpeed = 60.0,
}

-------------------------------------------------
--- AUTOMATIC DROPS
-------------------------------------------------

Config.automaticDrop = {
    enabled = true,
    -- Time in minutes
    timeBetweenDrops = 60
}

-- Drop zones for the automatic drop
-- coords = coordinates of the zone
-- radius = radius of the potential drop zone
-- flare = true/false, whether to spawn the flare when the crates hit the ground
-- crates = type of crates that will be dropped. As defined per Config.types. Any amount can be given. Will drop in the stated order with slight delay between each drop
Config.drops = {
    {
        coords = vector3(1929.8, 3332.1, 45.5),
        radius = 500.0,
        flare = true,
        crates = {
            'coke',
            'tequila',
            'coke',
        },
    },
    {
        coords = vector3(751.41, 3000.0, 50.0),
        radius = 500.0,
        flare = true,
        crates = {
            'coke',
            'tequila',
            'coke',
        },
    },
    {
        coords = vector3(1430.78, 2044.9, 130.0),
        radius = 500.0,
        flare = true,
        crates = {
            'coke',
            'tequila',
            'coke',
        },
    },
    {
        coords = vector3(-669.5, 2756.3, 80.0),
        radius = 400.0,
        flare = true,
        crates = {
            'coke',
            'tequila',
            'coke',
        },
    },
    {
        coords = vector3(-1558.0, 4601.2, 70.0),
        radius = 300.0,
        flare = true,
        crates = {
            'coke',
            'tequila',
            'coke',
        },
    },
}

-- Types of drops
-- amount = amount of the crates it should drop
-- model = model of the crate
-- chunks = little parts which will be spawned upon crate crash

-- loot
-- -- radius = radius of the loot spawn upon crate crashing
-- -- amount = amount of little crates/items that will spawn
-- -- loot - table of different item crates
-- -- -- hash = model of the drop item
-- -- -- items = list of items, amounts and chances
-- -- -- chance = chance of said "loot" to spawn in relation to other loots
-- -- -- textureVariation = texture variation of the prop
-- -- -- minimumDistanceBetween = minimum distance between the props/loot
-- -- -- offset = object offset
-- -- -- animation = animation used for the pickup
-- -- -- labelSingular = label for one of the items
-- -- -- labelPlurar = label for multiple items
-- -- -- collectMessage = message players will to pickup the item
-- -- -- icon = icon used for target systems
Config.types = {
    ['coke'] = {
        amount = 1,
        model = 'xm3_prop_xm3_box_pile_tq_01a',
        chunks = 'prop_ld_crate_lid_01',
        loot = {
            -- Radius around which items will spawn from the crashed plane
            radius = 5.0,
            -- Amount of loot items that will be spawned
            amount = 8,
            loot = {
                {
                    hash = 'm23_1_prop_m31_roostercrate_03a',
                    items = {
                        {
                            item = 'kq_cocaine_brick',
                            chance = 100,
                            amount = {
                                min = 1,
                                max = 1,
                            },
                        }
                    },
                    chance = 100,
                    textureVariation = 0,
                    minimumDistanceBetween = 1.0,
                    offset = {
                        x = 0.0, y = 0.0, z = 0.0,
                    },
                    animation = Config.pickupAnimation,
                    labelSingular = 'Cocaine brick',
                    labelPlurar = 'Cocaine brick',
                    collectMessage = 'Pickup the cocaine brick',
                    icon = 'fas fa-box',
                },
            },
        },
    },
    ['tequila'] = {
        amount = 1,
        model = 'prop_lev_crate_01',
        chunks = 'prop_ld_crate_lid_01',
        loot = {
            -- Radius around which items will spawn from the crashed plane
            radius = 5.0,
            -- Amount of loot items that will be spawned
            amount = 8,
            loot = {
                {
                    hash = 'xm3_prop_xm3_product_box_01',
                    items = {
                        {
                            item = 'kq_tequila',
                            chance = 100,
                            amount = {
                                min = 2,
                                max = 3,
                            },
                        }
                    },
                    chance = 70,
                    textureVariation = 0,
                    minimumDistanceBetween = 1.0,
                    offset = {
                        x = 0.0, y = 0.0, z = 0.0,
                    },
                    animation = Config.pickupAnimation,
                    labelSingular = 'Tequila box',
                    labelPlurar = 'Tequila boxes',
                    collectMessage = 'Pickup the tequila box',
                    icon = 'fas fa-box',
                },
                {
                    hash = 'prop_tequila_bottle',
                    items = {
                        {
                            item = 'kq_tequila',
                            chance = 100,
                            amount = {
                                min = 1,
                                max = 1,
                            },
                        }
                    },
                    chance = 30,
                    textureVariation = 0,
                    minimumDistanceBetween = 1.0,
                    offset = {
                        x = 0.0, y = 0.0, z = 0.0,
                    },
                    animation = Config.pickupAnimation,
                    labelSingular = 'Tequila bottle',
                    labelPlurar = 'Tequila bottle',
                    collectMessage = 'Pickup the tequila bottle',
                    icon = 'fas fa-box',
                },
            },
        },
    },
}
