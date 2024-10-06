local ESX = exports['es_extended']:getSharedObject()

RegisterNetEvent('police:backupRequest')
AddEventHandler('police:backupRequest', function(coords, codeType)
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local officerName = xPlayer.getName()

    if xPlayer.job.name == "police" then
        local players = ESX.GetExtendedPlayers()
        for _, player in ipairs(players) do
            if player.job.name == "police" then
                TriggerClientEvent('police:receiveBackupRequest', player.source, coords, codeType .. " by " .. officerName)
            end
        end
    end
end)

RegisterNetEvent('police:triggerAlertSoundForAll')
AddEventHandler('police:triggerAlertSoundForAll', function(soundName)
    local players = ESX.GetExtendedPlayers()
    for _, player in ipairs(players) do
        if player.job.name == "police" then
            TriggerClientEvent('police:playAlertSoundForAll', player.source, soundName)
        end
    end
end)




--[[QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('police:backupRequest')
AddEventHandler('police:backupRequest', function(coords, codeType)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local officerName = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname

    if Player.PlayerData.job.name == "police" then
        local players = QBCore.Functions.GetPlayers()
        for _, playerId in ipairs(players) do
            local targetPlayer = QBCore.Functions.GetPlayer(playerId)
            if targetPlayer and targetPlayer.PlayerData.job.name == "police" then
                TriggerClientEvent('police:receiveBackupRequest', playerId, coords, codeType .. " by " .. officerName)
            end
        end
    end
end)

RegisterNetEvent('police:triggerAlertSoundForAll')
AddEventHandler('police:triggerAlertSoundForAll', function(soundName)
    local players = QBCore.Functions.GetPlayers()
    for _, playerId in ipairs(players) do
        local targetPlayer = QBCore.Functions.GetPlayer(playerId)
        if targetPlayer and targetPlayer.PlayerData.job.name == "police" then
            TriggerClientEvent('police:playAlertSoundForAll', playerId, soundName)
        end
    end
end)]]
