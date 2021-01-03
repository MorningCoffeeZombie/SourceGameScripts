NetworkPeer._verify_deployable_old=NetworkPeer.verify_deployable
function NetworkPeer:verify_deployable(id)
	if self.deployable_data then
		if id==self.deployable_data.deployable then
			if self._depolyable_count and self._depolyable_count>=self.deployable_data.amount then
				return false
				end
		else
			return false
			end
		end
	return self:_verify_deployable_old(id)
	end