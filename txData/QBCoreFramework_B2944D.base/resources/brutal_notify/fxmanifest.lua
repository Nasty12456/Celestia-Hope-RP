fx_version 'cerulean'
games {'gta5'}
lua54 'yes'

author 'Keres & Dév'
description 'Brutal Notify - store.brutalscripts.com'
version '1.2.0'

client_scripts {
    'config.lua', 
    'client.lua', 
    'examples/client-examples.lua'
}

server_scripts {
    'config.lua', 
    'examples/server-examples.lua'
}

ui_page 'html/ui.html'
files {'html/*.*'}

export 'SendAlert'
export 'Esc'

dependencies { 
    '/server:5181',     -- ⚠️PLEASE READ⚠️; Requires at least SERVER build 5181
    '/gameBuild:2189',  -- ⚠️PLEASE READ⚠️; Requires at least GAME build 2189.
}

escrow_ignore {'config.lua', 'client.lua', 'examples/client-examples.lua', 'examples/server-examples.lua'}

--[[
-- locked
escrow_ignore {'config.lua', 'examples/client-examples.lua', 'examples/server-examples.lua'}

-- open
escrow_ignore {'config.lua', 'client.lua', 'examples/client-examples.lua', 'examples/server-examples.lua'}
--]]
dependency '/assetpacks'