fx_version 'cerulean'
game 'gta5'

author 'QBCore Store Since 2020'
description 'only buy from discord.gg/qbcoreframework'
version '9 Special Edition'


shared_scripts { 
    '@qb-garages/config.lua',
	'config.lua'
}

server_scripts {
    'server/main.lua',
    '@oxmysql/lib/MySQL.lua',
}

client_script 'client/main.lua'

ui_page "html/index.html"

files {
    'html/index.html',
    'html/index.js',
    'html/index.css',
    'html/reset.css'
}


lua54 "yes"

escrow_ignore {
	'config.lua'
}
dependency '/assetpacks'