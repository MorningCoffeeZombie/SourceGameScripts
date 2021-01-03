function BodyBagsBagBase:server_information()
	return not m_playerdrop.data.drop_bodybag and self._server_information or nil
	end