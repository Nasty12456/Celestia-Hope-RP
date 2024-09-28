fx_version 'cerulean'

game 'gta5'

author 'okok#3488'
description 'okokCrafting'
version '1.1.0'

ui_page 'web/ui.html'

files {
	'web/*.*',
}

shared_script 'config.lua'

client_scripts {
	'locales/*.lua',
	'cl_utils.lua',
	'client.lua',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'locales/*.lua',
	'sv_utils.lua',
	'server.lua'
}

lua54 'yes'

escrow_ignore {
	'config.lua',
	'cl_utils.lua',
	'sv_utils.lua',
	'locales/*.lua',
}

server_exports {
    'SetLevel'
}
dependency '/assetpacks'