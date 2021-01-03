TeamAIDamage.max_downs = 1

function TeamAIDamage:down_time()
	if self._deaths == nil then self._deaths = 0 end
	self._deaths = self._deaths + 1
	if self._deaths > TeamAIDamage.max_downs then
		return 0.1
	else
		return self._char_dmg_tweak.DOWNED_TIME
	end
end
