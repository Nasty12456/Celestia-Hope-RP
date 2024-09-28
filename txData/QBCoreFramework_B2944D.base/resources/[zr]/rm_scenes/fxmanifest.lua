fx_version 'cerulean'
game 'gta5'
lua54 'yes'
use_experimental_fxv2_oal 'yes'

ui_page 'build/index.html'

shared_scripts {
    '@ox_lib/init.lua',
    'cfg.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'bridge/**/server.lua',
    'sv_discord_log.lua',
    'logger.js',
    'server.lua',
}

client_scripts {
    'data/*.lua',
    'client.lua',
    'bridge/**/client.lua',
}

files {
    'locales/*.json',
    'build/**',
}

escrow_ignore {
    'cfg.lua',
    'data/*.lua',
    'bridge/framework/**.lua',
    'sv_discord_log.lua',
}

dependency '/assetpacks'