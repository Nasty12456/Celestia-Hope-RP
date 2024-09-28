fx_version 'cerulean'
game 'gta5'

author 'QBCore Store Since 2020'
description 'only buy from discord.gg/qbcoreframework'
version '9 Special Edition'



client_scripts {
    'client/*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua',
}

shared_scripts { 
    'config/config.lua',
    'config/config_langue.lua',
    'config/lang.lua',
    'config/config_motels.lua'
}

ui_page {
    'html/index.html'
}

files {
    'html/style.css',
    'html/index.html',
    'html/script.js',
    'html/img/*.png',
    'html/img/*.svg',
    'html/img/*.gif'
}
lua54 "yes"

escrow_ignore {
    'config/*.lua',
}
dependency '/assetpacks'