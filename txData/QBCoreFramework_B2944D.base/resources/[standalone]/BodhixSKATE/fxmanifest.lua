fx_version 'cerulean'
game 'gta5'

name 'BodhixSKATE'
description 'Skate Career'
author 'Bodhix'
version '1.1.1'

lua54 'yes'

shared_scripts {
  'config.lua',
}

client_scripts {
  'client/ProSkate.lua',
  'client/SkateGames.lua',
}

server_scripts {
  'server/games_sv.lua',
  'server/server.lua',
  'server/sv.lua',
}

data_file 'HANDLING_FILE' 'data/handling.meta'

files {
  'data/handling.meta',
  'stream/bodhix@skate@anims.ycd',
  'server/version.json',
  'html/index.html',
  'html/Land.MP3',
  'html/Ollie.MP3',
  'html/Speed.MP3',
  'html/SpeedStep.MP3',
  'html/index.html',
  "stream/NotzfireLeft.ydr",
	"stream/NotzfireRight.ydr",	
  'html/LAADS-LoveYou.mp3',
  'html/MaxBrhon-AIMidtempo.mp3',
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