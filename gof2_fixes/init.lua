RegisterEvent("EarlyInit", function()
	-- NOP (aka disable) the function that is pushing the player when colliding on stations/freighters
	memoryutils:PatchByte(0x4AF717, 0x90)
	memoryutils:PatchByte(0x4AF718, 0x90)
    -- Disable boost
	memoryutils:PatchByte(0x494D31 + 0, 0xD9) -- fldz
    memoryutils:PatchByte(0x494D31 + 1, 0xEE) -- fldz
	memoryutils:PatchByte(0x494D31 + 2, 0x90) -- mostly padding
    memoryutils:PatchByte(0x494D31 + 3, 0x90)
end)
