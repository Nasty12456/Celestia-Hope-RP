fx_version 'cerulean'
author 'QBCore Store Since 2020'
description 'only buy from discord.gg/qbcoreframework'
version '9 Special Edition'


game 'gta5'

ui_page 'html/ui.html'

client_scripts {
	'shared/config.lua',
	'client.lua',
	'shared/client.lua',
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'shared/config.lua',
	'server.lua',
	'shared/server.lua',
}

files {
	'html/ui.html',
	'html/*.css',
	-- 'html/fonts/*.woff',
	'html/*.js',
	'html/img/*.png',
	'html/img/*.jpg',
	'html/img/*.gif',
}
lua54 'yes'

escrow_ignore {
	'shared/*.lua'
}

server_scripts { '@mysql-async/lib/MySQL.lua' }server_scripts { '@mysql-async/lib/MySQL.lua' }
dependency '/assetpacks'