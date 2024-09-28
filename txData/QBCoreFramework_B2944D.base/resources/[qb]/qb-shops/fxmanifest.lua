fx_version 'bodacious'
author 'QBCore Store Since 2020'
description 'only buy from discord.gg/qbcoreframework'
version '9 Special Edition'



games { 'gta5' }


ui_page 'html/index.html'
files {
  'html/index.html',
  'html/script.js',
  'html/style.css',
  'html/*otf',
  'html/*png',
  'images/*.png',
  'images/*.jpg',
  'images/*.webp',
  'images/*.mp4',
  'fonts/*.ttf',
  'fonts/*.otf'
 
}

client_scripts{
    'client/client.lua',
    'config.lua'
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'server/server.lua',
  'config.lua',
}

escrow_ignore {
  'config.lua'
}

lua54 "yes"

dependency '/assetpacks'