fx_version 'cerulean'

description 'S1nScripts Bank System'
author 'S1nScripts'
version '1.27.4'

lua54 'yes'

game 'gta5'

shared_scripts {
    'configuration/shared/**/**',

    'src/shared/*'
}

client_scripts {
    'languages/english.lua',

    'src/client/events.lua',
    'src/client/nui.lua',
    'src/client/functions.lua',
    'src/client/threads.lua',
    'src/client/api.lua',

    'src/client/init.lua',
}

server_scripts {
    'languages/english.lua',

    'configuration/server/**/**',

    'src/server/sql.lua',
    'src/server/functions.lua',
    'src/server/init.lua',
    'src/server/constants.lua',
    'src/server/storage.lua',
    'src/server/events.lua',
    'src/server/threads.lua',
    'src/server/commands.lua',
    'src/server/api.lua',
}

ui_page 'src/web/index.html'

files {
    'src/web/*',
    'src/web/img/*',
    'src/web/font/*'
}

dependencies {
    '/onesync',
    's1n_lib'
}

escrow_ignore {
    "**.*",
}

dependency '/assetpacks'