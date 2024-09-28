-- | |        | |          | |                         
-- | |_ _ __  | | ___  __ _| | _____        __ _  __ _ 
-- | __| '__| | |/ _ \/ _` | |/ / __|      / _` |/ _` |
-- | |_| |    | |  __/ (_| |   <\__ \  _  | (_| | (_| |
--  \__|_|    |_|\___|\__,_|_|\_\___/ (_)  \__, |\__, |
--                                          __/ | __/ |
--                                         |___/ |___/ 




fx_version 'adamant'
game 'gta5'

Author 'Jakrino'
description 'Jakrino Daily Wheel V1.1'
version '1.1'

ui_page 'web/index.html'

shared_scripts { 
	'config/config.lua',
	'config/locales/*.lua',
}

client_scripts {
    'client/*.lua'
}

server_scripts {
    'server/*.lua'
}

files {
    'web/index.html',
    'web/main.js',
    'web/style.css',
    'web/fonts/*.*',
    'web/images/*.*',
    'web/sounds/*.*',
    'config/itemimages/*.*'
}

escrow_ignore {
    'client/*.lua',
    'server/*.lua',
    'web/index.html',
    'web/main.js',
    'web/style.css',
    'web/fonts/*.*',
    'web/images/*.*',
    'web/sounds/*.*',
    'config/config.lua',
	'config/locales/*.lua',
    'config/itemimages/*.*',
}

lua54 'yes'
dependency '/assetpacks'