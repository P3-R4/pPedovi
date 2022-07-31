
local pedovis = {}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		for k,v in pairs(Config.Lista) do
			local playerCoords = GetEntityCoords(PlayerPedId())
			local distance = #(playerCoords - v.coords.xyz)
			if distance < Config.Distanca and not pedovis[k] then
				if v.spawnaj then 
				local spawnajpeda = blizupeda(v.pedic, v.coords, v.gender, v.animDict, v.animName, v.scenario)
				pedovis[k] = { spawnajpeda = spawnajpeda }
				end
			end
			if distance >= Config.Distanca and pedovis[k] then
				if Config.FadeIn then
					for i = 255, 0, -51 do
						Citizen.Wait(50)
						SetEntityAlpha(pedovis[k].spawnajpeda, i, false)
					end
				end
				SetEntityAsNoLongerNeeded(pedovis[k].spawnajpeda)
				DeletePed(pedovis[k].spawnajpeda)
				pedovis[k] = nil
			end
		end
	end
end)


CreateThread(function()
	for k,v in pairs(Config.Lista) do
		if v.crtajblip then 
		blip = AddBlipForCoord(v.coords.xyz)
		SetBlipSprite(blip, v.blipsp)
		SetBlipDisplay(blip, 4)
		SetBlipScale(blip, 0.8)
		SetBlipColour(blip, v.bojablipa)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString(v.imeblipa)
		EndTextCommandSetBlipName(blip)
		end
	end
end)

function blizupeda(pedic, coords, gender, animDict, animName, scenario)
	RequestModel(pedic)
	while not HasModelLoaded(pedic) do
		Citizen.Wait(50)
	end
	if Config.SmanjiZ then
		spawnajpeda = CreatePed(Config.nebitno[gender], pedic, coords.x, coords.y, coords.z - 1.0, coords.w, false, true)
	else
		spawnajpeda = CreatePed(Config.nebitno[gender], pedic, coords.x, coords.y, coords.z, coords.w, false, true)
	end
	SetEntityAlpha(spawnajpeda, 0, false)
	FreezeEntityPosition(spawnajpeda, true)
	SetEntityInvincible(spawnajpeda, true)
	SetBlockingOfNonTemporaryEvents(spawnajpeda, true)

	if animDict and animName then
		RequestAnimDict(animDict)
		while not HasAnimDictLoaded(animDict) do
			Citizen.Wait(50)
		end
		TaskPlayAnim(spawnajpeda, animDict, animName, 8.0, 0, -1, 1, 0, 0, 0)
	end
	if scenario then
		TaskStartScenarioInPlace(spawnajpeda, scenario, 0, true)
	end
	
		for i = 0, 255, 51 do
			Citizen.Wait(50)
			SetEntityAlpha(spawnajpeda, i, false)
		end

	SetEntityAsMissionEntity(spawnajpeda, true, true)
	return spawnajpeda	
end





