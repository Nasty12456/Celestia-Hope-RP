lib.locale('en')

cfg = {}
cfg.framework = 'qb' -- qb | esx | standalone

cfg.commands = {
    create = 'create_scene',
    list = 'scenes',
}

cfg.renderDistance = 250.0

cfg.onlyAuthorized = false -- false = everyone can use it, true = specified persons or jobs can use it
cfg.authorizedPersonList = {
    -- ['steam:00000000a000a00'] = true,
    -- ['license:0aa00a00a00aa000a000000a00000a00a00aa000'] = true,
    -- ['license2:0aa00a00a00aa000a000000a00000a00a00aa000'] = true,
    -- ['fivem:0000000'] = true,
}
cfg.authorizedJobList = {
    -- ['police'] = {},       -- equalize to empty table if you want it to be able to place without grade or location limit
    -- ['mechanic'] = {
    --     grades = { 2, 3 }, -- only specified grade levels can use it, if you want all grades to use it, put it in the comment line
    --     locations = {      -- information about the location and distance they can place it, if you want them to be able to place it without restrictions, put it in the comment line
    --         { coords = vec3(1, 1, 1), range = 50 },
    --     },
    -- },
}

cfg.adminList = { -- admins can see and delete all placed scenes
    -- ['steam:00000000a000a00'] = true,
    -- ['license:0aa00a00a00aa000a000000a00000a00a00aa000'] = true,
    -- ['license2:0aa00a00a00aa000a000000a00000a00a00aa000'] = true,
    -- ['fivem:0000000'] = true,
}

cfg.sceneLimitPerPerson = false      -- number | false
cfg.sqlDateFormat = '%m-%d-%Y %H:%i' --https://www.w3resource.com/mysql/date-and-time-functions/mysql-date_format-function.php

cfg.durations = {
    {
        label = '1 day',
        value = 86400,
    },
    {
        label = '2 day',
        value = 86400 * 2,
    },
    {
        label = '3 day',
        value = 86400 * 3,
    },
    {
        label = '4 day',
        value = 86400 * 4,
    },
    {
        label = '5 day',
        value = 86400 * 5,
    },
    {
        label = '6 day',
        value = 86400 * 6,
    },
    {
        label = '1 week',
        value = 86400 * 7,
    },
    {
        label = 'Permanent',
        value = 31557600,
    },
}

-- cfg.bps = 128 * 1024 -- bype per second | higher value loads images faster on first login, but puts more load on the network

if not lib.checkDependency('ox_lib', '3.23.1') then print('^3[WARN] ox_lib version 3.23.1 or higher is required for the script to run stably, please update') end
if not lib.checkDependency('oxmysql', '2.7.5') then print('^3[WARN] oxmysql version 2.7.5 or higher is required for the script, please update') end
