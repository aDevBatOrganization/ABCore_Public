ABCore = ABCore

local isUiOpen = false

-- Thread jouer a la connexion d'un joueur

Citizen.CreateThread(function ()
    TriggerServerEvent("ABCore:connexion")
end)

-- ouvre le NUI WelcomeUI

RegisterNetEvent("ABCore:WelcomeUI")
AddEventHandler("ABCore:WelcomeUI", function (userInfos)
    ABCore.Func.FreezePlayer(PlayerId(), true)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "WelcomeUI",
        display = true,
        userInfos = userInfos
    })
end)

-- close NUI WelcomeUI

RegisterNuiCallback('registerIdentity', function(data, cb)
    ABCore.Func.FreezePlayer(PlayerId(), false)
    SetNuiFocus(false, false)
    TriggerServerEvent('ABCore:createIdentity', data)
    cb(ok)
end)

RegisterNUICallback('openUrl', function (data, cb)
    local url = data.url
    
    if url then
     os.execute('start ' .. url)
    end
 end)