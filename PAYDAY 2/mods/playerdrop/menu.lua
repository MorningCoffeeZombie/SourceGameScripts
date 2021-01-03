local _path, _data_path=ModPath, SavePath.."playerdrop.txt"

m_playerdrop=m_playerdrop or {
	data={
		drop_ammo=true,
		drop_doctor=true,
		drop_firstaid=true,
		drop_bodybag=true,
		drop_ecm=true,
		drop_sentry=false
		}
	}

function m_drop_save()
	local file=io.open(_data_path, "w+")
	if file then
		file:write(json.encode(m_playerdrop.data))
		file:close()
		end
	end

function m_drop_load()
	local file=io.open(_data_path, "r")
	if file then
		m_playerdrop.data=json.decode(file:read("*all"))
		file:close()
		end
	end

Hooks:Add("LocalizationManagerPostInit", "Loc:playerdrop", function(loc)
	local lang, path=SystemInfo and SystemInfo:language(), "loc.en.txt"
	if lang==Idstring("french") then
		path="loc.fr.txt"
		end
	loc:load_localization_file(_path..path)
	end)

Hooks:Add("MenuManagerInitialize", "Menu:playerdrop", function(menu_manager)
	function MenuCallbackHandler:playerdrop_save()
		m_drop_save()
		end
	function MenuCallbackHandler:playerdrop_toggle(item)
		m_playerdrop.data[item:name()]=item:value()=="on"
		end
	m_drop_load()
	MenuHelper:LoadFromJsonFile(_path.."menu.txt", m_playerdrop, m_playerdrop.data)
	end)