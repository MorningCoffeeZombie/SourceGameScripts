function DoctorBagBase:server_information()
	return not m_playerdrop.data.drop_doctor and self._server_information or nil
	end