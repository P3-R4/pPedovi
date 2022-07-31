
Config = {}
Config.Distanca = 30.0
Config.SmanjiZ = true

Config.nebitno = {
	['male'] = 4,
	['female'] = 5
}

Config.Lista = {
	{
		spawnaj = true, -- ako je false onda se ped nece spawnati
		pedic = `a_f_y_bevhills_01`, -- hash peda (https://docs.fivem.net/docs/game-references/ped-models/)
		coords = vector4(430.0492, -800.113, 29.491, 98.0),  -- koordinate
		gender = 'female', -- pol peda
		crtajblip = true , -- ako je false blip se nece crtati
		imeblipa = 'Butik', -- naziv blipa
		bojablipa = 49, -- boja blipa 
		blipsp = 73 -- blip spirite (https://docs.fivem.net/docs/game-references/blips/)

	},
	{
		spawnaj = true,
		pedic = `cs_chengsr`,
		coords = vector4(1856.3639, -1307.7751, 111.6046, 115.5788), 
		gender = 'male',
		crtajblip = false,
		imeblipa = 'Prodaja kokaina',
		bojablipa = 49,
		blipsp = 71
	},

	{
		spawnaj = false,
		pedic = `cs_chengsr`,
		coords = vector4(1478.0773, -1348.6987, 96.9556, 115.5788), 
		gender = 'male',
		crtajblip = true,
		imeblipa = 'Prodaja kokaina',
		bojablipa = 49,
		blipsp = 47
	}
}