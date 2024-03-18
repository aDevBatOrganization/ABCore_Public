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
