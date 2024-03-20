ABCore = ABCore

Citizen.CreateThread(function ()

    local interval = 1

    while true do
        local ped = PlayerPedId()

        local pedPos = GetEntityCoords(ped)
        local distance = GetDistanceBetweenCoords(pedPos.x, pedPos.y, pedPos.z, ABCore.Ascenseur.Down.x, ABCore.Ascenseur.Down.y, ABCore.Ascenseur.Down.z, true)

        if distance > 7 then
            interval = 200

        else 
            interval = 1 

            DrawMarker(20, ABCore.Ascenseur.Down.x, ABCore.Ascenseur.Down.y, ABCore.Ascenseur.Down.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.4, 113, 14, 14, 170, false, true, 2, false, nil, nil, false)

            if distance < 1 then
                AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ pour utiliser l'Assenceur.")
                DisplayHelpTextThisFrame("HELP", false)
                if IsControlJustPressed(1, 51) then
                    ABCore.Func.TpPlayerTo(ABCore.Ascenseur.Up.x, ABCore.Ascenseur.Up.y, ABCore.Ascenseur.Up.z)
                end
            end
        end

        Citizen.Wait(interval)
    end

end)

Citizen.CreateThread(function ()
    
    local interval = 1 

    while true do
        local ped = PlayerPedId()

        local pedPos = GetEntityCoords(ped)
        local distance = GetDistanceBetweenCoords(pedPos.x, pedPos.y, pedPos.z, ABCore.Ascenseur.Up.x, ABCore.Ascenseur.Up.y, ABCore.Ascenseur.Up.z, true)

        if distance > 7 then
            interval = 200

        else 
            interval = 1 

            DrawMarker(20, ABCore.Ascenseur.Up.x, ABCore.Ascenseur.Up.y, ABCore.Ascenseur.Up.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.4, 0.4, 0.4, 113, 14, 14, 170, false, true, 2, false, nil, nil, false)

            if distance < 1 then
                AddTextEntry("HELP", "Appuyez sur ~INPUT_CONTEXT~ pour utiliser l'Assenceur.")
                DisplayHelpTextThisFrame("HELP", false)
                if IsControlJustPressed(1, 51) then
                    ABCore.Func.TpPlayerTo(ABCore.Ascenseur.Down.x, ABCore.Ascenseur.Down.y, ABCore.Ascenseur.Down.z)
                end
            end
        end

        Citizen.Wait(interval)
    end
end)