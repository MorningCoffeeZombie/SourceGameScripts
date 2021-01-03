-- Distance units are measured by in-game meters

local hostage_follow_max = 3			-- Maximum allowed hostage followers
local hostage_follow_distance_max = 200		-- Distance hostage will stop following
--local hostage_follow_distance_threshold = 1.25 	-- Distance away from player hostage will attempt to keep
local hostage_follow_distance_threshold = 2 	-- Distance away from player hostage will attempt to keep
--local hostage_follow_speed_multiplier = 2	-- Speed hostage will travel while cable tied
local hostage_follow_speed_multiplier = 1.5	-- Speed hostage will travel while cable tied

if string.lower(RequiredScript) == "lib/units/civilians/civilianbrain" then

	local set_hostage_move_original = CivilianBrain.on_hostage_move_interaction

	function CivilianBrain:on_hostage_move_interaction(interacting_unit, command, ...)
		if command == "move" then
		
			local following_hostages = managers.groupai:state():get_following_hostages(interacting_unit)
			
			if following_hostages and table.size(following_hostages) >= hostage_follow_max then
				return
			end
			
			if not self._unit:anim_data().drop and self._unit:anim_data().tied then
				return
			end
			
			local stand_action_desc = {
				type = "act",
				variant = "stand_tied",
				body_part = 1,
				clamp_to_graph = true
			}
			local action = self._unit:movement():action_request(stand_action_desc)
			
			if not action then
				return
			end
			
			self._unit:movement():set_stance("cbt", nil, true)
			
			local follow_objective = {
				type = "follow",
				follow_unit = interacting_unit,
				nav_seg = interacting_unit:movement():nav_tracker():nav_segment(),
				interrupt_dis = 0,
				interrupt_health = 0,
				lose_track_dis = 100 * hostage_follow_distance_max,
				distance = 100 * hostage_follow_distance_threshold,
				stance = "cbt",
				fail_clbk = callback(self, self, "on_hostage_follow_objective_failed")
			}
			
			self:set_objective(follow_objective)
			self._unit:interaction():set_tweak_data("hostage_stay")
			self._unit:interaction():set_active(true, true)
			interacting_unit:sound():say("f38_any", false, true)
			self._following_hostage_contour_id = self._unit:contour():add("friendly", true)
			managers.groupai:state():on_hostage_follow(interacting_unit, self._unit, true)
		end
		set_hostage_move_original(self, interacting_unit, command, ...)
	end
	
end

if string.lower(RequiredScript) == "lib/tweak_data/playertweakdata" then

	local set_playertweakdata_original = PlayerTweakData.init
	
	function PlayerTweakData:init(...)
		set_playertweakdata_original(self, ...)
		
		self.max_nr_following_hostages = hostage_follow_max
	end
	
end

if string.lower(RequiredScript) == "lib/tweak_data/charactertweakdata" then

	local set_charactertweakdata_original = CharacterTweakData._presets
	 
	function CharacterTweakData:_presets(tweak_data, ...)
		local presets = set_charactertweakdata_original(self, tweak_data, ...)
	   
		presets.move_speed.civ_fast.stand.walk.cbt = {
			fwd = 210 * hostage_follow_speed_multiplier,
			strafe = 175 * hostage_follow_speed_multiplier,
			bwd = 160 * hostage_follow_speed_multiplier
		}
			
		return presets
	end
	
end

Hooks:Add("NetworkManagerOnPeerAdded", "NetworkManagerOnPeerAdded_HET", function(peer, peer_id)
	if Network:is_server() then
		DelayedCalls:Add("DelayedWarnModHET" .. tostring(peer_id), 2, function()
		local message = "Host is running 'Hostage Escort Tweaks': adds ability to move 3 hostages at once and other various hostage following improvements."
		local peer2 = managers.network:session() and managers.network:session():peer(peer_id)
	if peer2 then
		peer2:send("send_chat_message", ChatManager.GAME, message)
	end
	end)
	end
	end)
