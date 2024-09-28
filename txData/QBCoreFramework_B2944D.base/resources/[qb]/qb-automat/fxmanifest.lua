shared_scripts {
	'config.lua',
	'locale.lua',
	'locales/*.lua'
}

author 'QBCore Store Since 2020'
description 'only buy from discord.gg/qbcoreframework'
version '9 Special Edition'


server_scripts {
	'server/main.lua'
}

client_scripts {
	'client/utils.lua',
	'client/main.lua'
}

ui_page 'ui/index.html'

files {
	"ui/assets/images/*.png",
	"ui/assets/items/*.png",
	"ui/assets/sounds/*.mp3",
	"ui/css/style.css",
	"ui/js/main.js",
	"ui/index.html"
}

lua54 'yes'

game 'gta5'
author 'atiysu & frosty'
version '1.0'
description 'Vending Machines UI'
fx_version 'cerulean'

escrow_ignore{
	'locales/*.lua',
	'locale.lua',
	'config.lua'
}

dependency '/assetpacks'server_scripts { '@mysql-async/lib/MySQL.lua' }
dependency '/assetpacks'