fx_version 'cerulean'
game 'gta5'
lua54 'yes'

shared_script 'config.lua'

client_scripts {
    'client/utils.lua',
    'client/main.lua',
}

server_scripts {
    'server/utils.lua',
    'server/gifts.lua',
    'server/main.lua',
}

ui_page 'ui/index.html'

files {
    'ui/**/*.*',
    'ui/*.*',
}

escrow_ignore{
    'config.lua',
    'server/*.lua',
    'client/*.lua',
}
dependency '/assetpacks'