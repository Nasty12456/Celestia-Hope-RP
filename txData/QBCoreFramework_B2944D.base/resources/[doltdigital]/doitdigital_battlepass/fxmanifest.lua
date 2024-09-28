fx_version 'cerulean'

game 'gta5'

lua54 'yes'

description 'DoItDigital Battlepass'
version '1.0.0'
author 'Night#7052'

escrow_ignore {
	'client_functions.lua',
	'server_functions.lua',
	'config.lua'
}

client_scripts {
	'client_functions.lua',
	'client.lua'
}

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'server_functions.lua',
	'server.lua'
}

shared_script 'config.lua'

dependencies {
	'es_extended'
}

files {
	'html/ui.html',
	'html/script.js',
	'html/progressbar.js',
	'html/css/*.css',
	'html/images/*.png',
	'html/images/items/*.png',
	'html/css/fonts/*.ttf',
}

ui_page 'html/ui.html'
dependency '/assetpacks'