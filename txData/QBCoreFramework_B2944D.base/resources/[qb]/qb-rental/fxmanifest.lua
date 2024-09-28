fx_version 'cerulean'
game 'gta5'

author 'QBCore Store Since 2020'
description 'only buy from discord.gg/qbcoreframework'
version '9 Special Edition'



shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua'
}

client_scripts {
    'client/main.lua'
}

server_script {
    'server/main.lua'
}

dependency 'qb-target'


escrow_ignore {
	'config.lua',
    'locales/*.lua'
} 

lua54 'yes'
dependency '/assetpacks'