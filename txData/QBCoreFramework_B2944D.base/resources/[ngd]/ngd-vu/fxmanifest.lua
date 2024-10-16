Description 'ngd-vu | Nemesis Gaming Development'
name 'ngd-vu'
bridge 'ngd-Bridge'
author 'deluce#9077'
fx_version 'cerulean'
game 'gta5'
version '3.14.2'
github 'https://github.com/delucecc/versions'

shared_scripts {
  '@ngd-Bridge/bridge.lua',
  "config.lua",
  'translate.lua',
}

client_scripts {
  'client/*.lua',
}

server_scripts {
  'server/*.lua',
}

escrow_ignore {
  "config.lua",
  "README.md",
  "fxmanifest.lua",
  "client/editableclient.lua",
  "server/editableserver.lua",
  'translate.lua',
  'web/*.*',
  'web/**/*.*'
}

files {
  'web/*.*',
  'web/**/*.*'
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'
ui_page 'web/index.html'
data_file 'DLC_ITYP_REQUEST' 'stream/newdrinkprops.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/beerglasses_meta.ytyp'

dependency '/assetpacks'