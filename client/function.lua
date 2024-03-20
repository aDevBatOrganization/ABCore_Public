ABCore = ABCore

-- freeze player function 

function ABCore.Func.FreezePlayer(player, freeze)
    local playerPed = GetPlayerPed(player)
    if freeze then 
        SetPlayerControl(player, false, 0)
        FreezeEntityPosition(playerPed, true)
    else 
        SetPlayerControl(player, true, 0)
        FreezeEntityPosition(playerPed, false)
    end 
end 


-- tp un joueur a un point definit 

function ABCore.Func.TpPlayerTo(x, y, z)
    local playerPed = PlayerPedId()

    if DoesEntityExist(playerPed) and not IsEntityDead(playerPed) then
        SetEntityCoords(playerPed, x, y, z, false, false, false, true)
    end

end