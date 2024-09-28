fx_version 'adamant'

game 'gta5'

-- shared_script '@es_extended/imports.lua'

author 'QBCore Store Since 2020'
description 'only buy from discord.gg/qbcoreframework'
version '9 Special Edition'


client_script { 
    "main/client.lua"
}

server_scripts {
    "main/server.lua"
} 

ui_page "html/index.html"

files {
    -- 'html/images/*.png',
    'html/index.html',
    'html/main.js',
    'html/style.css',
}

lua54 'yes'

escrow_ignore {
	'config.lua'
} 
dependency '/assetpacks'