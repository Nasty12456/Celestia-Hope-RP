Description 'ngd-bahama | Nemesis Gaming Development'
author 'deluce#0'
bridge 'ngd-Bridge'
name 'ngd-bahama'
version '3.13'
github 'https://github.com/delucecc/versions'

fx_version 'cerulean'
game 'gta5'

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
  "bahama.lua",
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
data_file 'DLC_ITYP_REQUEST' 'stream/one_coffee_sir.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/drinks_new_new.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/beerglasses_meta.ytyp'

dependency '/assetpacks'