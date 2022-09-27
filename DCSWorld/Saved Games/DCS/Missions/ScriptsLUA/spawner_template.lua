--[[https://flightcontrol-master.github.io/MOOSE_DOCS/Documentation/Core.Spawn.html

Make 3 groups on the map named Enemy Patrol for easy/med/hard and set to late activation
Currently the script will spawn groups approx. where they're placed on the map. Use the InitRandomizeZones option (commented) to spawn them in set zones.
If you only want to spawn 1 group type; comment out the "InitRandomizeTemplate" function
If you make changes to a script it must be 'reopened' in the Triggers menu in game: copying/replacing the .lua file into the .miz will not work.

--]]


ZoneTable = {
	ZONE:New( "Zone-1" ),
	ZONE:New( "Zone-2" )
	}

GroupTemplateTable = {
	'Enemy Patrol - Easy',
	'Enemy Patrol - Medium',
	'Enemy Patrol - Hard'
	}


Spawn_Troops = SPAWN:New( "Enemy Patrol - Easy" )
	:InitLimit( 24, 24 )
	--:InitRandomizeZones( ZoneTable )
	:InitRandomizeTemplate( GroupTemplateTable )
	:InitRandomizeRoute( 2, 1, 2000 )
	:SpawnScheduled( 90, .75 )









--[[

https://flightcontrol-master.github.io/MOOSE_DOCS_DEVELOP/Documentation/Core.Spawn.html
https://www.youtube.com/watch?v=mf6sOX2RTNQ

Spawn_Troops = SPAWN
	:New( "Enemy Patrol - Easy" )				--Spawns a group where the "Enemy Patrol - Easy" group is located. The units spawned will be from the 'GroupTemplateTable' if the InitRandomizeTemplate() funciton is called.
	:InitLimit( 24, 12 )						--24 units can be alive at the same time and 12 can be spawned maximum. Use 0 for infinite.
	:InitRandomizeTemplate( GroupTemplateTable )	--Script will spawn the group defined in the :New("") function only. Adding this:InitRandomizeTemplate() function it will randomize some of the other possible groups.
	:InitRandomizeRoute( 2, 1, 2000 )			
	:SpawnScheduled( 120, 1 )					--Spawn units every 120 seconds and with max radmonization (1). 0-1 defines how much variation there is in the first number.

--]]


