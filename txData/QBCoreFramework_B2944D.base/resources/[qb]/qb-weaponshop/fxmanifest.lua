fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'QBCore Store Since 2020'
description 'only buy from discord.gg/qbcoreframework'
version '9 Special Edition'


shared_scripts {
	'config.lua',
}

client_scripts {
	'client/*.lua',
}

server_scripts {
	'server/*.lua',
}

ui_page 'html/ui.html'

files {
	'html/*.*',
	'html/images/*.*',
}

escrow_ignore {
	'config.lua'
}
dependency '/assetpacks'
dependency '/assetpacks'