-- original model from https://www.moddb.com/mods/gof2-star-wars-ships by kroete

local shipid = 0

-- I need to inject the resources in the game init not in the modding api init (EarlyInit) because Globals::canvas isn't initialized in the game!
HookFunction("Globals::init", function(ctx)
    	local normal = asset:CreateTexture("mods/tieln_fighter/normal.aei")
	local diffuse = asset:CreateTexture("mods/tieln_fighter/diffuse.aei")
    	local material = asset:CreateMaterial(diffuse, normal, 29) -- diffuse id, normal id, shader id
    	local lod = asset:CreateMesh("mods/tieln_fighter/mainmodel.aem", material)
    	local shipinfo = {
		armor = 160,
		maxcargo = 130,
		hangar_y = 160,
		primaryslots = 2,
		secondaryslots = 1,
		turretslots = 0,
		equipmentslots = 8,
		handling = 117,
		baseprice = 246568,
        	primary_positions = { {-33, 113, 120}, {35, 113, 120} },
        	secondary_positions = { {0, 133, 106} },
        	turret_positions = { {0, 0, 0} },
		engines = {
    			{ pos = {0, 199, -336}, intensity = {0.4, 0.4, 0.4} }
		}
    	}
    	shipid = ctx:CreateShip("TIE/LN starfighter", "The first TIE fighter was found floating in space by terran explorers in the Beidan system shortly after the appearance of the Void. Postponing the construction of Kothar station, the terrans set out to replicate the ship. It's origins are still unknown.", shipinfo, diffuse, normal, material, lod, lod, lod)
	print("[TIE/LN Fighter] Injected ship successfully id: " .. shipid .. ", original model by Kroete")
end)

RegisterEvent("OnStationChanged", function(id)
	if id == 100 then -- in kothar
		station:AddHangarShip(shipid)
	end
end)