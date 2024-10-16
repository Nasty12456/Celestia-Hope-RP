Description 'ngd-dj | Nemesis Gaming Development'
author 'deluce#0'
name 'ngd-dj'
version '1.5'
bridge 'ngd-Bridge'
fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'
github 'https://github.com/delucecc/versions'


client_scripts {
    'client/client.lua',
}

server_scripts {
    'server/server.lua',
}

ui_page {
    'web/index.html',
}

shared_scripts {
    '@ngd-Bridge/bridge.lua',
}

escrow_ignore {
    "fxmanifest.lua",
    'web/css/*.css',
    'web/index.html',
}

dependencies {
    'xsound'
}

files {
    'web/*.*',
    'web/css/*.css',
    'web/js/*.js',
}

dependency '/assetpacks'