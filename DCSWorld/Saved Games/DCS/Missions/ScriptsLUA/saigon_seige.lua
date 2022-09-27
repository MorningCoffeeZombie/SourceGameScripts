--[[https://flightcontrol-master.github.io/MOOSE_DOCS/Documentation/Core.Spawn.html

Make 3 groups on the map named Enemy Patrol for easy/med/hard and set to late activation
Currently the script will spawn groups approx. where they're placed on the map. Use the InitRandomizeZones option (commented) to spawn them in set zones.
If you only want to spawn 1 group type; comment out the "InitRandomizeTemplate" function

--]]


--[[
ZoneTable = {
	ZONE:New( "Zone-1" ),
	ZONE:New( "Zone-2" )
	}
--]]

GroupTemplateTable = {
	'VC Assault-1',
	'VC Assault-2',
	'VC Assault-3',
	'VC Assault-4',
	'VC Assault-5',
	'VC Assault-6'
	}


Spawn_Troops = SPAWN:New( "VC Assault-1" )
	:InitLimit( 10, 18 )
	--:InitRandomizeZones( ZoneTable )
	:InitRandomizeTemplate( GroupTemplateTable )
	:InitRandomizeRoute( 0, 1, 500 )
	:SpawnScheduled( 120, .75 )

Spawn_Troops = SPAWN:New( "VC Assault-2" )
	:InitLimit( 10, 18 )
	--:InitRandomizeZones( ZoneTable )
	:InitRandomizeTemplate( GroupTemplateTable )
	:InitRandomizeRoute( 0, 1, 500 )
	:SpawnScheduled( 120, .75 )

Spawn_Troops = SPAWN:New( "VC Assault-3" )
	:InitLimit( 10, 18 )
	--:InitRandomizeZones( ZoneTable )
	:InitRandomizeTemplate( GroupTemplateTable )
	:InitRandomizeRoute( 0, 1, 500 )
	:SpawnScheduled( 120, .75 )

Spawn_Troops = SPAWN:New( "VC Assault-4" )
	:InitLimit( 10, 18 )
	--:InitRandomizeZones( ZoneTable )
	:InitRandomizeTemplate( GroupTemplateTable )
	:InitRandomizeRoute( 0, 1, 500 )
	:SpawnScheduled( 120, .75 )

Spawn_Troops = SPAWN:New( "VC Assault-5" )
	:InitLimit( 10, 18 )
	--:InitRandomizeZones( ZoneTable )
	:InitRandomizeTemplate( GroupTemplateTable )
	:InitRandomizeRoute( 0, 1, 500 )
	:SpawnScheduled( 120, .75 )

Spawn_Troops = SPAWN:New( "VC Assault-6" )
	:InitLimit( 10, 18 )
	--:InitRandomizeZones( ZoneTable )
	:InitRandomizeTemplate( GroupTemplateTable )
	:InitRandomizeRoute( 0, 1, 500 )
	:SpawnScheduled( 120, .75 )










