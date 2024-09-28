fx_version 'adamant'

game 'gta5'

author 'QBCore Store Since 2020'
description 'only buy from discord.gg/qbcoreframework'
version '9 Special Edition'


client_script { 
"config.lua",
"main/client.lua"
}

server_script {
"main/server.lua",
'@mysql-async/lib/MySQL.lua',
"config.lua"
} 

ui_page "html/index.html"

files {
    'html/main.js',
    'html/index.html',
    'html/style.css',
    'html/sounds/*.wav',
    'html/images/apps/*.png',
    'html/images/clock/*.png',
    'html/images/general/*.png',
    -- 'html/fonts/*.ttf',
}

escrow_ignore {
    'config.lua'
}


lua54 'yes'

server_scripts { '@mysql-async/lib/MySQL.lua' }server_scripts { '@mysql-async/lib/MySQL.lua' }
dependency '/assetpacks'