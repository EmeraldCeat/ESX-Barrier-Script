local ESX = nil
local PlayerData = {}

Citizen.CreateThread(function()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(1000)
    end
  
    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

RegisterCommand('barrier1', function()
    CreateObject('prop_roadcone02a')
end)

RegisterCommand('barrier2', function()
    CreateObject('prop_barrier_work05')
end)

RegisterCommand('barrier3', function()
    CreateObject('p_ld_stinger_s')
end)

function CreateObject(name)
    if ESX.PlayerData.job.name == 'police' then
        local ped = GetPlayerPed(-1)
        local coords = GetEntityCoords(ped)
        local forward = GetEntityForwardVector(ped)
        local x, y, z = table.unpack(coords + forward * 1.0)

        Citizen.Wait(2)

        if name == 'prop_roadcone02a' then
            z = z - 2.0
        end

        ESX.Game.SpawnObject(name, {x = x, y = y, z = z}, function(obj)
            SetEntityHeading(obj, GetEntityHeading(ped))
            PlaceObjectOnGroundProperly(obj)
            FreezeEntityPosition(obj, true)
        end)
    else
        ESX.ShowNotification("Ти не си полицай!", "error", 3000)
    end
end