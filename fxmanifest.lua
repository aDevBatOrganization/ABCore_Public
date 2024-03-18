fx_version 'cerulean'
game 'gta5'

framework "ABCore_Public"
author "a-dev.bat Team | Abject"
description "ABCore_Public is a framework developped by French dev, in tutorial to the YouTube channel a_dev.bat and Twitch stream to the channel Abject18"
repository "https://github.com/aDevBatOrganization/ABCore.git"
discord "https://discord.gg/KQDcjZGxtq"
version '0.0.1' 

-- #######
-- General
-- #######

lua54 'yes'

dependency 'mysql-async'

shared_scripts {
    'shared/init_ABCore.lua',
    'shared/*.lua'
}

client_scripts {
    'client/function.lua',
    'client/*.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/function.lua',
    'server/*.lua'
}

ui_page {
    'ui/ABCore.html',
}

files {
    'ui/*.html',
    'ui/css/*.css',
    'ui/js/*.js',
}
