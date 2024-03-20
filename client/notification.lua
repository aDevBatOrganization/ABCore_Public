ABCore = ABCore

RegisterNetEvent('ABCore:notification')
AddEventHandler('ABCore:notification', function (text, duration)
    SendNUIMessage({
        type = "notification",
        text = text,
        duration = duration
    })
end)