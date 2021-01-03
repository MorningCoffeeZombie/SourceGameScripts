function SentryGunBase:server_information()
	return not m_playerdrop.data.drop_sentry and self._server_information or nil
	end