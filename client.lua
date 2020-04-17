--- SKRYPT NAPISANY PRZEZ MILOMARA :)
ESX                           = nil
local PlayerData                = {}

Citizen.CreateThread(function()

	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

function ShowAdvancedNotification(title, subject, msg, icon, iconType)


	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	SetNotificationMessage(icon, icon, false, iconType, title, subject)
	DrawNotification(false, false)

end

RegisterNetEvent('esx_falszywy-dowod:pokazdowod')
AddEventHandler('esx_falszywy-dowod:pokazdowod', function(id, imie, data, dodatek)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(pid))
  if pid == myId then
  SetNotificationBackgroundColor(200)
  ShowAdvancedNotification(imie, data, dodatek, mugshotStr, 8)

  elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.999 then
  SetNotificationBackgroundColor(200)
  ShowAdvancedNotification(imie, data, dodatek, mugshotStr, 8)

  end
  
  UnregisterPedheadshot(mugshot)

end)

local blips = {
  {name="Fałszywy dowód", id=459, x= 2358.65, y= 2529.83, z= 45.8, color= 1},
}

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    for _, item in pairs(blips) do
    if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x, item.y, item.z, true) <= 25 then
      DrawMarker(27, item.x, item.y, item.z, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.001, 2.0001, 0.1001, 213, 1, 32, 100, false, true, 2, false, false, false, false)
        if GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1)), item.x,item.y,item.z, true) <= 1.5 then
          ESX.ShowHelpNotification("Naciśnij ~INPUT_VEH_HORN~ aby wyrobić nowy dowód osobisty", 0)
          --print('jg')
          
            if IsControlJustPressed(1,38) then
                kupdowod()
            end
        end
      end
    end
  end
end)

function kupdowod()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'handlarzyk',
        {
            title    = 'Handlarz',
            align    = 'top',
            elements = {
        {label = 'Dowód osobisty - 5000$', value = 'kupdowod' },
        {label = 'Usuń się z bazy danych - 5000$', value = 'usundowod' },
            }
        },
        function(data, menu)
            if data.current.value == 'kupdowod' then
                ESX.TriggerServerCallback('esx_falszywy-dowod:sprawdzpieniadze', function(hasMoney)
                    if hasMoney then
                      ESX.TriggerServerCallback('esx_falszywy-dowod:sprawdzczyjuzniemadowodu', function(niemadowodu)
                        if niemadowodu then
                        TriggerServerEvent('esx_falszywy-dowod:kupdowod')
                        else
                          ESX.ShowNotification('~r~Widniejesz już w bazie danych handlarza.')
                          ESX.ShowNotification('~r~Usuń się, a następnie spróbuj ponownie.')
                        end
                      end)
                    end
                end) 
            elseif data.current.value == 'usundowod' then
            	ESX.TriggerServerCallback('esx_falszywy-dowod:sprawdzczyjuzniemadowodu', function(niemadowodu)
            		if niemadowodu then
            			ESX.ShowNotification('~r~Nie widniejesz w bazie danych handlarza.')
            		else
            			ESX.TriggerServerCallback('esx_falszywy-dowod:sprawdzpieniadzenausuniecie', function(hasMoney)
                        if hasMoney then
                           TriggerServerEvent('esx_falszywy-dowod:usunieciezbazydanych')
                        end
                    end)
            end
        ESX.UI.Menu.CloseAll()
    end)
end
end,
    function(data, menu)
        menu.close()
    end)
end
RegisterNetEvent("milomar:animDowod")
AddEventHandler("milomar:animDowod", function()

local plateModel = "prop_cs_business_card"
local animDict = "missfbi_s4mop"
local animName = "swipe_card"
local plate_net = nil

  RequestModel(GetHashKey(plateModel))
  while not HasModelLoaded(GetHashKey(plateModel)) do
    Citizen.Wait(100)
  end

  RequestAnimDict(animDict)
  while not HasAnimDictLoaded(animDict) do
    Citizen.Wait(100)
  end

  local plyCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
  local platespawned = CreateObject(GetHashKey(plateModel), plyCoords.x, plyCoords.y, plyCoords.z, 1, 1, 1)
  Citizen.Wait(10)
  local netid = ObjToNet(platespawned)
  SetNetworkIdExistsOnAllMachines(netid, true)
  SetNetworkIdCanMigrate(netid, false)
  TaskPlayAnim(GetPlayerPed(PlayerId()), 1.0, -1, -1, 50, 0, 0, 0, 0)
  TaskPlayAnim(GetPlayerPed(PlayerId()), animDict, animName, 1.0, 1.0, -1, 50, 0, 0, 0, 0)
  Citizen.Wait(800)
  AttachEntityToEntity(platespawned, GetPlayerPed(PlayerId()), GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 1, 0, 1)
  plate_net = netid
  Citizen.Wait(3000)
  ClearPedSecondaryTask(GetPlayerPed(PlayerId()))
  DetachEntity(NetToObj(plate_net), 1, 1)
  DeleteEntity(NetToObj(plate_net))
  plate_net = nil
end)
