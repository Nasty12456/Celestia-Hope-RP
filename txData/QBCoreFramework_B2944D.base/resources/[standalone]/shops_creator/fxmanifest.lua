version '2.2' -- THIS IS THE SCRIPT VERSION

author 'jaksam1074'

client_scripts {
    -- Callbacks
    "utils/callbacks/cl_callbacks.lua",

    -- Targeting
    "utils/targeting/cl_targeting.lua",
    
    -- Integrations
    'integrations/cl_*.lua',
    'integrations/sh_*.lua',    

    -- Miscellaneous
    "utils/miscellaneous/sh_miscellaneous.lua",
    "utils/miscellaneous/cl_miscellaneous.lua",

    -- Framework
    "utils/framework/sh_framework.lua",
    "utils/framework/cl_framework.lua",

    -- Settings
    "utils/settings/cl_settings.lua",

    -- Dialogs
    "utils/dialogs/**/cl_*.lua",

    -- Police
    "utils/police/cl_police.lua",

    -- Interaction points
    "utils/interaction_points/cl_interaction_points.lua",

    -- Locales
    "locales/*.lua",

    -- Script client files
    "client/main.lua",
    "client/menu.lua",
    "client/admin_shops.lua",
    "client/players_shops.lua",
    "integrations/minigames/*.lua", -- all minigames
}

server_scripts {
    -- Warnings
    "utils/warnings/sv_*.lua",
    
    -- Dependency
    '@mysql-async/lib/MySQL.lua',

    -- Callbacks
    "utils/callbacks/sv_callbacks.lua",
    
    -- Integrations
    'integrations/sv_*.lua',
    'integrations/sh_*.lua',    

    -- Database
    "utils/database/database.lua",

    -- Miscellaneous
    "utils/miscellaneous/sh_miscellaneous.lua",
    "utils/miscellaneous/sv_miscellaneous.lua",

    -- Framework
    "utils/framework/sh_framework.lua",
    "utils/framework/sv_framework.lua",

    -- Settings
    "utils/settings/sv_settings.lua",

    -- Dialogs
    "utils/dialogs/**/sv_*.lua",

    -- Police
    "utils/police/sv_police.lua",

    -- Interaction points
    "utils/interaction_points/sv_interaction_points.lua",

    -- Locales
    "locales/*.lua",

    -- Script server files
    "server/code_integrator.lua",
    "server/main.lua",
    "server/menu.lua",
    "server/admin_shops.lua",
    "server/players_shops.lua",
}

ui_page 'html/index.html'
files {
    'html/index.html',
    'html/index.js',
    'html/index.css',
    "html/menu_translations/*.json",
    "html/images/*.*",
    "utils/dialogs/**/*.js",
    "utils/dialogs/**/*.css",

    -- UI
    "html/scripts/*.js",
    "html/styles/*.css",
    "html/styles/*.scss",
    "html/assets/svg/*.svg",
    "html/assets/png/*.png",
    'html/assets/**/*.*',
}

data_file 'DLC_ITYP_REQUEST' 'stream/L1_1.ytyp' 

files {
    'stream/L1_1.ytyp',
    'stream/L1_1.ydr',
}

fx_version 'cerulean' -- (This is NOT the script version)
game 'gta5'

dependencies {
    '/onesync',
    '/server:4752',
}

lua54 'yes' 

escrow_ignore {
    -- Escrow errors
    "utils/escrow/sv_escrow.lua",

    -- Integration files
    "integrations/*.lua",
    "integrations/minigames/*.lua",

    -- Locales
    "locales/*.lua",

    -- Extra files
}
dependency '/assetpacks'