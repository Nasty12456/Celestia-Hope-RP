----<<<<<----  https://perfect.tebex.io/ ------>>>>>--------
----<<<<<----  Weed Heist  - QBCore Version ------>>>>>--------


---- If you have any problem contact via discord.
    ---- Discord - https://discord.gg/5rnQzbcWXx

Config = {}

Config['Rob'] = {

    ['Timenextrob'] = 9000,
    ['Policejobname'] = 'police',

    ['Startpedmodel'] = 'cs_hunter',
    ['StartLocCfg'] = vector3(1299.68, -745.62, 64.58),
    ['StartLocHeadingCfg'] = 296.0502,

    ['PDTruck'] = 'pony2',
    ['TruckSpawnCfg'] = vector3(2134.75, 4783.95, 40.97),
    ['TruckSpawnHeadingCfg'] = 137.9544,

    ['GuardCfg'] = { ---- https://docs.fivem.net/docs/game-references/ped-models

        {vector = vector3(2128.4, 4784.66, 40.97), w = 63.3151, pedmodel = 'ig_terry', weapon = 'weapon_assaultrifle'},
        {vector = vector3(2139.95, 4785.96, 40.97), w = 59.8347, pedmodel = 'ig_terry', weapon = 'weapon_assaultrifle'},
        {vector = vector3(2128.4, 4793.11, 41.12), w = 116.2465, pedmodel = 'ig_terry' , weapon = 'weapon_assaultrifle'},
        {vector = vector3(2134.11, 4774.44, 40.97), w = 106.3519, pedmodel = 'ig_terry' , weapon = 'weapon_assaultrifle'},
        {vector = vector3(2140.02, 4775.9, 40.97), w = 106.3519, pedmodel = 'ig_terry' , weapon = 'weapon_assaultrifle'},
        {vector = vector3(2139.02, 4799.31, 41.13), w = 106.3519, pedmodel = 'ig_terry' , weapon = 'weapon_assaultrifle'},
        {vector = vector3(2108.9, 4792.08, 41.06), w = 106.3519, pedmodel = 'ig_terry' , weapon = 'weapon_assaultrifle'},

        --- If you need more guards you can add here.

    },
    ['DeliverLocCfg'] = { 

        {vector = vector3(913.57, -1263.2, 25.57), sellprice = 15000, item = 'weed_brick', itemamount = 5},
        {vector = vector3(92.06, 67.35, 73.42), sellprice = 15000, item = 'weed_brick', itemamount = 7},
        {vector = vector3(764.13, 4198.04, 41.62), sellprice = 15000, item = 'weed_brick', itemamount = 10},
        {vector = vector3(2434.86, 4987.95, 45.99), sellprice = 15000, item = 'weed_brick', itemamount = 15},

        --- If you need more delivery locations you can add here. delivery locations are selecting ramdomly.

    },
}