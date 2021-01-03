local data = CharacterTweakData.init
function CharacterTweakData:init(tweak_data)
    data(self, tweak_data)
	-- Bikers --
	self.biker.HEALTH_INIT = 4
	self.biker.calls_in = false -- Stops them from calling the cops (unless its the camera operator)
	self.biker.allowed_stances = {
		cbt = true -- Makes them have Combat Animations, but still have detection and stuff tho they do will have ! in stealth thus revealing their location, but there is no fix for that i think, but it will look like they are on high alert so yeah
	}
end