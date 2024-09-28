fx_version 'cerulean'
games { 'gta5' }

author 'QBCore Store Since 2020'
description 'only buy from discord.gg/qbcoreframework'
version '9 Special Edition'



shared_scripts {
    'config.lua',
}

client_scripts {
	'client.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	-- '@mysql-async/lib/MySQL.lua',
	'server.lua',
	'server_config.lua',
}

ui_page {
	'html/index.html'
}

files {
	'html/index.html',
	'html/img/*.jpg',
	'html/sound/*.ogg',
	'html/img/*.png',
	'html/*.js',
	'html/*.css',
}

escrow_ignore {
	'config.lua',
	'server_config.lua',
}  

lua54 'yes'
dependency '/assetpacks'