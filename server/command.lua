-- commande de heal -- 

RegisterCommand("heal", function (source)
    
    local _src = source

    local licenseId = ABCore.Func.GetLicenseId(_src)

    MySQL.Async.fetchScalar("SELECT admin FROM users WHERE licenseid=@id", {
        ['@id'] = licenseId
    }, function (admin)
        print(admin)
        if admin >= 1 then
            MySQL.Async.execute('UPDATE users SET eat=@a, drink=@b WHERE licenseid=@id', {
                ['@a'] = 100,
                ['@b'] = 100,
                ['@id'] = licenseId
            })
        
            TriggerClientEvent('ABCore:healClient', -1)
            TriggerClientEvent('ABCore:notification', -1, 'Vous avez etait heal', 2000)
        else 
            TriggerClientEvent('ABCore:notification', -1, "Vous n'avais pas le grade admin necessaire a cette commande", 3500)
        end
    end)


end, false)

-- setjob -- 

RegisterCommand('setjob', function (source, args)

    local _src = source

    local licenseId = ABCore.Func.GetLicenseId(_src)

    MySQL.Async.fetchScalar("SELECT admin FROM users WHERE licenseid=@id", {
        ['@id'] = licenseId
    }, function (admin)
        if admin >= 2 then

            if not args[1] or not args[2] or not args[3] then
                TriggerClientEvent('ABCore:notification', -1, "ERREUR : usage de la commande /setjob [Id Unique] [Nom du job] [Grade du job]", 5000)
            end


            local playerEmpreinte = args[1]
            local jobName = args[2]
            local jobGrade = args[3]

            MySQL.Async.execute('UPDATE users SET job_name=@jobName, job_grade=@jobGrade WHERE id=@id', {
                ['@jobName'] = jobName,
                ['@jobGrade'] = jobGrade,
                ['@id'] = playerEmpreinte
            }, function (rowChanged)
                if rowChanged > 0 then
                    TriggerClientEvent('ABCore:notification', -1, "Vous avez set le job " .. jobName ..  " avec le grade " ..  jobGrade ..  " au joueur " .. playerEmpreinte, 3000)
                else 
                    TriggerClientEvent('ABCore:notification', -1, "Le job na pas etait set est tu sur de l'id unique du joueur? tu a donner " .. playerEmpreinte, 3000)
                end
            end)



        else 
            TriggerClientEvent('ABCore:notification', -1, "Vous n'avais pas le grade admin necessaire a cette commande", 3500)
        end
    end)
    
end, restricted)