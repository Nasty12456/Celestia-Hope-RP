fx_version 'cerulean'
game 'gta5'

author '0BugScripts Remastered: <0bugscripts.tebex.io>'
desription 'zr-scoreboard'
version '1.0.0'

lua54 'yes'

shared_script 'zr-config/zr-config.lua'
client_script 'zr-build/zr-client/zr-client.lua'
server_scripts {
    'zr-build/zr-server/zr-avatar.lua',
    'zr-build/zr-server/zr-functions.lua',
    'zr-build/zr-bridge/**/zr-server.lua',
    'zr-build/zr-server/zr-server.lua',
}

ui_page 'zr-nui/index.html'
files {
    'zr-nui/index.html',
    'zr-nui/zr-css/*',
    'zr-nui/zr-assets/zr-icon/*',
    'zr-nui/zr-assets/zr-img/*',
    'zr-nui/zr-js/*',
}

escrow_ignore 'zr-config/zr-config.lua'
dependency '/assetpacks'