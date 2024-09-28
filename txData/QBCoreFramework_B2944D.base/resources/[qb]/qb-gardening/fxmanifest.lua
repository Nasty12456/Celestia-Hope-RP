fx_version 'cerulean'
game 'gta5'

author 'QBCore Store Since 2020'
description 'only buy from discord.gg/qbcoreframework'
version '9 Special Edition'



shared_script 'config.lua'
client_script 'client/main.lua'
server_script 'server/main.lua'

dependencies {
    'qb-core',
    'PolyZone',
    'qb-target'
}

escrow_ignore {
	'config.lua'
}  

lua54 'yes'
dependency '/assetpacks'