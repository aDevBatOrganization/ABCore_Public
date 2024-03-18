ABCore = ABCore
-- ###### Event "ABCore:connexion" qui se fait appeler a chaque connexion d'un joueur

RegisterNetEvent("ABCore:connexion")
AddEventHandler("ABCore:connexion", function()
    ABCore.User.Source = source
    local identifier = ABCore.Func.GetLicenseId(ABCore.User.Source)
    local ipPlayer = ABCore.Func.GetIpPlayer(ABCore.User.Source)
    -- verifier si y a un identifiant cfx
    if identifier then
        MySQL.Async.fetchAll("SELECT * FROM users WHERE licenseid = @identifier", { ['@identifier'] = identifier },
            function(result)
                for k, v in ipairs(result) do
                    ABCore.User.Id = v.id
                    ABCore.User.LicenseId = v.licenseid
                    ABCore.User.Ip = v.ip
                end

                if ABCore.User.LicenseId == identifier then 
                    print("Le joueur existe")
                else 
                    ABCore.User.Id = MySQL.Sync.insert(
                        "INSERT INTO users (licenseid, ip, money, bank) VALUES (@licenseid, @ip, @money, @bank)", 
                        {
                            ["@licenseid"] = identifier,
                            ["@ip"] = ipPlayer,
                            ["@money"] = ABCore.Spawn.money,
                            ["@bank"] = ABCore.Spawn.bank
                        })
                    ABCore.User.LicenseId = identifier
                    ABCore.User.Ip = ipPlayer
                    print("^3BDD : ^0Un nouveau joueur a etait ajouter dans la BDD sont empreinte est : " .. ABCore.User.Id .. " sa license est : " .. ABCore.User.LicenseId)
                    TriggerClientEvent("ABCore:WelcomeUI", -1, ABCore.User)
                end 
            end)
    end
end)
