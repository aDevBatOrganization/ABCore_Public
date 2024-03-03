local isUiOpen = false

-- Thread jouer a la connexion d'un joueur

Citizen.CreateThread(function ()
    TriggerServerEvent("ABCore:connexion")
end)

-- freeze player function 

function FreezePlayer(player, freeze)
    local playerPed = GetPlayerPed(player)
    if freeze then 
        SetPlayerControl(player, false, 0)
        FreezeEntityPosition(playerPed, true)
    else 
        SetPlayerControl(player, true, 0)
        FreezeEntityPosition(playerPed, false)
    end 
end 

-- ouvre le NUI WelcomeUI

RegisterNetEvent("WelcomeUI")
AddEventHandler("WelcomeUI", function ()
    FreezePlayer(PlayerId(), true)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "WelcomeUI",
        displaye = true
    })
    print("welcome ui appeler")
end)

-- close NUI WelcomeUI

RegisterNuiCallback('closeWelcomeUI', function(data, cb)
    FreezePlayer(PlayerId(), false)
    SetNuiFocus(false, false)
    cb(ok)
end)