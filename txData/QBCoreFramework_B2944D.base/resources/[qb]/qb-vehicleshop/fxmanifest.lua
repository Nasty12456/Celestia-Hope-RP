fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'QBCore Store Since 2020'
description 'only buy from discord.gg/qbcoreframework'
version '9 Special Edition'


shared_scripts {
	'config/config.vehicles.lua',
	'config/config.lua',
}

client_scripts {
	'config/config.client.lua',
	'client/*.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua',
	'config/config.server.lua',
}

ui_page 'html/ui.html'

files {
	'html/**/*.*',
	'html/*.*',
	'config/translation.js'
}

exports {
	'GeneratePlate' -- exports['qb-vehicleshop']:GeneratePlate() <-- its generating plate
}

escrow_ignore {
	'config/*.lua'
}
dependency '/assetpacks'