Hooks:PostHook(GroupAITweakData, "_init_task_data", "STOP_THE_GARBAGE_COPYPASTE_LOL_init_task_data", function(self, difficulty_index, difficulty)
	local is_console = SystemInfo:platform() ~= Idstring("WIN32")
	self.max_nr_simultaneous_boss_types = 0
	self.difficulty_curve_points = {0.5}
	if difficulty_index < 6 then
		self.smoke_and_flash_grenade_timeout = {10, 20}
	else
		self.smoke_and_flash_grenade_timeout = {4, 6}
	end
	if difficulty_index < 6 then
		self.smoke_grenade_lifetime = 7.5
	else
		self.smoke_grenade_lifetime = 12
	end
	self.flash_grenade_lifetime = 7.5
	self.flash_grenade = {
		timer = 3,
		range = 1000,
		light_color = Vector3(255, 0, 0),
		light_range = 300,
		light_specular = 1,
		beep_speed = {0.1, 0.025},
		beep_fade_speed = 4,
		beep_multi = 0.3
	}
	if difficulty_index < 6 then
		self.flash_grenade.timer = 3
	else
		self.flash_grenade.timer = 2
	end
	self.optimal_trade_distance = {0, 0}
	self.bain_assault_praise_limits = {1, 3}
	if difficulty_index <= 2 then
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				interval = {180, 300},
				retire_delay = 30
			},
			recurring_spawn_1 = {
				interval = {30, 60}
			}
		}
	elseif difficulty_index == 3 then
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				interval = {60, 120},
				retire_delay = 30
			},
			recurring_spawn_1 = {
				interval = {30, 60}
			}
		}
	elseif difficulty_index == 4 then
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				interval = {45, 60},
				retire_delay = 30
			},
			recurring_spawn_1 = {
				interval = {30, 60}
			}
		}
	elseif difficulty_index == 5 then
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				interval = {20, 40},
				retire_delay = 30
			},
			recurring_spawn_1 = {
				interval = {30, 60}
			}
		}
	else
		self.besiege.recurring_group_SO = {
			recurring_cloaker_spawn = {
				interval = {20, 40},
				retire_delay = 30
			},
			recurring_spawn_1 = {
				interval = {30, 60}
			}
		}
	end
	self.besiege.regroup.duration = {
		15,
		15,
		15
	}
	self.besiege.assault = {}
	self.besiege.assault.anticipation_duration = {
		{30, 1},
		{30, 1},
		{45, 0.5}
	}
	self.besiege.assault.build_duration = 35
	self.besiege.assault.sustain_duration_min = {
		0,
		80,
		120
	}
	self.besiege.assault.sustain_duration_max = {
		0,
		80,
		120
	}
	self.besiege.assault.sustain_duration_balance_mul = {
		1,
		1.1,
		1.2,
		1.3
	}
	self.besiege.assault.fade_duration = 5
	if difficulty_index <= 2 then
		self.besiege.assault.delay = {
			80,
			70,
			30
		}
	elseif difficulty_index == 3 then
		self.besiege.assault.delay = {
			45,
			35,
			20
		}
	elseif difficulty_index == 4 then
		self.besiege.assault.delay = {
			40,
			30,
			20
		}
	elseif difficulty_index == 5 then
		self.besiege.assault.delay = {
			30,
			20,
			15
		}
	else
		self.besiege.assault.delay = {
			20,
			15,
			10
		}
	end
	if difficulty_index <= 5 then
		self.besiege.assault.hostage_hesitation_delay = {
			30,
			30,
			30
		}
	else
		self.besiege.assault.hostage_hesitation_delay = {
			10,
			10,
			10
		}
	end
	if is_console then
		self.besiege.assault.force = {
			0,
			4,
			7
		}
		self.besiege.assault.force_pool = {
			0,
			60,
			100
		}
	else
		self.besiege.assault.force = {
			0,
			7,
			9
		}
		self.besiege.assault.force_pool = {
			0,
			20,
			50
		}
	end
	if is_console then
		if difficulty_index <= 2 then
			self.besiege.assault.force_balance_mul = {
				1,
				1.1,
				1.2,
				1.3
			}
			self.besiege.assault.force_pool_balance_mul = {
				1,
				1.1,
				1.2,
				1.3
			}
		elseif difficulty_index == 3 then
			self.besiege.assault.force_balance_mul = {
				1.2,
				1.4,
				1.6,
				1.8
			}
			self.besiege.assault.force_pool_balance_mul = {
				1.2,
				1.4,
				1.6,
				1.8
			}
		elseif difficulty_index == 4 then
			self.besiege.assault.force_balance_mul = {
				1.6,
				1.8,
				2,
				2.2
			}
			self.besiege.assault.force_pool_balance_mul = {
				1.7,
				2,
				2.2,
				2.4
			}
		elseif difficulty_index == 5 then
			self.besiege.assault.force_balance_mul = {
				1.8,
				2.1,
				2.4,
				2.8
			}
			self.besiege.assault.force_pool_balance_mul = {
				2.2,
				2.4,
				2.6,
				2.8
			}
		else
			self.besiege.assault.force_balance_mul = {
				1.8,
				2.1,
				2.4,
				2.8
			}
			self.besiege.assault.force_pool_balance_mul = {
				2.2,
				2.4,
				2.6,
				2.8
			}
		end
	elseif difficulty_index <= 2 then
		self.besiege.assault.force_balance_mul = {
			0.9,
			1.5,
			2,
			2.25
		}
		self.besiege.assault.force_pool_balance_mul = {
			1,
			1.5,
			2,
			3
		}
	elseif difficulty_index == 3 then
		self.besiege.assault.force_balance_mul = {
			1,
			1.4,
			1.6,
			1.9
		}
		self.besiege.assault.force_pool_balance_mul = {
			1.2,
			1.4,
			1.6,
			1.9
		}
	elseif difficulty_index == 4 then
		self.besiege.assault.force_balance_mul = {
			1.4,
			1.8,
			2,
			2.4
		}
		self.besiege.assault.force_pool_balance_mul = {
			1.7,
			2,
			2.2,
			2.5
		}
	elseif difficulty_index == 5 then
		self.besiege.assault.force_balance_mul = {
			2,
			2.5,
			2.9,
			3.2
		}
		self.besiege.assault.force_pool_balance_mul = {
			2.2,
			2.4,
			2.6,
			3
		}
	elseif difficulty_index == 6 then
		self.besiege.assault.force_balance_mul = {
			2,
			2.5,
			2.9,
			3.2
		}
		self.besiege.assault.force_pool_balance_mul = {
			2.2,
			2.4,
			2.6,
			3
		}
	elseif difficulty_index == 7 then
		self.besiege.assault.force_balance_mul = {
			2,
			2.5,
			2.9,
			3.2
		}
		self.besiege.assault.force_pool_balance_mul = {
			2.2,
			2.4,
			2.6,
			3
		}
	else
		self.besiege.assault.force_balance_mul = {
			4,
			4.2,
			4.5,
			4.9
		}
		self.besiege.assault.force_pool_balance_mul = {
			3,
			5,
			7,
			9
		}
	end
	if difficulty_index <= 2 then
		self.besiege.assault.groups = {
			tac_swat_shotgun_rush = {
				0,
				1,
				0.85
			},
			tac_swat_shotgun_flank = {
				0,
				1,
				0.85
			},
			tac_swat_rifle = {
				0,
				1,
				0.85
			},
			tac_swat_rifle_flank = {
				0,
				1,
				0.85
			},
			tac_shield_wall_ranged = {
				0,
				0,
				0.15
			},
			tac_shield_wall_charge = {
				0,
				0,
				0.15
			},
			tac_shield_wall = {
				0,
				0,
				0.15
			},
			tac_tazer_flanking = {
				0,
				0.05,
				0.15
			},
			tac_tazer_charge = {
				0,
				0.05,
				0.15
			},
			single_spoocs = {
				0,
				0.05,
				0.10
			},
			tac_bull_rush = {
				0,
				0.01,
				0.05
			}
		}
	elseif difficulty_index == 3 then
		self.besiege.assault.groups = {
			tac_swat_shotgun_rush = {
				0,
				1,
				0
			},
			tac_swat_shotgun_flank = {
				0,
				1,
				0
			},
			tac_swat_rifle = {
				0,
				0.2,
				0.7
			},
			tac_swat_rifle_flank = {
				0,
				0.2,
				0.7
			},
			tac_shield_wall_ranged = {
				0,
				0.02,
				0.2
			},
			tac_shield_wall_charge = {
				0,
				0.02,
				0.2
			},
			tac_shield_wall = {
				0,
				0.02,
				0.2
			},
			tac_tazer_flanking = {
				0,
				0.05,
				0.15
			},
			tac_tazer_charge = {
				0,
				0.05,
				0.15
			},
			single_spoocs = {
				0,
				0.05,
				0.15
			},
			tac_bull_rush = {
				0,
				0.01,
				0.05
			}
		}
	elseif difficulty_index == 4 then
		self.besiege.assault.groups = {
			tac_swat_shotgun_rush = {
				0.1,
				1,
				1
			},
			tac_swat_shotgun_flank = {
				0.1,
				1,
				1
			},
			tac_swat_rifle = {
				0.05,
				0.25,
				0.5
			},
			tac_swat_rifle_flank = {
				0.05,
				0.25,
				0.5
			},
			tac_shield_wall_ranged = {
				0.1,
				0.2,
				0.2
			},
			tac_shield_wall_charge = {
				0.1,
				0.2,
				0.2
			},
			tac_shield_wall = {
				0.1,
				0.2,
				0.2
			},
			tac_tazer_flanking = {
				0.05,
				0.15,
				0.2
			},
			tac_tazer_charge = {
				0.05,
				0.15,
				0.2
			},
			FBI_spoocs = {
				0,
				0.1,
				0.2
			},
			tac_bull_rush = {
				0,
				0.1,
				0.15
			}
		}
	elseif difficulty_index == 5 then
		self.besiege.assault.groups = {
			tac_swat_shotgun_rush = {
				0.2,
				1,
				1
			},
			tac_swat_shotgun_flank = {
				0.2,
				1,
				1
			},
			tac_swat_rifle = {
				0.1,
				0.5,
				0.75
			},
			tac_swat_rifle_flank = {
				0.1,
				0.5,
				0.75
			},
			tac_shield_wall_ranged = {
				0.1,
				0.3,
				0.4
			},
			tac_shield_wall_charge = {
				0.1,
				0.3,
				0.4
			},
			tac_shield_wall = {
				0.1,
				0.3,
				0.4
			},
			tac_tazer_flanking = {
				0.1,
				0.25,
				0.25
			},
			tac_tazer_charge = {
				0.1,
				0.25,
				0.25
			},
			FBI_spoocs = {
				0,
				0.20,
				0.25
			},
			tac_bull_rush = {
				0,
				0.25,
				0.3
			}
		}
	elseif difficulty_index == 6 then
		self.besiege.assault.groups = {
			tac_swat_shotgun_rush = {
				0.2,
				1,
				1
			},
			tac_swat_shotgun_flank = {
				0.2,
				1,
				1
			},
			tac_swat_rifle = {
				0.1,
				0.5,
				0.75
			},
			tac_swat_rifle_flank = {
				0.1,
				0.5,
				0.75
			},
			tac_shield_wall_ranged = {
				0.1,
				0.3,
				0.4
			},
			tac_shield_wall_charge = {
				0.1,
				0.3,
				0.4
			},
			tac_shield_wall = {
				0.1,
				0.3,
				0.4
			},
			tac_tazer_flanking = {
				0.1,
				0.30,
				0.45
			},
			tac_tazer_charge = {
				0.1,
				0.30,
				0.45
			},
			FBI_spoocs = {
				0,
				0.30,
				0.50
			},
			tac_bull_rush = {
				0,
				0.35,
				0.45
			}
		}
	elseif difficulty_index == 7 then
		self.besiege.assault.groups = {
			tac_swat_shotgun_rush = {
				0.2,
				1,
				1
			},
			tac_swat_shotgun_flank = {
				0.2,
				1,
				1
			},
			tac_swat_rifle = {
				0.1,
				0.5,
				0.75
			},
			tac_swat_rifle_flank = {
				0.1,
				0.5,
				0.75
			},
			tac_shield_wall_ranged = {
				0.1,
				0.3,
				0.4
			},
			tac_shield_wall_charge = {
				0.1,
				0.3,
				0.4
			},
			tac_shield_wall = {
				0.1,
				0.3,
				0.4
			},
			tac_tazer_flanking = {
				0.1,
				0.30,
				0.45
			},
			tac_tazer_charge = {
				0.1,
				0.30,
				0.45
			},
			FBI_spoocs = {
				0,
				0.30,
				0.50
			},
			tac_bull_rush = {
				0,
				0.35,
				0.45
			}
		}
	elseif difficulty_index == 8 then
		self.besiege.assault.groups = {
			tac_swat_shotgun_rush = {
				0.2,
				1,
				1
			},
			tac_swat_shotgun_flank = {
				0.2,
				1,
				1
			},
			tac_swat_rifle = {
				0.1,
				0.5,
				0.75
			},
			tac_swat_rifle_flank = {
				0.1,
				0.5,
				0.75
			},
			tac_shield_wall_ranged = {
				0.1,
				0.3,
				0.4
			},
			tac_shield_wall_charge = {
				0.1,
				0.3,
				0.4
			},
			tac_shield_wall = {
				0.1,
				0.3,
				0.4
			},
			tac_tazer_flanking = {
				0.1,
				0.30,
				0.45
			},
			tac_tazer_charge = {
				0.1,
				0.30,
				0.45
			},
			FBI_spoocs = {
				0,
				0.30,
				0.50
			},
			tac_bull_rush = {
				0,
				0.35,
				0.45
			}
		}
	else
		self.besiege.assault.groups = {
			tac_swat_shotgun_rush = {
				0.2,
				1,
				1
			},
			tac_swat_shotgun_flank = {
				0.2,
				1,
				1
			},
			tac_swat_rifle = {
				0.1,
				0.5,
				0.75
			},
			tac_swat_rifle_flank = {
				0.1,
				0.5,
				0.75
			},
			tac_shield_wall_ranged = {
				0.1,
				0.3,
				0.4
			},
			tac_shield_wall_charge = {
				0.1,
				0.3,
				0.4
			},
			tac_shield_wall = {
				0.1,
				0.3,
				0.4
			},
			tac_tazer_flanking = {
				0.1,
				0.30,
				0.45
			},
			tac_tazer_charge = {
				0.1,
				0.30,
				0.45
			},
			FBI_spoocs = {
				0,
				0.30,
				0.50
			},
			tac_bull_rush = {
				0,
				0.35,
				0.45
			}
		}
	end
	self.besiege.assault.groups.single_spooc = {
		0,
		0,
		0
	}
	self.besiege.assault.groups.Phalanx = {
		0,
		0,
		0
	}
	self.besiege.reenforce.interval = {
		10,
		20,
		30
	}
	if difficulty_index <= 2 then
		self.besiege.reenforce.groups = {
			tac_swat_shotgun_rush = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_shotgun_flank = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle_flank = {
				0.1,
				0.1,
				0.1
			}
		}
	elseif difficulty_index == 3 then
		self.besiege.reenforce.groups = {
			tac_swat_shotgun_rush = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_shotgun_flank = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle_flank = {
				0.1,
				0.1,
				0.1
			}
		}
	elseif difficulty_index == 4 then
		self.besiege.reenforce.groups = {
			tac_swat_shotgun_rush = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_shotgun_flank = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle_flank = {
				0.1,
				0.1,
				0.1
			}
		}
	elseif difficulty_index == 5 then
		self.besiege.reenforce.groups = {
			tac_swat_shotgun_rush = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_shotgun_flank = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle_flank = {
				0.1,
				0.1,
				0.1
			}
		}
	else
		self.besiege.reenforce.groups = {
			tac_swat_shotgun_rush = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_shotgun_flank = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle_flank = {
				0.1,
				0.1,
				0.1
			}
		}
	end
	self.besiege.recon.interval = {
		5,
		5,
		5
	}
	self.besiege.recon.interval_variation = 40
	if difficulty_index < 6 then
		self.besiege.recon.force = {
			2,
			4,
			6
		}
	else
		self.besiege.recon.force = {
			3,
			4,
			6
		}
	end
	if difficulty_index <= 2 then
		self.besiege.recon.groups = {
			tac_swat_shotgun_rush = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_shotgun_flank = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle_flank = {
				0.1,
				0.1,
				0.1
			}
		}
	elseif difficulty_index == 3 then
		self.besiege.recon.groups = {
			tac_swat_shotgun_rush = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_shotgun_flank = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle_flank = {
				0.1,
				0.1,
				0.1
			}
		}
	elseif difficulty_index == 4 then
		self.besiege.recon.groups = {
			tac_swat_shotgun_rush = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_shotgun_flank = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle_flank = {
				0.1,
				0.1,
				0.1
			}
		}
	elseif difficulty_index == 5 then
		self.besiege.recon.groups = {
			tac_swat_shotgun_rush = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_shotgun_flank = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle_flank = {
				0.1,
				0.1,
				0.1
			}
		}
	else
		self.besiege.recon.groups = {
			tac_swat_shotgun_rush = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_shotgun_flank = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle = {
				0.1,
				0.1,
				0.1
			},
			tac_swat_rifle_flank = {
				0.1,
				0.1,
				0.1
			}
		}
	end
	self.besiege.recon.groups.single_spooc = {
		0,
		0,
		0
	}
	self.besiege.recon.groups.Phalanx = {
		0,
		0,
		0
	}
	self.besiege.cloaker.groups = {
		single_spooc = {
			1,
			1,
			1
		}
	}
	self.street = deep_clone(self.besiege)
	self.phalanx.minions.min_count = 4
	self.phalanx.minions.amount = 10
	self.phalanx.minions.distance = 100
	self.phalanx.vip.health_ratio_flee = 0.2
	self.phalanx.vip.damage_reduction = {
		start = 0.1,
		increase = 0.05,
		max = 0.5,
		increase_intervall = 5
	}
	self.phalanx.check_spawn_intervall = 120
	self.phalanx.chance_increase_intervall = 120
	if difficulty_index == 4 then
		self.phalanx.spawn_chance = {
			start = 0,
			increase = 0.05,
			decrease = 0.7,
			max = 1,
			respawn_delay = 300000
		}
	elseif difficulty_index == 5 then
		self.phalanx.spawn_chance = {
			start = 0.01,
			increase = 0.09,
			decrease = 0.7,
			max = 1,
			respawn_delay = 300000
		}
	elseif difficulty_index == 6 then
		self.phalanx.spawn_chance = {
			start = 0.05,
			increase = 0.09,
			decrease = 1,
			max = 1,
			respawn_delay = 300000
		}
	elseif difficulty_index == 7 then
		self.phalanx.spawn_chance = {
			start = 0.05,
			increase = 0.09,
			decrease = 1,
			max = 1,
			respawn_delay = 300000
		}
	elseif difficulty_index == 8 then
		self.phalanx.spawn_chance = {
			start = 0.05,
			increase = 0.09,
			decrease = 1,
			max = 1,
			respawn_delay = 300000
		}
	else
		self.phalanx.spawn_chance = {
			start = 0,
			increase = 0,
			decrease = 0,
			max = 0,
			respawn_delay = 120
		}
	end
	self.safehouse = deep_clone(self.besiege)
end)
