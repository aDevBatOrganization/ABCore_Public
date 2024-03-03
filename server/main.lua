-- ##### Function qui regarde le numero de license fivem du joueur specifier en param de la func #####

function getLicenseId(playerId)
    local Identifiers = GetPlayerIdentifiers(playerId)
    for key, value in pairs(Identifiers) do
        if string.match(value, "license:") then
            return value
        end
    end
    return nil
end

-- ##### Function qui regarde l'ip client en mettant en param de la func son id en jeu #####

function getIpPlayer(playerId)
    local ip = GetPlayerIdentifiers(playerId)
    for key, value in pairs(ip) do
        if string.match(value, "ip:") then
            return value
        end
    end
    return nil
end

-- ###### Event "ABCore:connexion" qui se fait appeler a chaque connexion d'un joueur

RegisterNetEvent("ABCore:connexion")
AddEventHandler("ABCore:connexion", function()
    local _src = source
    local identifier = getLicenseId(_src)
    local ipPlayer = getIpPlayer(_src)
    -- verifier si y a un identifiant cfx
    if identifier then
        MySQL.Async.fetchAll("SELECT * FROM users WHERE licenseid = @identifier", { ['@identifier'] = identifier },
            function(result)
                for k, v in ipairs(result) do
                    id = v.id
                    licenseid = v.licenseid
                    ip = v.ip
                end

                if licenseid == identifier then 
                    print("Le joueur existe")
                else 
                    -- MySQL.Async.execute("INSERT INTO users (licenseid, ip, money, bank) VALUES (@licenseid, @ip, @money, @bank)", {
                    --     ["@licenseid"] = identifier,
                    --     ["@ip"] = ipPlayer,
                    --     ["@money"] = Config.money,
                    --     ["@bank"] = Config.bank
                    -- })
                    print("^3BDD : ^0Un nouveau joueur a etait ajouter dans la BDD")
                    TriggerClientEvent("WelcomeUI", -1)
                end 
            end)
    end
end)
