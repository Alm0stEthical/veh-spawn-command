--- by https://github.com/dfuzeyyy ---

function ShowNotification(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    DrawNotification(false, false)
end

local spawnedVehicle = nil

--- you may change the / command right now its /veh {vehname}
RegisterCommand('veh', function(source, args, rawCommand)
    local veh = args[1]
    if veh == nil then
        veh = "adder"
    end
    vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)

    Citizen.CreateThread(function()
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 5000 then
                ShowNotification("~r~A crash was avoided because the car model could not be loaded in time.")
                break
            end
        end
        if HasModelLoaded(vehiclehash) then
            local playerPed = PlayerPedId()
            local x, y, z = table.unpack(GetEntityCoords(playerPed))
            local heading = GetEntityHeading(playerPed)
            
            if IsPedInAnyVehicle(playerPed, false) then
                local currentVehicle = GetVehiclePedIsIn(playerPed, false)
                local oldHeading = GetEntityHeading(currentVehicle)
                DeleteEntity(currentVehicle)
                
                heading = oldHeading
            end
            
            local vehicle = CreateVehicle(vehiclehash, x, y, z, heading + 90, 1, 0)
            SetPedIntoVehicle(playerPed, vehicle, -1)
            SetEntityAsNoLongerNeeded(vehicle)
            SetModelAsNoLongerNeeded(vehiclehash)
            spawnedVehicle = vehicle
            ShowNotification("~g~Vehicle Successfully Spawned!")
        end
    end)
end)