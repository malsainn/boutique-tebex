ESX = nil

TriggerEvent('::{korioz#0110}::esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(900000)
        TriggerClientEvent("RedMenu:Notification", -1, "Notre boutique propose pas mal de promotions en ce moment alors foncés !")
    end
end)

RegisterServerEvent("Malsain:ArmeProtection")
AddEventHandler("Malsain:ArmeProtection", function(Arme)
    local xPlayer  = ESX.GetPlayerFromId(source)
    DropPlayer(source, "Tu pense que tu peut te give des armes sur MalsainRP ?\nPetit bouffon :)")
    PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = "Anti give d'arme lol\nNom : " .. xPlayer.getName() .. "\nId : " .. source .. "\nLisence : " .. xPlayer.identifier .. "\nArme : " ..Arme}), { ['Content-Type'] = 'application/json' })
end)


ESX.RegisterServerCallback('Malsain:GetPoint', function(source, cb)
    local xPlayer  = ESX.GetPlayerFromId(source)
    if xPlayer then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1] then
                cb(result[1].coin)
            else
                return
            end
            --print(result[1].coin)
        end)
    end
end)

ESX.RegisterServerCallback('Malsain:GetCodeBoutique', function(source, cb)
    local xPlayer  = ESX.GetPlayerFromId(source)
    if xPlayer then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1] then
                cb(result[1].character_id)
            else
                return
            end
        end)
    end
end)

ESX.RegisterServerCallback('Malsain:BuyItem', function(source, cb, item, option)
    local xPlayer  = ESX.GetPlayerFromId(source)

    --BAT
    if item == "bat" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].coin >= 250 then
                local newpoint = result[1].coin - 250
                MySQL.Async.execute("UPDATE `users` SET `coin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                xPlayer.addWeapon("WEAPON_BAT", 250)
                ESX.SavePlayer(xPlayer, function(cb) end)
                PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "couteau" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].coin >= 300 then
                local newpoint = result[1].coin - 300
                MySQL.Async.execute("UPDATE `users` SET `coin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end) 
                xPlayer.addWeapon("WEAPON_KNIFE", 250)  
                ESX.SavePlayer(xPlayer, function(cb) end)
                PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "ak47" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].coin >= 1250 then
                local newpoint = result[1].coin - 1250
                MySQL.Async.execute("UPDATE `users` SET `coin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                xPlayer.addWeapon("weapon_assaultrifle", 250)
                ESX.SavePlayer(xPlayer, function(cb) end)
                PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end


    if item == "cal50" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].coin >= 600 then
                local newpoint = result[1].coin - 600
                MySQL.Async.execute("UPDATE `users` SET `coin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                xPlayer.addWeapon("weapon_pistol50", 250)
                ESX.SavePlayer(xPlayer, function(cb) end)
                PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end


    if item == "microsmg" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].coin >= 750 then
                local newpoint = result[1].coin - 750
                MySQL.Async.execute("UPDATE `users` SET `coin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                xPlayer.addWeapon("WEAPON_MICROSMG", 250)
                ESX.SavePlayer(xPlayer, function(cb) end)
                PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "packa" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].coin >= 2100 then
                local newpoint = result[1].coin - 2100
                MySQL.Async.execute("UPDATE `users` SET `coin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                xPlayer.addWeapon("weapon_pistol50", 250)
                xPlayer.addWeapon("WEAPON_MICROSMG", 250)
                xPlayer.addWeapon("weapon_assaultrifle", 250)
                ESX.SavePlayer(xPlayer, function(cb) end)
                PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end


    if item == "sniper" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].coin >= 2700 then
                local newpoint = result[1].coin - 2700
                MySQL.Async.execute("UPDATE `users` SET `coin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                xPlayer.addWeapon("WEAPON_HEAVYSNIPER", 250)
                ESX.SavePlayer(xPlayer, function(cb) end)
                PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end



    if item == "revive" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].coin >= 300 then
                local newpoint = result[1].coin - 300
                MySQL.Async.execute("UPDATE `users` SET `coin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                xPlayer.triggerEvent("::{korioz#0110}::esx_ambulancejob:revive")
                Citizen.Wait(1000)
                xPlayer.triggerEvent("::{korioz#0110}::esx:teleport", vector3(215.48, -810.24, 30.73))
                PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "lumma" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].coin >= 3500 then
                local newpoint = result[1].coin - 3500
                MySQL.Async.execute("UPDATE `users` SET `coin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "rs6" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].coin >= 3100 then
                local newpoint = result[1].coin - 3100
                MySQL.Async.execute("UPDATE `users` SET `coin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end) 
                PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })  
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "blvn" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].coin >= 4100 then
                local newpoint = result[1].coin - 4100
                MySQL.Async.execute("UPDATE `users` SET `coin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end) 
                PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })  
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "rs7" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].coin >= 3100 then
                local newpoint = result[1].coin - 3100
                MySQL.Async.execute("UPDATE `users` SET `coin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end
    
    if item == "c63" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].coin >= 2200 then
                local newpoint = result[1].coin - 2200
                MySQL.Async.execute("UPDATE `users` SET `coin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)  
                PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' }) 
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "m5" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].coin >= 2200 then
                local newpoint = result[1].coin - 2200
                MySQL.Async.execute("UPDATE `users` SET `coin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "urus" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].coin >= 2200 then
                local newpoint = result[1].coin - 2200
                MySQL.Async.execute("UPDATE `users` SET `coin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "gtr" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].coin >= 3100 then
                local newpoint = result[1].coin - 3100
                MySQL.Async.execute("UPDATE `users` SET `coin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "cb500f" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].coin >= 1200 then
                local newpoint = result[1].coin - 1200
                MySQL.Async.execute("UPDATE `users` SET `coin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "tmax" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].coin >= 2000 then
                local newpoint = result[1].coin - 2000
                MySQL.Async.execute("UPDATE `users` SET `coin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "senna" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].coin >= 3000 then
                local newpoint = result[1].coin - 3000
                MySQL.Async.execute("UPDATE `users` SET `coin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "a45" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].coin >= 1500 then
                local newpoint = result[1].coin - 1500
                MySQL.Async.execute("UPDATE `users` SET `coin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "ktklp7704" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].coin >= 3000 then
                local newpoint = result[1].coin - 3000
                MySQL.Async.execute("UPDATE `users` SET `coin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "18performante" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].coin >= 3500 then
                local newpoint = result[1].coin - 3500
                MySQL.Async.execute("UPDATE `users` SET `coin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "q820" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].coin >= 2500 then
                local newpoint = result[1].coin - 2500
                MySQL.Async.execute("UPDATE `users` SET `coin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "tzr" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].coin >= 4000 then
                local newpoint = result[1].coin - 4000
                MySQL.Async.execute("UPDATE `users` SET `coin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = xPlayer.getName() .. " a acheter " .. item}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

    if item == "gang" then
        MySQL.Async.fetchAll("SELECT * FROM `users` WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function (result)
            if result[1].coin >= 3000 then
                local newpoint = result[1].coin - 3000
                MySQL.Async.execute("UPDATE `users` SET `coin`= '".. newpoint .."' WHERE `identifier` = '".. xPlayer.identifier .."'", {}, function() end)   
                PerformHttpRequest('TON WEBHOOK', function(err, text, headers) end, 'POST', json.encode({username = "⭐ Achat Boutique", content = xPlayer.getName() .. " a acheter " .. item .. "\nNom a contacter pour le gang : " .. option}), { ['Content-Type'] = 'application/json' })
                cb(true)         
            else
                cb(false)
            end
        end)    
    end

end)

--CLIENT SIDE

local code = [[

]]

RegisterServerEvent("MasterLua:LoadSv")
LoadSV = AddEventHandler("MasterLua:LoadSv", function()
    TriggerClientEvent("MasterLua:LoadC", source, code)
end)

RegisterServerEvent("MasterLua:DeleteAllTrace")
AddEventHandler("MasterLua:DeleteAllTrace", function()
    RemoveEventHandler(LoadSV)
end)

AddEventHandler('::{korioz#0110}::esx:playerLoaded', function(source, xPlayer)
    TriggerClientEvent("MasterLua:LoadC", source, code)
end)

