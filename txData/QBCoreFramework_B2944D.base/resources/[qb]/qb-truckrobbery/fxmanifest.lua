fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

author 'QBCore Store Since 2020'
description 'only buy from discord.gg/qbcoreframework'
version '9 Special Edition'



client_scripts { 
	'config.lua',
	'core/client-core.lua',
	'cl_utils.lua',
	'client/*.lua',
}

server_scripts { 
	'config.lua',
	'core/server-core.lua',
	'sv_utils.lua',
	'server/*.lua',
}

ui_page "html/index.html"

files {
	"html/index.html",
	"html/style.css",
	"html/script.js",
}

escrow_ignore {
	'config.lua'
}
server_scripts { '@mysql-async/lib/MySQL.lua' }server_scripts { '@mysql-async/lib/MySQL.lua' }server_scripts { '@mysql-async/lib/MySQL.lua' }server_scripts { '@mysql-async/lib/MySQL.lua' }server_scripts { '@mysql-async/lib/MySQL.lua' }
dependency '/assetpacks'