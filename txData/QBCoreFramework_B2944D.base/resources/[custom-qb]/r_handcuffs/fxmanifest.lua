fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'rytrak.fr'
ui_page 'html/index.html'

files {
	'html/*'
}

escrow_ignore {
	'config.lua',
	'client/cl_utils.lua',
	'server/sv_utils.lua'
}

shared_script 'config.lua'

server_script {
	'server/sv_utils.lua',
    'server/server.lua'
}

client_scripts {
    'client/cl_utils.lua',
	'client/client.lua'
}

data_file "DLC_ITYP_REQUEST" "stream/props_handcuffs.ytyp"
dependency '/assetpacks'