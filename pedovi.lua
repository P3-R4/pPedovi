
local pedovis = {}

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(500)
		for k,v in pairs(Config.Lista) do
			local x = GetEntityCoords(PlayerPedId())
			local distance = #(x - v.koordinate.xyz)
			if distance < Config.Distanca and not pedovis[k] then
				if v.spawnaj then 
				local spawnajpeda = blizupeda(v.pedic, v.koordinate, v.pol)
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
		blip = AddBlipForCoord(v.koordinate.xyz)
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

function blizupeda(pedic, koordinate, pol)
	RequestModel(pedic)
	while not HasModelLoaded(pedic) do
		Citizen.Wait(50)
	end
	if Config.SmanjiZ then
		spawnajpeda = CreatePed(Config.nebitno[pol], pedic, koordinate.x, koordinate.y, koordinate.z - 1.0, koordinate.w, false, true)
	else
		spawnajpeda = CreatePed(Config.nebitno[pol], pedic, koordinate.x, koordinate.y, koordinate.z, koordinate.w, false, true)
	end
	SetEntityAlpha(spawnajpeda, 0, false)
	FreezeEntityPosition(spawnajpeda, true)
	SetEntityInvincible(spawnajpeda, true)
	SetBlockingOfNonTemporaryEvents(spawnajpeda, true)

	
		for i = 0, 255, 51 do
			Citizen.Wait(50)
			SetEntityAlpha(spawnajpeda, i, false)
		end

	SetEntityAsMissionEntity(spawnajpeda, true, true)
	return spawnajpeda	
end





