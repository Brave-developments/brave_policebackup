--local QBCore = exports['qb-core']:GetCoreObject()
local ESX = exports['es_extended']:getSharedObject()

local function sendBackupRequest(codeType, codeMessage, blipColor, soundName)
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    local blip = AddBlipForCoord(playerCoords.x, playerCoords.y, playerCoords.z)
    SetBlipSprite(blip, 304)
    SetBlipColour(blip, blipColor)
    SetBlipScale(blip, 0.5)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(codeMessage)
    EndTextCommandSetBlipName(blip)

    TriggerServerEvent('police:backupRequest', playerCoords, codeType)
    TriggerServerEvent('police:triggerAlertSoundForAll', soundName)

    Citizen.SetTimeout(40000, function()
        RemoveBlip(blip)
    end)
end

local function showNotification(message)
    if exports['qb-core'] then
        -- QB Notify
        TriggerEvent('QBCore:Notify', message, 'error', 10000)
    elseif exports['ox_lib'] then
        -- OX Lib Notify
        lib.notify({
            title = 'Police Backup',
            description = message,
            type = 'error',
            duration = 10000
        })
    elseif exports['okokNotify'] then
        -- okokNotify
        exports['okokNotify']:Alert("Police Backup", message, 10000, 'error', true)
    else
        -- Default to chat message if no notification system is present
        TriggerEvent('chat:addMessage', {
            color = {255, 0, 0},
            multiline = true,
            args = {"[Police Backup]", message}
        })
    end
end

local function requestBackup(codeType)
    if codeType == 1 then
        sendBackupRequest("Code 1: Foot Pursuit", "CODE 1: Foot Pursuit", 38, "code1")
    elseif codeType == 2 then
        sendBackupRequest("Code 2: Vehicle Pursuit", "CODE 2: Vehicle Pursuit", 47, "code2")
    elseif codeType == 3 then
        sendBackupRequest("Code 3: Armed Robbery", "CODE 3: Armed Robbery", 1, "code3")
    elseif codeType == 99 then
        sendBackupRequest("Code 99: Heavy 10-10", "CODE 99: Heavy 10-10", 60, "code99")
    end
end

RegisterKeyMapping('code1backup', 'Request Backup for Foot Pursuit (Code 1)', 'keyboard', 'HOME')
RegisterKeyMapping('code2backup', 'Request Backup for Vehicle Pursuit (Code 2)', 'keyboard', 'INSERT')
RegisterKeyMapping('code3backup', 'Request Backup for Armed Robbery (Code 3)', 'keyboard', 'PAGEUP')
RegisterKeyMapping('code99backup', 'Request Backup for Heavy 10-10 (Code 99)', 'keyboard', 'END')

--[[RegisterCommand('code1backup', function()
    local playerData = QBCore.Functions.GetPlayerData()
    if playerData.job.name == "police" then
        requestBackup(1)
    end
end)

RegisterCommand('code2backup', function()
    local playerData = QBCore.Functions.GetPlayerData()
    if playerData.job.name == "police" then
        requestBackup(2)
    end
end)

RegisterCommand('code3backup', function()
    local playerData = QBCore.Functions.GetPlayerData()
    if playerData.job.name == "police" then
        requestBackup(3)
    end
end)

RegisterCommand('code99backup', function()
    local playerData = QBCore.Functions.GetPlayerData()
    if playerData.job.name == "police" then
        requestBackup(99)
    end
end)]]

RegisterCommand('code1backup', function()
    local playerData = ESX.GetPlayerData()
    if playerData.job.name == "police" then
        requestBackup(1)
    end
end)

RegisterCommand('code2backup', function()
    local playerData = ESX.GetPlayerData()
    if playerData.job.name == "police" then
        requestBackup(2)
    end
end)

RegisterCommand('code3backup', function()
    local playerData = ESX.GetPlayerData()
    if playerData.job.name == "police" then
        requestBackup(3)
    end
end)

RegisterCommand('code99backup', function()
    local playerData = ESX.GetPlayerData()
    if playerData.job.name == "police" then
        requestBackup(99)
    end
end)

RegisterNetEvent('police:receiveBackupRequest')
AddEventHandler('police:receiveBackupRequest', function(coords, codeTypeWithOfficerName)
    showNotification(codeTypeWithOfficerName .. " requested! Coordinates added to your map.")

    local backupBlip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(backupBlip, 304)
    SetBlipColour(backupBlip, 1)
    SetBlipScale(backupBlip, 0.8)
    SetBlipFlashes(backupBlip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(codeTypeWithOfficerName .. " Location")
    EndTextCommandSetBlipName(backupBlip)

    SetNewWaypoint(coords.x, coords.y)
    SetBlipRoute(backupBlip, true)
    SetBlipRouteColour(backupBlip, 1)

    Citizen.SetTimeout(40000, function()
        RemoveBlip(backupBlip)
    end)
end)

RegisterNetEvent('police:playAlertSoundForAll')
AddEventHandler('police:playAlertSoundForAll', function(soundName)
    TriggerEvent('InteractSound_CL:PlayOnOne', soundName, 1.0)
end)
