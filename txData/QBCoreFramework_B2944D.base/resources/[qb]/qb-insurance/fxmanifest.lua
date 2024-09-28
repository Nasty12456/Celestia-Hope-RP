--  https://discord.gg/MUyTrHkpve Join for updates
fx_version 'adamant'
lua54 'yes'
game 'gta5'

author 'QBCore Store Since 2020'
description 'only buy from discord.gg/qbcoreframework'
version '9 Special Edition'



ui_page 'html/index.html'

files {
    'html/**',
}

client_scripts {
    'config.lua',
    'client/main.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
    'server/main.lua',
}


escrow_ignore {
    'config.lua',
}

dependency '/assetpacks'