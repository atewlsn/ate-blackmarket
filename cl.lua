local QBCore = exports['qb-core']:GetCoreObject()
PlayerJob = {}

RegisterCommand('baboli', function()
    TriggerEvent('silah:clmenu')
end)

RegisterNetEvent('silah:clmenu', function()
    local Menu = {
        {
            header = "Blackmarket",
            txt = "David",
            params = {
                event = "silah:clesyamenu",
            }
        }
    }
    Menu[#Menu+1] = {
        header = "⬅ Kapat",
        params = {
            event = "qb-menu:client:closeMenu"
        }
    }
    exports['qb-menu']:openMenu(Menu)
end)

RegisterNetEvent('silah:clesyamenu', function()
    local harbig = {
        {
            header = "Gun Shop",
            isMenuHeader = true,
        }
    }
for k, v in pairs(Config.Itemlist) do
    harbig[#harbig+1] = {
        header = v.label,
        txt = "Eşya: " .. v.label .. " Tutar: " .. v.price .. "$".. " ".." " .." Adet:" .." " ..v.count,
        params = {
            isServer = true,
            event = "gunshop:itemal",
            args = {
                price = v.price,
                item = v.item,
                count = v.count,
                label = v.label
            }
        }
    }
end
harbig[#harbig+1] = {
    header = "Menuden Ayril"
    }
    exports['qb-menu']:openMenu(harbig)
end)

Citizen.CreateThread(function ()
    exports['qb-target']:AddBoxZone("blackmarket",vector3(1533.5, 787.71, 77.45), 3, 3, {
        name = "blackmarket",
        heading = 228.81,
        debugPoly = false,
    }, {
        options = {
            {
                type = "Client",
                event = "sont",
                icon = "fas fa-gun",
                label = 'David Wlsn',
                job = 'all',

            },
        },
        distance = 1.5
    })
end)

RegisterNetEvent('sont', function()
    TriggerServerEvent('atetest')
end)


Citizen.CreateThread(function()
	for k,v in pairs(Config.atepeds) do
		RequestModel(v.model)
		while not HasModelLoaded(v.model) do Citizen.Wait(1) end
		v.handle = CreatePed(4, v.model, v.coords.x, v.coords.y, v.coords.z-1.0, v.heading, false, false)
		GiveWeaponToPed(v.handle, v.weapon, 10, 1, 1)
		SetPedFleeAttributes(v.handle, 0, 0)
		SetPedDropsWeaponsWhenDead(v.handle, false)
		SetPedDiesWhenInjured(v.handle, false)
		SetEntityInvincible(v.handle , true)
		FreezeEntityPosition(v.handle, true)
		SetBlockingOfNonTemporaryEvents(v.handle, true)
		if v.anim.type == 1 then
			TaskStartScenarioInPlace(v.handle, v.anim.name, 0, true)
		elseif v.anim.type == 2 then
			RequestAnimDict(v.anim.dict)
			while not HasAnimDictLoaded(v.anim.dict) do Citizen.Wait(1) end
			TaskPlayAnim(v.handle, v.anim.dict, v.anim.name, 8.0, 1, -1, 49, 0, false, false, false)
		end
	end
end)



RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
end)


AddEventHandler("onResourceStart", function(JobInfo)
    PlayerJob = QBCore.Functions.GetPlayerData().job
end)


    
