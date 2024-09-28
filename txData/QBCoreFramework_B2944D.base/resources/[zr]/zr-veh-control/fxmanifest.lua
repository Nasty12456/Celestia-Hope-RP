fx_version 'cerulean'
game 'gta5'

author '0BugScripts Remastered: <0bugscripts.tebex.io>'
description 'zr-veh-control'
version '1.0.0'

lua54 'yes'


shared_scripts {
    'zr-build/zr-config.lua',
}

client_scripts {
    'zr-build/zr-build-client.lua',
    'zr-build/zr-build-player.lua',
    'zr-build/zr-config.lua',
}

server_scripts {
    'zr-build/zr-build-server.lua'
}

ui_page 'index.html'

files {
    '*',
    'zr-assets/**',
    'zr-css/*',
    'zr-js/*',
    'zr-build/*'
}

escrow_ignore {
    'zr-build/zr-config.lua',
}
dependency '/assetpacks'