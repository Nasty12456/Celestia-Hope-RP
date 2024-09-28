fx_version 'cerulean'
game 'gta5'

name 'BodhixBMX'
description 'BMX Career'
author 'Bodhix'
version '1.1.0'

lua54 'yes'

shared_scripts {
    'config.lua',
}

client_scripts {
    'Client/BMX.net.lua',
    'Client/BMXGames.lua',
}

server_scripts {
    'server/sv.lua',
    'server/games_sv.lua',
}

data_file 'HANDLING_FILE' 'data/handling.meta'

files {
    'data/handling.meta',
    'stream/bodhix@bmx@anims.ycd',
    'stream/bodhix@trickster@bmx.ycd',
    'stream/bmx@test.ycd',
    'html/index.html',
    'server/version.json',
    'html/LAADS-LoveYou.mp3',
    'html/MaxBrhon-AIMidtempo.mp3',
    "stream/NotzfireLeft.ydr",
	"stream/NotzfireRight.ydr",	
    'html/Rameses&Veela-NeverKnewMe.mp3',
    'html/RobbieMendez-HomeHouse.mp3',
    'html/Ghostnaps-GrowApartGarage.mp3',
    'html/Score.mp3',
    'html/MissScore.mp3',
}

ui_page 'html/index.html'

nui_page 'html/index.html'

data_file "DLC_ITYP_REQUEST" "stream/NotzfireLeft.ytyp"
data_file "DLC_ITYP_REQUEST" "stream/NotzfireRight.ytyp"

escrow_ignore {
    'config.lua',
}





dependency '/assetpacks'