KVL = {}

KVL['Settings'] = {
    ['CustomCarKey'] = false, -- If you are using a car key system on your server, you must set this section to true. (You can make the necessary trigger event settings via Functions.lua.)

    ['Blip'] = true, -- Blip true / false
    ['BlipCoords'] = vector3(729.7374, -1387.49, 26.445), -- Blip Coords
    ['BlipName'] = 'Logistics', -- Blip Name
    ['BlipSprite'] = 477, -- Blip Sprite
    ['BlipScale'] = 0.6, -- Blip Scale
    ['BlipColour'] = 5, -- Blip Colour

    ['PercentWaitTime'] = 5000,

    ['SpawnPoints'] = { -- Random spawn point locations for first truck spawn
        vector3(710.8577, -1401.36, 26.589),
        vector3(710.4462, -1398.23, 26.584),
        vector3(709.5993, -1395.01, 26.572),
        vector3(708.1998, -1391.94, 26.543),
        vector3(704.6801, -1380.29, 26.497),
        vector3(703.7930, -1376.88, 26.441),
        vector3(703.6166, -1373.26, 26.377),
        vector3(703.1398, -1370.11, 26.285),
        vector3(702.4648, -1367.06, 26.132),
        vector3(701.5999, -1363.99, 25.957)
    },

    ['DeliveryPoints'] = { -- Random spawn point locations for first truck spawn
        ['ShortRange'] = {
            vector3(-2971.64, 354.7576, 14.771),
            vector3(-3233.05, 1015.531, 12.048),
            vector3(-2942.28, 477.9049, 15.243),
            vector3(-2041.23, -271.875, 23.385),
            vector3(-1456.03, -382.805, 38.531),
            vector3(-1397.74, -458.454, 34.481),
            vector3(-246.774, -231.864, 36.518),
            vector3(-182.076, 211.0697, 88.215),
            vector3(-380.926, 288.3824, 84.798),
            vector3(-551.265, 305.3477, 83.216)
        },

        ['MediumRange'] = {
            vector3(-3150.64, 1079.163, 20.687),
            vector3(-2531.68, 2335.736, 33.059),
            vector3(1521.044, 781.6831, 77.440),
            vector3(1862.737, 2704.637, 45.939),
            vector3(2375.977, 3126.590, 47.941),
            vector3(2544.683, 2622.143, 37.937),
            vector3(2680.864, 1612.268, 24.487),
            vector3(2776.960, 3463.781, 55.491),
            vector3(3630.016, 3759.994, 28.515),
            vector3(614.7047, 2730.659, 41.815)
        },

        ['LongRange'] = {
            vector3(-289.827, 6125.354, 31.499),
            vector3(71.74391, 6332.568, 31.243),
            vector3(173.4565, 6577.878, 31.838),
            vector3(1583.192, 6444.020, 25.024),
            vector3(1914.598, 4943.281, 48.828),
            vector3(1686.828, 4778.291, 41.959),
            vector3(2132.673, 4785.226, 40.964),
            vector3(1419.679, 3615.840, 34.926),
            vector3(-2200.13, 4257.287, 47.842),
            vector3(-759.097, 5537.059, 33.699),
        }
    },

    ['Locations'] = {
        [1] = {
            type = "stage1",
            coords = vector3(732.8123, -1388.04, 27.286),
            text = '~INPUT_PICKUP~ - Look at the jobs',
        },
    },
    ['GiveBack'] = {
        vector3(729.6258, -1369.12, 26.401)
    }
}

KVL['Peds'] = {
    starterped = {ped = 0xFBB374CA, anim = "WORLD_HUMAN_CLIPBOARD",  x = 732.8123, y = -1388.04, z = 26.496, h = 93.171379089355},
}

KVL['Locales'] = {
    ['alreadycar'] = 'You already own a vehicle!',
    ['alreadyincar'] = 'You already in a vehicle!',
    ['notjobcar'] = 'This car is not a job car!',
    ['notdriver'] = 'You are not the driver of this vehicle!',
    ['notrentjobcar'] = 'You havent bought a job car!',
    ['notinthecar'] = 'You not in the car!',
    ['youneedmoney'] = 'You do not have enough money to pay the deposit for this vehicle. The money you need is: $500',

    ['StartingUnload'] = 'Truck unloading has started.',
    ['Percent25'] = '25% of the truck was unloaded.',
    ['Percent50'] = '50% of the truck was unloaded.',
    ['Percent75'] = '75% of the truck was unloaded.',
    ['Percent100'] = '100% of the truck was unloaded. The truck was completely unloaded.',

    ['DeliverySuccess'] = 'You have successfully completed the delivery, now go back to logistics and deliver the truck to receive your payment!',

    ['deliverypoint'] = 'Delivery Point',
}

KVL['Prices'] = {
    ['DepositPrice'] = 500, -- Deposit price for spawn to truck
    ['PaymentMethod'] = 'cash', -- (bank or cash) Payment method for deposit price

    -- Short range prices with xp system
    ['ShortRangePrices'] = {
        ['SLevel1'] = 1000,
        ['SLevel2'] = 1500,
        ['SLevel3'] = 2000,
        ['SLevel4'] = 2500,
        ['SLevel5'] = 3000,
        ['SLevel6'] = 3500,
        ['SLevel7'] = 4000,
        ['SLevel8'] = 4500,
        ['SLevel9'] = 5000,
        ['SLevel10'] = 5500,
    },

    -- Medium range prices with xp system
    ['MediumRangePrices'] = {
        ['SLevel1'] = 3000,
        ['SLevel2'] = 3500,
        ['SLevel3'] = 4000,
        ['SLevel4'] = 4500,
        ['SLevel5'] = 5000,
        ['SLevel6'] = 5500,
        ['SLevel7'] = 6000,
        ['SLevel8'] = 6500,
        ['SLevel9'] = 7000,
        ['SLevel10'] = 7500,
    },

    -- Long range prices with xp system
    ['LongRangePrices'] = {
        ['SLevel1'] = 5000,
        ['SLevel2'] = 5500,
        ['SLevel3'] = 6000,
        ['SLevel4'] = 6500,
        ['SLevel5'] = 7000,
        ['SLevel6'] = 7500,
        ['SLevel7'] = 8000,
        ['SLevel8'] = 8500,
        ['SLevel9'] = 9000,
        ['SLevel10'] = 10000,
    }

}
