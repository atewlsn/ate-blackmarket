Config = {}
Config.Coords = vector4(1535.87, 782.28, 77.44, 96.84) -- vector4 coords !
Config.AuthJob = 'police' 

Config.Itemlist = {
    [1] = {
        ['label'] = "Tabanca Mermisi", 
        ['item'] = "pistol_ammo", 
        ['count'] = "5", 
        ['price'] = 50, 
    }, 
    [2] = {
        ['label'] = "Pistol MK2", 
        ['item'] = "weapon_pistol_mk2", 
        ['count'] = "1", 
        ['price'] = 3000, 
    }, 
    [3] = {
        ['label'] = "Zırh", 
        ['item'] = "armor", 
        ['count'] = "1", 
        ['price'] = 150, 
    }, 
}

--ped system
Config.atepeds = {

	[1] = { handle = nil, model ="a_m_y_latino_01", coords = vector3(1534.2, 787.01, 77.45), heading = 48.77,  anim = { type = 1, name = "CODE_HUMAN_CROSS_ROAD_WAIT"} }, -- scene
	
}


--discord log
Config.discord = {
    ['webhook'] = '2', --create webhook link
    ['name'] = 'ATE Blackmarket', -- webhook name
    ['image'] = '2' -- webhook profile photo
}
