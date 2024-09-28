fx_version 'cerulean'

game 'gta5'

lua54 'yes'

description 'DoItDigital Crosshair'
version '1.0.3'
author 'Night#7052'

escrow_ignore {
	'server.lua',
	'config.lua'
}

client_script 'client.lua'
server_script 'server.lua'
shared_script 'config.lua'

files {
	'html/ui.html',
	'html/script.js',
	'html/images/*.png',
	'html/images/crosshairs/*.png',
	'html/images/crosshairs/*.gif',
	'html/css/fonts/*.ttf',
	'html/css/*.css'
}

ui_page 'html/ui.html'
dependency '/assetpacks'