local QBCore = exports['qb-core']:GetCoreObject()
PlayerJob = {}

RegisterNetEvent('silah:clmenu', function()
    local Menu = {
        {
            header = "Silahcı",
            txt = "Items",
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
        txt = "Item: " .. v.label .. " Price: " .. v.price .. "$".. " ".." " .." Amount:" .." " ..v.count,
        params = {
            isServer = true,
            event = "silahci:itemal",
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
    exports['qb-target']:AddBoxZone("gunshop",vector3(Config.Coords.x,Config.Coords.y,Config.Coords.z), 3, 3, {
        name = "gunshop",
        heading = Config.Coords.w,
        debugPoly = false,
    }, {
        options = {
            {
                type = "Client",
                event = "silah:clmenu",
                icon = "fas fa-gun",
                label = 'Gun Shop',
                job = Config.AuthJob

            },
        },
        distance = 1.5
    })
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


    