fx_version 'cerulean'
game 'gta5'
lua54 'yes'
name 'hud-stress'
author '0Resmon'
version '1.0.0'
description 'Stress script, Hud'
work_with 'ESX/QB latest version'

shared_scripts {
    '@ox_lib/init.lua',
    'locales/*.lua',
    'config.lua'
}

files {
    'locales/*.json',
}

client_script 'client.lua'
server_script 'server.lua'

dependencies { 'ox_lib' }

escrow_ignore {
    'client.lua',
    'server.lua',
    'config.lua',
    'locales/.json',
}

dependency '/assetpacks'