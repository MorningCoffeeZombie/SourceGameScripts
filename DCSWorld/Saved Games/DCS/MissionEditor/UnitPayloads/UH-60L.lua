local unitPayloads = {
	["name"] = "UH-60L",
	["payloads"] = {
		[1] = {
			["displayName"] = "CEFS 2x 200 Gallon Tanks 12x Seats",
			["name"] = "CEFS 2x 200 Gallon Tanks 12x Seats",
			["pylons"] = {
				[1] = {
					["CLSID"] = "{UH60_FUEL_TANK_230}",
					["num"] = 7,
				},
				[2] = {
					["CLSID"] = "{UH60_FUEL_TANK_230}",
					["num"] = 1,
				},
				[3] = {
					["CLSID"] = "{UH60_SEAT_CARGO_ALL}",
					["num"] = 4,
				},
				[4] = {
					["CLSID"] = "{UH60_PILOT}",
					["num"] = 9,
				},
				[5] = {
					["CLSID"] = "{UH60_COPILOT}",
					["num"] = 8,
				},
			},
			["tasks"] = {
				[1] = 35,
				[2] = 17,
			},
		},
	},
	["tasks"] = {
	},
	["unitType"] = "UH-60L",
}
return unitPayloads
