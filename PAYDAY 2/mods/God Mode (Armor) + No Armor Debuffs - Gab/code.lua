local old_NAD_init = UpgradesTweakData._init_pd2_values
 
function UpgradesTweakData:_init_pd2_values(tweak_data)
    old_NAD_init(self, tweak_data)
	self.values.player.body_armor = {
		armor = {
			99200,
			99200,
			99200,
			99200,
			99200,
			99200,
			99200
		},
		movement = {
			1.0975,
			1.0975,
			1.0975,
			1.0975,
			1.0975,
			1.0975,
			1.0975
		},
		concealment = {
			30,
			26,
			23,
			21,
			18,
			12,
			1
		},
		dodge = {
			90.05,
			90.05,
			90.05,
			90.05,
			90.05,
			90.05,
			90.05
		},
		damage_shake = {
			0.95,
			0.95,
			0.95,
			0.95,
			0.95,
			0.95,
			0.95
		},
		stamina = {
			91.075,
			91.075,
			91.075,
			91.075,
			91.075,
			91.075,
			91.075
		},
		skill_ammo_mul = {
			91.9,
			91.9,
			91.9,
			91.9,
			91.9,
			91.9,
			91.9
		}
	}
	end
	