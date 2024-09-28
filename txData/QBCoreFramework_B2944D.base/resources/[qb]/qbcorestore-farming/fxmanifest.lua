fx_version "adamant"
game "gta5"


author 'QBCore Store Since 2020'
description 'only buy from discord.gg/qbcoreframework'
version '9 Special Edition'


ui_page 'html/index.html'

files {
  "html/img/*.png",
  "html/index.html",
  "html/script.js",
  "html/style.css"
}

shared_scripts {
  '@ox_lib/init.lua',
  "shared/*.lua"
}

client_scripts {
  "client/cl_*.lua"
}

server_scripts {
  "server/sv_*.lua"
}

lua54 'yes'

escrow_ignore {
  "shared/*.lua",
}

dependency '/assetpacks'
dependency '/assetpacks'