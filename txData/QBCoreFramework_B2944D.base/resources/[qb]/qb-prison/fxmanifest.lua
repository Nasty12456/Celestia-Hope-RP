lua54 'yes'
fx_version 'cerulean'
game 'gta5'

author 'QBCore Store Since 2020'
description 'only buy from discord.gg/qbcoreframework'
version '9 Special Edition'




dependencies {
    "PolyZone"
}

client_script {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/*.lua'
}

server_script {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

shared_script {
    '@qb-core/shared/locale.lua',
    'Config.lua',
    'locales/en.lua'
}

escrow_ignore {
  'config.lua',
  'locales/en',
  'locales',
}
dependency '/assetpacks'