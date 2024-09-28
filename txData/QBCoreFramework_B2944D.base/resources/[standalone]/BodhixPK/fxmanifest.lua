fx_version 'cerulean'
game 'gta5'

name 'BodhixPK'
description 'Parkour & Freerunning Career'
author 'Bodhix'
version '2.0.0'

lua54 'yes'

client_scripts {
    'Client/*.net.dll',
    'Client/*.net.lua',
    'Config.lua',
}

server_scripts {
    'server/sv.lua',
    'Whitelist.lua',
}

files {
    'stream/parkour@anims.ycd',
    'stream/bodhix@tricking@anims.ycd',
    'stream/bodhix@tricks@anims.ycd',
    'stream/bodhix@vaults@anims.ycd',
    'stream/parkour_part_2@anim.ycd',
    'html/index.html',
    'html/DoubleArabian.MP3',
    'html/Arabian.MP3',
    'html/Back.MP3',
    'html/CarlWheel.MP3',
    'html/Dash.MP3',
    'html/DFlip.MP3',
    'html/Flip.MP3',
    'html/Fly.MP3',
    'html/Full.MP3',
    'html/HighTricks.MP3',
    'html/Kash.MP3',
    'html/Monkey.MP3',
    'html/Reverse.MP3',
    'html/Roll.MP3',
    'html/Wallrun.MP3',
    'html/Climb.MP3',
    'html/Ledge.MP3',
    'server/version.json',
}

ui_page 'html/index.html'

nui_page 'html/index.html'

escrow_ignore {
    'Config.lua',
    'Whitelist.lua',
}





dependency '/assetpacks'