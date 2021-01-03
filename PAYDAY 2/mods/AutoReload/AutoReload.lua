orig = PlayerStandard._check_action_primary_attack
function PlayerStandard:_check_action_primary_attack(t, input)
	local new_action = orig(self, t, input)
    if not new_action then
		local action_forbidden = self:_is_reloading() or self:_changing_weapon() or self:_is_meleeing() or self._use_item_expire_t or self:_interacting() or self:_is_throwing_projectile() or self:_is_deploying_bipod()
		if not action_forbidden then
			self._queue_reload_interupt = nil
			local start_shooting = false
			self._ext_inventory:equip_selected_primary(false)
			if self._equipped_unit then
				local weap_base = self._equipped_unit:base()
		        if weap_base.clip_empty and weap_base:clip_empty() and 
					(weap_base:get_ammo_total() > 0) then
                    new_action = true
                    self:_start_action_reload_enter(t)
                end
			end
		elseif self:_is_reloading() and self._equipped_unit:base():reload_interuptable() and input.btn_primary_attack_press then
			self._queue_reload_interupt = true
		end
	end
	return new_action
end