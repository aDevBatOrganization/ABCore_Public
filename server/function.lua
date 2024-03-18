ABCore = ABCore


-- ##### Function qui regarde le numero de license fivem du joueur specifier en param de la func #####

function ABCore.Func.GetLicenseId(playerId)
    local Identifiers = GetPlayerIdentifiers(playerId)
    for key, value in pairs(Identifiers) do
        if string.match(value, "license:") then
            return value
        end
    end
    return nil
end

-- ##### Function qui regarde l'ip client en mettant en param de la func son id en jeu #####

function ABCore.Func.GetIpPlayer(playerId)
    local ip = GetPlayerIdentifiers(playerId)
    for key, value in pairs(ip) do
        if string.match(value, "ip:") then
            return value
        end
    end
    return nil
end


RegisterNetEvent('ABCore:createIdentity')
AddEventHandler('ABCore:createIdentity', function (data)
    MySQL.Async.execute("UPDATE users SET firstname=@firstname, lastname=@lastname, height=@height, birthday=@birthday, sex=@sex WHERE id=@id", {
        ["@firstname"] = data.firstname,
        ["@lastname"] = data.lastname,
        ["@height"] = data.height,
        ["@birthday"] = data.birthday,
        ["@sex"] = data.sex,
        ["@id"] = data.userInfos.Id
    })
    print("^5[Server : New Player] ^0Le nouveau joueur vien de cree son identiter ^1" .. data.firstname .. "^0 son id unique est le suivant : ^3" .. data.userInfos.Id .. "^0")
end)