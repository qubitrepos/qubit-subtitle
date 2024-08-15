fx_version "cerulean"
games {"gta5"}

description "Qubit's Subtitle"
version '1.0.0'

client_scripts {
    'main.lua'
}

ui_page('html/index.html')

files {
    'html/listener.js',
    'html/style.css',
    'html/index.html',
}

lua54 'yes'