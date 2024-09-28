fx_version 'cerulean'
games { 'rdr3', 'gta5' }

lua54 'yes'

shared_scripts {
    'cfg.lua'
}

client_scripts {
    '@rm_stream/client.lua',
    'client/*.lua',
}

server_scripts {
    'server/*.lua',
}

ui_page "web/dist/index.html"

files {
    "web/dist/*.html",
    'web/dist/*.*',
    'web/dist/assets/*.*',
}

escrow_ignore {
    'cfg.lua',
    'client/editable_client.lua',
    'server/editable_server.lua',
    '[items]',
}
dependency '/assetpacks'