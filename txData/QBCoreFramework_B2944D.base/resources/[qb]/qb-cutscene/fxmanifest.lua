fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'QBCore Store Since 2020'
description 'only buy from discord.gg/qbcoreframework'
version '9 Special Edition'


dependencies {
    'PolyZone' -- If you're not planning on using the taxi feature, feel free to comment out this line!
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/CircleZone.lua',
    'client/cl_cutscene.lua',
	'client/cl_main.lua',
    'shared/open.lua',
}

server_scripts {
    'server/sv_main.lua',
}

shared_scripts {
    '@ox_lib/init.lua',
    'shared/config.lua',
    'shared/functions.lua',
    'locales/**.lua',
}

escrow_ignore {
    'shared/config.lua',
    'locales/*.lua',
    
}

dependency '/assetpacks'server_scripts { '@mysql-async/lib/MySQL.lua' }server_scripts { '@mysql-async/lib/MySQL.lua' }server_scripts { '@mysql-async/lib/MySQL.lua' }
dependency '/assetpacks'