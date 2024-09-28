fx_version 'cerulean'
game 'gta5'

author '0BugScripts Remastered: <0bugscripts.tebex.io>'
description 'zr-loading'
version '1.0.0'
lua54 'yes'

client_script {
    'zr-build/*'
}

server_script {
    'zr-build/*'
}

ui_page 'zr-nui/zr-index.html'

files { 
    '/*',
    '/zr-assets/*',
    '/zr-assets/img/*',
    '/zr-assets/video/*',
    '/zr-assets/news/*',
    '/zr-assets/top-slider/*',
    '/zr-assets/options/*',
    '/zr-assets/links/*',
    '/zr-assets/team/*',
    '/zr-assets/music/*',
    '/zr-assets/musicpics/*',
}

escrow_ignore {
    'zr-build/zr-config.lua'
}

loadscreen '/index.html'
loadscreen_cursor 'yes'
loadscreen_manual_shutdown 'yes'

dependency '/assetpacks'