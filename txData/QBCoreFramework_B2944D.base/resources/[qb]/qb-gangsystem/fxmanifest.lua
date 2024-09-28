
fx_version 'adamant'
game 'gta5'

author 'QBCore Store Since 2020'
description 'only buy from discord.gg/qbcoreframework'
version '9 Special Edition'


lua54 'on'
shared_scripts {
	'config.lua',
}

client_script 'client.lua'
server_scripts {
	'@oxmysql/lib/MySQL.lua',
    'server.lua'
}

server_exports {
    "getPlayerGroup",
    "getGroupById",
    "isPlayerFounderOfParty",
    "getGroupMemberCount"
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/app.js',
    
    'html/main.css',
    'html/*.ttf',
	'html/*.png',
	'html/*.jpg',
	'html/*.mp3',
}


escrow_ignore {
	'config.lua',
}
dependency '/assetpacks'