--[[
    Welcome to the qs-weed configuration!
    To start configuring your new asset, please read carefully
    each step in the documentation that we will attach at the end of this message.

    Each important part of the configuration will be highlighted with a box.
    like this one you are reading now, where I will explain step by step each
    configuration available within this file.

    This is not all, most of the settings, you are free to modify it
    as you wish and adapt it to your framework in the most comfortable way possible.
    The configurable files you will find all inside client/custom/*
    or inside server/custom/*.

    Direct link to the resource documentation, read it before you start:
    https://docs.quasar-store.com/information/welcome
]]

Config = {}
Locales = {}

--[[
    The first thing will be to choose our main language, here you can choose
    between the default languages that you will find within locales/*,
    if yours is not there, feel free to create it!

	Languages available by default:
    	'de'
    	'en'
    	'es'
    	'fr'
    	'lt'
    	'pt'
		'ru'
		'zh-CN'
]]

Config.Language = 'en'

--[[
    The current system will detect if you use qb-core or es_extended,
    but if you rename it, you can remove the value from Config.Framework
    and add it yourself after you have modified the framework files inside
    this script.

    Please keep in mind that this code is automatic, do not edit if
    you do not know how to do it.
]]

local esxHas = GetResourceState('es_extended') == 'started'
local qbHas = GetResourceState('qb-core') == 'started'
local qbxHas = GetResourceState('qbx_core') == 'started'

Config.Framework = esxHas and 'esx' or qbxHas and 'qbx' or qbHas and 'qb' or 'standalone'

--[[
    General settings of the asset, you can edit the growth time, add random areas on the map
    for plantations, but do not touch the last settings as it could completely damage the asset
]]

Config.PoliceJobs = { -- Choose the jobs suitable for creating houses
    'police',
    'sheriff'
}

Config.HarvestTime = (60 * 1000) * 9.6
Config.MaxPlants = 10 -- Number of plants per house

Config.WeedArea = {   -- You can create random areas
    {
        id = 'weed-area-01',
        minZ = 1,
        maxZ = 800,
        points = {
            vec3(3140.91, 4104.55, 77.57),
            vec3(2092.42, 1953.03, 77.57),
            vec3(3122.73, 1595.45, 77.57),
            vec3(3728.79, 3989.39, 77.57)
        }
    }
}

-- Ignore me, otherwise I will break...
Config.Plants = {
    ['og-kush'] = {
        ['label'] = 'OG Kush',
        ['item'] = 'ogkush',
        ['stages'] = {
            ['stage-a'] = 'bkr_prop_weed_01_small_01c',
            ['stage-b'] = 'bkr_prop_weed_01_small_01b',
            ['stage-c'] = 'bkr_prop_weed_01_small_01a',
            ['stage-d'] = 'bkr_prop_weed_med_01b',
            ['stage-e'] = 'bkr_prop_weed_lrg_01a',
            ['stage-f'] = 'bkr_prop_weed_lrg_01b',
            ['stage-g'] = 'bkr_prop_weed_lrg_01b',
        },
        ['highestStage'] = 'stage-g'
    },
    ['amnesia'] = {
        ['label'] = 'Amnesia',
        ['item'] = 'amnesia',
        ['stages'] = {
            ['stage-a'] = 'bkr_prop_weed_01_small_01c',
            ['stage-b'] = 'bkr_prop_weed_01_small_01b',
            ['stage-c'] = 'bkr_prop_weed_01_small_01a',
            ['stage-d'] = 'bkr_prop_weed_med_01b',
            ['stage-e'] = 'bkr_prop_weed_lrg_01a',
            ['stage-f'] = 'bkr_prop_weed_lrg_01b',
            ['stage-g'] = 'bkr_prop_weed_lrg_01b',
        },
        ['highestStage'] = 'stage-g'
    },
    ['skunk'] = {
        ['label'] = 'Skunk',
        ['item'] = 'skunk',
        ['stages'] = {
            ['stage-a'] = 'bkr_prop_weed_01_small_01c',
            ['stage-b'] = 'bkr_prop_weed_01_small_01b',
            ['stage-c'] = 'bkr_prop_weed_01_small_01a',
            ['stage-d'] = 'bkr_prop_weed_med_01b',
            ['stage-e'] = 'bkr_prop_weed_lrg_01a',
            ['stage-f'] = 'bkr_prop_weed_lrg_01b',
            ['stage-g'] = 'bkr_prop_weed_lrg_01b',
        },
        ['highestStage'] = 'stage-g'
    },
    ['ak47'] = {
        ['label'] = 'AK 47',
        ['item'] = 'ak47',
        ['stages'] = {
            ['stage-a'] = 'bkr_prop_weed_01_small_01c',
            ['stage-b'] = 'bkr_prop_weed_01_small_01b',
            ['stage-c'] = 'bkr_prop_weed_01_small_01a',
            ['stage-d'] = 'bkr_prop_weed_med_01b',
            ['stage-e'] = 'bkr_prop_weed_lrg_01a',
            ['stage-f'] = 'bkr_prop_weed_lrg_01b',
            ['stage-g'] = 'bkr_prop_weed_lrg_01b',
        },
        ['highestStage'] = 'stage-g'
    },
    ['purple-haze'] = {
        ['label'] = 'Purple Haze',
        ['item'] = 'purplehaze',
        ['stages'] = {
            ['stage-a'] = 'bkr_prop_weed_01_small_01c',
            ['stage-b'] = 'bkr_prop_weed_01_small_01b',
            ['stage-c'] = 'bkr_prop_weed_01_small_01a',
            ['stage-d'] = 'bkr_prop_weed_med_01b',
            ['stage-e'] = 'bkr_prop_weed_lrg_01a',
            ['stage-f'] = 'bkr_prop_weed_lrg_01b',
            ['stage-g'] = 'bkr_prop_weed_lrg_01b',
        },
        ['highestStage'] = 'stage-g'
    },
    ['white-widow'] = {
        ['label'] = 'White Widow',
        ['item'] = 'whitewidow',
        ['stages'] = {
            ['stage-a'] = 'bkr_prop_weed_01_small_01c',
            ['stage-b'] = 'bkr_prop_weed_01_small_01b',
            ['stage-c'] = 'bkr_prop_weed_01_small_01a',
            ['stage-d'] = 'bkr_prop_weed_med_01b',
            ['stage-e'] = 'bkr_prop_weed_lrg_01a',
            ['stage-f'] = 'bkr_prop_weed_lrg_01b',
            ['stage-g'] = 'bkr_prop_weed_lrg_01b',
        },
        ['highestStage'] = 'stage-g'
    },
}

-- Ignore me, otherwise I will break...
Config.Props = {
    ['stage-a'] = 'bkr_prop_weed_01_small_01c',
    ['stage-b'] = 'bkr_prop_weed_01_small_01b',
    ['stage-c'] = 'bkr_prop_weed_01_small_01a',
    ['stage-d'] = 'bkr_prop_weed_med_01b',
    ['stage-e'] = 'bkr_prop_weed_lrg_01a',
    ['stage-f'] = 'bkr_prop_weed_lrg_01b',
    ['stage-g'] = 'bkr_prop_weed_lrg_01b',
}

local implemenetCaches = {}
function ImplementError(name)
    if implemenetCaches[name] then
        return
    end
    print('^1[IMPLEMENT ERROR]^7', name)
    implemenetCaches[name] = true
end
