fx_version "cerulean"
game "gta5"
lua54 'yes'

author 'QBCore Store Since 2020'
description 'only buy from discord.gg/qbcoreframework'
version '9 Special Edition'




shared_scripts { 'config.lua', 'shared/*.lua', 'locales/*.lua' }

server_scripts { '@oxmysql/lib/MySQL.lua', 'server/*.lua' }

client_scripts { '@PolyZone/client.lua','@PolyZone/BoxZone.lua','@PolyZone/EntityZone.lua', '@PolyZone/CircleZone.lua', '@PolyZone/ComboZone.lua', 'client/*.lua', }

escrow_ignore {
    'config.lua',
    'locales/*.lua',
    'shared/*.lua'
}



dependency '/assetpacks'
dependency '/assetpacks'