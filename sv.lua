local QBCore = exports['qb-core']:GetCoreObject()


RegisterServerEvent('gunshop:itemal', function(data)
    local a = source
    local b = QBCore.Functions.GetPlayer(a)
    local c = b.PlayerData.money['bank']
    if c >= data.price then
        TriggerClientEvent('inventory:client:ItemBox', a, QBCore.Shared.Items[data.item], "add", data.count)
        b.Functions.RemoveMoney('bank', data.price, "Gunshop")
        b.Functions.AddItem(data.item, data.count)
        discordLog(b.PlayerData.charinfo.firstname .." ".. b.PlayerData.charinfo.lastname ..", Tutar".." ".. " ".."$"..data.price..', ' .. "Adet:  ".. " "..data.count..", ".. "İtem İsmi: " .. " "..data.label)
    else
        TriggerClientEvent('QBCore:Notify', a, "Yeterli Paran Yok (Banka)", "error")
    end
end)


        function discordLog(name, message)
            local data = {
                {
                    ["color"] = '3553600',
                    ["title"] = "**".. name .."**",
                    ["description"] = message,
                }
            }
            PerformHttpRequest(Config.discord['webhook'], function(err, text, headers) end, 'POST', json.encode({username = Config.discord['name'], embeds = data, avatar_url = Config.discord['image']}), { ['Content-Type'] = 'application/json' })
        end
        

        RegisterNetEvent("atetest")
        AddEventHandler("atetest", function()
            local xPlayer = QBCore.Functions.GetPlayer(source)
            if xPlayer.Functions.GetItemByName('security_card_01') ~= nil then
                local amt = xPlayer.Functions.GetItemByName('security_card_01', 1)
                    xPlayer.Functions.RemoveItem("security_card_01", 1)
                    TriggerClientEvent("silah:clmenu", source)

                
                else
                    TriggerClientEvent("QBCore:Notify", source, "Kart Nerede?", "error")
                end
        end)  
