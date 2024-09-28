fx_version "adamant"

description "0BugScripts"
author '0BugScripts Remastered: <0bugscripts.tebex.io>'
version '1.0.0'

game "gta5"

client_script { 
    'main/shared/Locale.lua',
    'locales/*.lua',
    "main/config.lua",
    "main/client/client.lua",
    "main/client/kill.lua",
}

server_script {
    'main/shared/Locale.lua',
    'locales/*.lua',
    "main/config.lua",
    "main/server/webhooks.lua",
    "main/server/apiKeys.lua",
    "main/server/server.lua",
} 



ui_page "ui/index.html"

files {
    'ui/index.html',
    'ui/introduction.js',
    'ui/**/*.*',
    'ui/font/*.otf',  
    'ui/*.*',  



    "ui/recScript.js",
    --ui/MODULE
    "ui/module/*.js",
    "ui/module/animation/tracks/*.js",
    "ui/module/animation/*.js",
    "ui/module/audio/*js",
    "ui/module/cameras/*.js",
    "ui/module/core/*.js",
    "ui/module/extras/core/*.js",
    "ui/module/extras/curves/*.js",
    "ui/module/extras/objects/*.js",
    "ui/module/extras/*.js",
    "ui/module/geometries/*.js",
    "ui/module/helpers/*.js",
    "ui/module/lights/*.js",
    "ui/module/loaders/*.js",
    "ui/module/materials/*.js",
    "ui/module/math/interpolants/*.js",
    "ui/module/math/*.js",
    "ui/module/objects/*.js",
    "ui/module/renderers/shaders/*.js",
    "ui/module/renderers/shaders/ShaderChunk/*.js",
    "ui/module/renderers/shaders/ShaderLib/*.js",
    "ui/module/renderers/webgl/*.js",
    "ui/module/renderers/webvr/*.js",
    "ui/module/renderers/*.js",
    "ui/module/scenes/*.js",
    "ui/module/textures/*.js",
    "ui/script.js"
    
}

escrow_ignore {
    'locales/*.lua',
    "main/config.lua",
    "main/server/webhooks.lua",
    "main/server/apiKeys.lua",
}
lua54 'yes'
dependency '/assetpacks'