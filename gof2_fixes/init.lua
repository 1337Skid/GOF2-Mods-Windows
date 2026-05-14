RegisterEvent("EarlyInit", function()
	-- NOP the function that is pushing the player when colliding on stations/freighters
	memoryutils:PatchByte(0x4AF717, 0x90)
	memoryutils:PatchByte(0x4AF718, 0x90)
end)
