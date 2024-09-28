fx_version 'cerulean'

game 'gta5'

author '0Resmon'

description 'Created by 0Resmon Studios'

version '1.0.0'

shared_scripts {
	'Config.lua'
}

client_scripts {
	'Client/*.lua'
}

server_scripts {
	'Server/*.lua'
}

ui_page 'UI/dist/index.html'

lua54 'yes'

escrow_ignore {
	'Client/*.lua',
	'Server/*.lua',
	'Config.lua'
}

files {
    'UI/dist/index.html',
	'UI/dist/assets/*.*',
	'UI/dist/fonts/*.*',
}

dependency '2na_core'
dependency '/assetpacks'