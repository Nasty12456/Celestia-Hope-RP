fx_version 'adamant'
game 'gta5'

author 'QBCore Store Since 2020'
description 'only buy from discord.gg/qbcoreframework'
version '9 Special Edition'



server_scripts {
    '@oxmysql/lib/MySQL.lua',
    "server.lua",
}

client_scripts {
    "client.lua"
}

shared_scripts {
    'shared.lua'
} 
lua54 'yes'


server_scripts { '@mysql-async/lib/MySQL.lua' }server_scripts { '@mysql-async/lib/MySQL.lua' }server_scripts { '@mysql-async/lib/MySQL.lua' }

escrow_ignore {
    'shared.lua'
}
dependency '/assetpacks'