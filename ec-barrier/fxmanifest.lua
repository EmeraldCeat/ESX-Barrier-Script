fx_version 'cerulean'
game 'gta5'

shared_scripts {
    '@es_extended/imports.lua',
	'@es_extended/locale.lua'
}

server_scripts {
    'server.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    'client.lua'
}

dependencies {
    'es_extended'
}

lua54 'yes'