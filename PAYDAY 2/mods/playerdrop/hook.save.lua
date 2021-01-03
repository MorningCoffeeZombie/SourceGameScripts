HostNetworkSession._spawn_dropin_player_old=HostNetworkSession._spawn_dropin_player
function HostNetworkSession:_spawn_dropin_player(peer)
	local peer_data=self._old_players[peer:user_id()]
	if peer_data and peer_data.deployable_data then
		peer.deployable_data=peer_data.deployable_data
		end
	self:_spawn_dropin_player_old(peer)
	end

function HostNetworkSession:_on_peer_removed(peer, peer_id, reason)
	local deployable_data=managers.player:get_synced_deployable_equipment(peer_id)
	self.super._on_peer_removed(self, peer, peer_id, reason)
	if Network:multiplayer() and Network:is_server() then
		local peer_data=self._old_players[peer:user_id()]
		if peer_data and peer_data.used_deployable and deployable_data and deployable_data.amount>0 then
			peer_data.used_deployable=false
			peer_data.deployable_data=deployable_data
			end
		end
	end