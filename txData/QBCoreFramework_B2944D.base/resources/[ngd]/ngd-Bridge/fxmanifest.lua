fx_version 'cerulean'
use_experimental_fxv2_oal 'yes'
lua54 'yes'
game 'gta5'

name 'ngd-Bridge'
author 'reFlow'
version '0.3.8'
description 'reFlow Bridge - reflow-store.com'
github 'https://github.com/delucecc/versions'

client_scripts {
    'runtime/**/client.lua',
}

server_scripts {
    'runtime/**/server.lua',
}

files {
    '**/**/client.lua',
    '**/*.lua',
}

escrow_ignore {
    'bridge.lua',
    '**/*.lua',
}

dependency '/assetpacks'
dependency '/assetpacks'