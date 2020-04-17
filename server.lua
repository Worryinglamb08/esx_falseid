-- SKRYPT NAPISANY PRZEZ MILOMARA :)
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local katb = false
local kata = false
local katc = false
local czymadowod = false
local madowod = false
local jestb = 'nil'


function sprawdzdowod(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.getIdentifier()

local result = MySQL.Sync.fetchAll("SELECT * FROM falszywy_dowod WHERE identifier = @identifier",
    {
      ['@identifier']   = identifier

    })


	if result[1] ~= nil then
	   czymadowod = true
       madowod = true
	else
	   madowod = false
	end
end

ESX.RegisterServerCallback('esx_falszywy-dowod:sprawdzpieniadze', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local money    = xPlayer.getMoney(source)
    if money >= Config.CenaKupno then
     cb(true)
    else
     cb(false)
     TriggerClientEvent("pNotify:SetQueueMax", -1, hej, 4)
        TriggerClientEvent("pNotify:SendNotification", source, {
        text = "Nie posiadasz tyle pieniędzy!",
        type = "warning",
        progressBar = false,
        queue = "zeaq",
        timeout = 2000,
        layout = "bottomCenter"
        })
    end
end)

ESX.RegisterServerCallback('esx_falszywy-dowod:sprawdzpieniadzenausuniecie', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local money    = xPlayer.getMoney(source)
    if money >= Config.CenaUsuniecie then
     cb(true)
    else
     cb(false)
     TriggerClientEvent("pNotify:SetQueueMax", -1, hej, 4)
        TriggerClientEvent("pNotify:SendNotification", source, {
        text = "Nie posiadasz tyle pieniędzy!",
        type = "warning",
        progressBar = false,
        queue = "zeaq",
        timeout = 2000,
        layout = "bottomCenter"
        })
    end
end)

RegisterServerEvent('esx_falszywy-dowod:usunieciezbazydanych')
AddEventHandler('esx_falszywy-dowod:usunieciezbazydanych', function()
    local _source = source
  local xPlayer = ESX.GetPlayerFromId(source)
  local identifier = xPlayer.getIdentifier()

    MySQL.Async.execute("DELETE FROM falszywa_licencja WHERE identifier = @identifier", {
          ['@identifier'] = identifier
        })
     MySQL.Async.execute("DELETE FROM falszywy_dowod WHERE identifier = @identifier", {
          ['@identifier'] = identifier
        })
    print('usunął')
    if(xPlayer.getMoney() >= Config.CenaUsuniecie) then
      print('5')
    xPlayer.removeMoney(Config.CenaUsuniecie)
    local iloscDowod = xPlayer.getInventoryItem('falszywydowod').count
    if iloscDowod >= 1 then
    xPlayer.removeInventoryItem('falszywydowod', iloscDowod)
    end
    TriggerClientEvent("esx:showNotification",source,"~g~Zostałeś usunięty z bazy danych handlarza i oddałeś każdy dowód, który miałeś ze sobą")
    end
end)

ESX.RegisterServerCallback('esx_falszywy-dowod:sprawdzczyjuzniemadowodu', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local money    = xPlayer.getMoney(source)
    local dowod    = sprawdzdowod(source)
    if czymadowod == true or madowod == true then
     cb(false)
    else
      print('true')
     cb(true)
    end
end)

RegisterServerEvent('esx_falszywy-dowod:kupdowod')
AddEventHandler('esx_falszywy-dowod:kupdowod', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local identifier = xPlayer.getIdentifier()

	local imie 
	local nazwisko
	local dateofbirth = "1992/03/12"
	local height
	local prawojazdy 

	local wylosujnazwe = math.random(1,20)
		if wylosujnazwe == 1 then
           imie = 'Marian'
           nazwisko = 'Kowalski'
        elseif wylosujnazwe == 2 then
        	imie = 'James'
        	nazwisko = 'Gordon'
        elseif wylosujnazwe == 3 then
        	imie = 'Sasha'
        	nazwisko = 'Jakubovich'
        elseif wylosujnazwe == 4 then
        	imie = 'Harry'
        	nazwisko = 'Smith'
        elseif wylosujnazwe == 5 then
        	imie = 'John'
        	nazwisko = 'McDonald'
        elseif wylosujnazwe == 6 then
        	imie = 'Jeff'
        	nazwisko = 'Miklovich'
        elseif wylosujnazwe == 7 then
        	imie = 'Antonio'
        	nazwisko = 'Alonzo'
        elseif wylosujnazwe == 8 then
        	imie = 'Nicolaus'
        	nazwisko = 'Laida'
        elseif wylosujnazwe == 9 then
        	imie = 'Nikodem'
        	naziwsko = 'Pardonowski'
        elseif wylosujnazwe == 10 then
        	imie = 'Felipe'
        	nazwisko = 'Garcia'
        elseif wylosujnazwe > 10 then
        	imie = 'James'
        	nazwisko = 'Laputos'
        end
        print(imie,nazwisko)

    	local dateofbirth = math.random(1,10)
        if dateofbirth == 1 then
        	dateofbirth = "1995/06/30"
        elseif dateofbirth == 2 then
        	dateofbirth = "1992/11/25"
        elseif dateofbirth == 3 then
        	dateofbirth = "1977/04/01"
        elseif dateofbirth == 4 then
        	dateofbirth = "1985/01/30"
        elseif dateofbirth == 5 then
        	dateofbirth = "1989/12/31"
        elseif dateofbirth == 6 then
        	dateofbirth = "1988/01/01"
        elseif dateofbirth == 7 then
        	dateofbirth = "1979/02/03"
        elseif dateofbirth == 8 then
        	dateofbirth = "1975/05/30"
        elseif dateofbirth == 9 then
        	dateofbirth = "1993/03/20"
        elseif dateofbirth == 10 then
        	dateofbirth = "1991/08/15"
        else
        	dateofbirth = "1987/03/25"
        end

    	sex = math.random(1,2)
    	if sex == 1 then
    		sex = 'M'
    	elseif sex == 2 then
    	    sex = 'K'
      end
        print(sex)
    
    	height = math.random(150,190)
    	print(height)

	MySQL.Async.execute("INSERT INTO falszywy_dowod (identifier,dateofbirth,sex,height,firstname,lastname) VALUES (@identifier,@dateofbirth,@sex,@height,@firstname,@lastname)",
			{
			 ['@identifier'] = identifier,
			 ['@dateofbirth'] = dateofbirth,
			 ['@sex'] = sex,
			 ['@height'] = height,
			 ['@firstname'] = imie,
			 ['@lastname'] = nazwisko 			 
			})
    if Config.Lickabron then
    	local szansa = math.random(1,100)
        if szansa < Config.SzansaLickaBron then
	MySQL.Async.execute("INSERT INTO falszywa_licencja (identifier,type) VALUES (@identifier,@type)",
			{
			 ['@identifier'] = identifier,
			 ['@type'] = 'weapon'			 
			})
	   print('gosteczek ma farta#BRON')
       end
    end

    if Config.NNW then
    	local szansa = math.random(1,100)
        if szansa < Config.SzansaNNW  then
	MySQL.Async.execute("INSERT INTO falszywa_licencja (identifier,type) VALUES (@identifier,@type)",
			{
			 ['@identifier'] = identifier,
			 ['@type'] = 'NNW'			 
			})
	   print('gosteczek ma farta#NNW')
       end
    end

    if Config.PrawoJazdy then
    	local prawojazdy = math.random(1,50)
    	local jestchujowo = math.random(1,10)
    	if prawojazdy < 25 then
    		prawojazdy = 'drive'
      elseif prawojazdy > 25 and prawojazdy <= 35 then
        prawojazdy= 'drive'
    		prawojazdy2 = 'drive_bike'
    	elseif prawojazdy > 35 and prawojazdy < 45 then
    		prawojazdy = 'drive'
    		prawojazdy3 = 'drive_truck'
    	elseif prawojazdy > 45 and prawojazdy < 49 then
    		prawojazdy = 'drive_bike'
    		prawojazdy3 = 'drive_truck'
    	elseif prawojazdy == 50 then
    		prawojazdy = 'drive'
    		prawojazdy2 = 'drive_bike'
    		prawojazdy3 = 'drive_truck'
      end
        MySQL.Async.execute("INSERT INTO falszywa_licencja (identifier,type) VALUES (@identifier,@type)",
			{
			 ['@identifier'] = identifier,
			 ['@type'] = prawojazdy			 
			})
        if prawojazdy2 ~= nil then
        	MySQL.Async.execute("INSERT INTO falszywa_licencja (identifier,type) VALUES (@identifier,@type)",
			{
			 ['@identifier'] = identifier,
			 ['@type'] = prawojazdy2			 
			})
		end
		if prawojazdy3 ~= nil then
			MySQL.Async.execute("INSERT INTO falszywa_licencja (identifier,type) VALUES (@identifier,@type)",
			{
			 ['@identifier'] = identifier,
			 ['@type'] = prawojazdy3		 
			})
		end
    end

	if(xPlayer.getMoney() >= Config.CenaKupno) then
		xPlayer.removeMoney(Config.CenaKupno)
		xPlayer.addInventoryItem('falszywydowod', 1)
        TriggerClientEvent("esx:showNotification",source,"~g~Zakupiłeś fałszywy dowód osobisty")
        TriggerClientEvent("esx:showNotification",source,"Na dowodzie masz napisane: ~b~".. imie .. " " .. nazwisko)
    end
end)






function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM falszywy_dowod WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height']
                        
		}
	else
		return nil
	end 
end
function getlicenseB(source)
	local identifier = GetPlayerIdentifiers(source)[1]

local result = MySQL.Sync.fetchAll("SELECT * FROM falszywa_licencja WHERE type = @type and identifier = @identifier",
    {
      ['@identifier']   = identifier,
      ['@type'] = 'drive'

    })


	if result[1] ~= nil then

katb = true
jestb = '~h~~g~B ~s~'
	else
		jestb = '~h~~r~B ~s~'
	end
end
function getlicenseA(source)
	local identifier = GetPlayerIdentifiers(source)[1]

local result = MySQL.Sync.fetchAll("SELECT * FROM falszywa_licencja WHERE type = @type and identifier = @identifier",
    {
      ['@identifier']   = identifier,
      ['@type'] = 'drive_bike'

    })


	if result[1] ~= nil then

kata = true
jesta = '~h~~g~A ~s~'
	else
				jesta = '~h~~r~A ~s~'
	end
end
function getlicenseC(source)
	local identifier = GetPlayerIdentifiers(source)[1]

local result = MySQL.Sync.fetchAll("SELECT * FROM falszywa_licencja WHERE type = @type and identifier = @identifier",
    {
      ['@identifier']   = identifier,
      ['@type'] = 'drive_truck'

    })


	if result[1] ~= nil then

katc = true
jestc = '~h~~g~C~n~ ~s~'
	else
				jestc = '~h~~r~C ~n~~s~'
	end
end

function getlicenseW(source)
	local identifier = GetPlayerIdentifiers(source)[1]

local result = MySQL.Sync.fetchAll("SELECT * FROM falszywa_licencja WHERE type = @type and identifier = @identifier",
    {
      ['@identifier']   = identifier,
      ['@type'] = 'weapon'

    })


	if result[1] ~= nil then


jestw = '~g~Tak~n~ ~s~'
	else
				jestw = '~r~Nie~n~ ~s~'
	end
end

function getlicenseNNW(source)
	local identifier = GetPlayerIdentifiers(source)[1]

local result = MySQL.Sync.fetchAll("SELECT * FROM falszywa_licencja WHERE type = @type and identifier = @identifier",
    {
      ['@identifier']   = identifier,
      ['@type'] = 'NNW'

    })


	if result[1] ~= nil then


jestnnw = '~g~NNW~n~ ~s~'
	else
				jestnnw = '~r~NNW~n~ ~s~'
	end
end

RegisterServerEvent('esx_falszywy-dowod:pokaz')
AddEventHandler('esx_falszywy-dowod:pokaz', function(source)
		  local _source = source
		  local xPlayer = ESX.GetPlayerFromId(_source)

          local lickaB = getlicenseB(source)
          local lickaA = getlicenseA(source)
          local lickaC = getlicenseC(source)
          local lickaW = getlicenseW(source)
          local lickaNNW = getlicenseNNW(source)
          local name = getIdentity(source)

	TriggerClientEvent('esx_falszywy-dowod_pokazdowod', -1,_source,  '~h~'..name.firstname..' '..name.lastname,name.dateofbirth,'Licencja Na Bron: '..jestw.. 'Kat: '..jestb..''..jesta..''..jestc..''.. 'Ubezpieczenia: '..jestnnw)
    TriggerClientEvent('3dme:triggerDisplay', -1, 'Pokazuje dowód osobisty', _source)
    TriggerClientEvent("milomar:animDowod", _source)
end)

RegisterCommand('falszywydowod', function(source)
	      local _source = source
		  local xPlayer = ESX.GetPlayerFromId(_source)

          local lickaB = getlicenseB(source)
          local lickaA = getlicenseA(source)
          local lickaC = getlicenseC(source)
          local lickaW = getlicenseW(source)
          local lickaNNW = getlicenseNNW(source)
          local name = getIdentity(source)
          local dowod    = sprawdzdowod(source)

    if xPlayer.getInventoryItem('falszywydowod').count >= 1 then
    	if czymadowod == true then
        if name == nil then
          TriggerClientEvent('esx:showNotification', _source, '~r~Ten fałszywy dowód nie jest zarejestrowany na ciebie.')
            TriggerClientEvent('esx:showNotification', _source, '~r~Skonktaktuj się z handlarzem, aby rozwiązać problem.')
        else
	        TriggerClientEvent('esx_falszywy-dowod:pokazdowod', -1,_source,  '~h~'..name.firstname..' '..name.lastname,name.dateofbirth,'Licencja Na Bron: '..jestw.. 'Kat: '..jestb..''..jesta..''..jestc.. 'Ubezpieczenia: '..jestnnw)
            TriggerClientEvent('3dme:triggerDisplay', -1, 'Pokazuje dowód osobisty', _source)
            TriggerClientEvent("milomar:animDowod", _source)
        end
        else
            TriggerClientEvent('esx:showNotification', _source, '~r~Ten fałszywy dowód nie jest zarejestrowany na ciebie.')
            TriggerClientEvent('esx:showNotification', _source, '~r~Skonktaktuj się z handlarzem, aby rozwiązać problem.')
       end
    else 
      TriggerClientEvent('esx:showNotification', _source, '~r~Nie masz przy sobie fałszywego dowodu osobistego')
    end
end)

ESX.RegisterUsableItem('falszywydowod', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

          local lickaB = getlicenseB(source)
          local lickaA = getlicenseA(source)
          local lickaC = getlicenseC(source)
          local lickaW = getlicenseW(source)
          local lickaNNW = getlicenseNNW(source)
          local name = getIdentity(source)
          local dowod    = sprawdzdowod(source)


    if czymadowod == true then
	TriggerClientEvent('esx_falszywy-dowod:pokazdowod', -1,_source,  '~h~'..name.firstname..' '..name.lastname,name.dateofbirth,'Licencja Na Bron: '..jestw.. 'Kat: '..jestb..''..jesta..''..jestc.. 'Ubezpieczenia: '..jestnnw)
    TriggerClientEvent('3dme:triggerDisplay', -1, 'Pokazuje dowód osobisty', _source)
    TriggerClientEvent("milomar:animDowod", _source)
    else
    	TriggerClientEvent('esx:showNotification', _source, '~r~Ten fałszywy dowód nie jest zarejestrowany na ciebie.')
      TriggerClientEvent('esx:showNotification', _source, '~r~Skonktaktuj się z handlarzem, aby rozwiązać problem.')
    end
end)

