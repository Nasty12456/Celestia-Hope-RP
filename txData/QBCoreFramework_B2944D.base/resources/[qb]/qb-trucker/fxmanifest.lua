fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'QBCore Store Since 2020'
description 'only buy from discord.gg/qbcoreframework'
version '9 Special Edition'



client_script {
    'client.lua',
    'functions.lua'
}

server_script {
    'server.lua'
}

shared_script {
    'config.lua',
}

ui_page 'html/index.html'

files{
    'html/index.html',

    'html/assets/js/*.js',

    'html/vendor/bootstrap/css/bootstrap.min.css',
    'html/vendor/bootstrap/css/bootstrap.min.css.map',

    'html/vendor/bootstrap/js/bootstrap.bundle.min.js',
    'html/vendor/bootstrap/js/bootstrap.bundle.min.js.map',
    'html/vendor/bootstrap/js/bootstrap.min.js',

    'html/vendor/jquery/jquery.min.js',
    'html/vendor/jquery/jquery.min.map',
    'html/vendor/jquery/jquery.slim.min.js',
    'html/vendor/jquery/jquery.slim.min.map',

    'html/assets/css/style.css',
    'html/assets/images/*.png',
    'html/assets/images/*.jpg'
}

escrow_ignore {
    'config.lua',
    'functions.lua'
}

dependency '/assetpacks'
dependency '/assetpacks'