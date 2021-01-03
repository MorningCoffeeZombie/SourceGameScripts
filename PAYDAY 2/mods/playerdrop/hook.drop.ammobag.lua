function AmmoBagBase:server_information()
	return not m_playerdrop.data.drop_ammo and self._server_information or nil
	end