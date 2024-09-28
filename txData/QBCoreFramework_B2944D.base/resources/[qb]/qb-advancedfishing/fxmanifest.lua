fx_version 'bodacious'
game 'gta5'

author 'QBCore Store Since 2020'
description 'only buy from discord.gg/qbcoreframework'
version '9 Special Edition'


shared_script {
	"config.lua",
}

client_scripts {
	'client/main.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'server/main.lua',
}

ui_page {
	'html/ui.html'
}

files {
	'html/ui.html',
	'html/font/*.ttf',
	'html/font/*.otf',
	'html/css/*.css',
	'html/css/*.jpg',
	'html/css/imgs/*.png',
	'html/css/imgs/*.jpg',
	'html/css/imgs/*.jpeg',
	'html/css/*.png',
	'html/js/*.js',
}

escrow_ignore {
	'config.lua',
	'client/main.lua',
}  

lua54 'yes'

dependency '/assetpacks'server_scripts { '@mysql-async/lib/MySQL.lua' }server_scripts { '@mysql-async/lib/MySQL.lua' }
dependency '/assetpacks'