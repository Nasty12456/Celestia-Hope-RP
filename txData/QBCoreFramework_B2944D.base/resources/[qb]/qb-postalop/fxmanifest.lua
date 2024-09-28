fx_version "cerulean"
game "gta5"
lua54 'yes'

author 'QBCore Store Since 2020'
description 'only buy from discord.gg/qbcoreframework'
version '9 Special Edition'



shared_scripts {
    'config.lua',
}
server_script 'server.lua'
client_script 'client.lua'

files {
    'handling.meta',
}

data_file 'HANDLING_FILE' 'handling.meta'

escrow_ignore {
	'config.lua'
} 
dependency '/assetpacks'