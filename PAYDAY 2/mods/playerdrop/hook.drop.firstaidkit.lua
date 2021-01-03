function FirstAidKitBase:server_information()
	return not m_playerdrop.data.drop_firstaid and self._server_information or nil
	end