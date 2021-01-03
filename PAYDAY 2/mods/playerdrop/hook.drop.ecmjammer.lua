function ECMJammerBase:server_information()
	return not m_playerdrop.data.drop_ecm and self._server_information or nil
	end