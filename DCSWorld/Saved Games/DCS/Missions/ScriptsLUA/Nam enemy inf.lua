
NATO_HQ = COMMANDCENTER:New( GROUP:FindByName( "HQ NATO" ), "USA" )
CCCP_HQ = COMMANDCENTER:New( GROUP:FindByName( "HQ Warsaw Pact" ), "Russian" )

--https://forum.dcs.world/topic/156931-spawning-the-same-gorup-of-units-endlessly/

Spawn_RU_Troops =
  { 'RU Attack Gori 1',
    'RU Attack Gori 2',
    'RU Attack Gori 3',
    'RU Attack Gori 4',
    'RU Attack Gori 5',
    'RU Attack Gori 6'
  }


Spawn_RU_Troops_South = SPAWN
  :New( "RU Attack Gori South" )
  :InitLimit( 24, 12 )
  :InitRandomizeTemplate( Spawn_RU_Troops )
  :InitRandomizeRoute( 2, 1, 2000 )
  --:InitArray( 349, 30, 20, 6 * 20 )
  :SpawnScheduled( 120, 1 )
  
Spawn_RU_Troops_South2 = SPAWN
  :New( "RU Attack Gori South2" )
  :InitLimit( 24, 12 )
  :InitRandomizeTemplate( Spawn_RU_Troops )
  :InitRandomizeRoute( 2, 1, 2000 )
  --:InitArray( 349, 30, 20, 6 * 20 )
  :SpawnScheduled( 120, 1 )

Spawn_RU_Troops_Middle = SPAWN
  :New( "RU Attack Gori Middle" )
  :InitLimit( 24, 12 )
  :InitRandomizeTemplate( Spawn_RU_Troops )
  :InitRandomizeRoute( 2, 1, 2000 )
  --:InitArray( 260, 50, 20, 6 * 20 )
  :SpawnScheduled( 120, 1 )

Spawn_RU_Troops_Middle2 = SPAWN
  :New( "RU Attack Gori Middle2" )
  :InitLimit( 24, 12 )
  :InitRandomizeTemplate( Spawn_RU_Troops )
  :InitRandomizeRoute( 2, 1, 2000 )
  --:InitArray( 260, 50, 20, 6 * 20 )
  :SpawnScheduled( 120, 1 )

Spawn_RU_Troops_Middle3 = SPAWN
  :New( "RU Attack Gori Middle3" )
  :InitLimit( 24, 12 )
  :InitRandomizeTemplate( Spawn_RU_Troops )
  :InitRandomizeRoute( 2, 1, 2000 )
  --:InitArray( 260, 50, 20, 6 * 20 )
  :SpawnScheduled( 120, 1 )

Spawn_RU_Troops_Middle4 = SPAWN
  :New( "RU Attack Gori Middle4" )
  :InitLimit( 24, 12 )
  :InitRandomizeTemplate( Spawn_RU_Troops )
  :InitRandomizeRoute( 2, 1, 2000 )
  --:InitArray( 260, 50, 20, 6 * 20 )
  :SpawnScheduled( 120, 1 )

Spawn_RU_Troops_North = SPAWN
  :New( "RU Attack Gori North" )
  :InitLimit( 24, 12 )
  :InitRandomizeTemplate( Spawn_RU_Troops )
  :InitRandomizeRoute( 2, 1, 2000 )
  --:InitArray( 238, 50, 20, 6 * 20 )
  :SpawnScheduled( 120, 1 )

Spawn_RU_Troops_North2 = SPAWN
  :New( "RU Attack Gori North2" )
  :InitLimit( 24, 12 )
  :InitRandomizeTemplate( Spawn_RU_Troops )
  :InitRandomizeRoute( 2, 1, 2000 )
  --:InitArray( 238, 50, 20, 6 * 20 )
  :SpawnScheduled( 120, 1 )



-- https://flightcontrol-master.github.io/MOOSE_DOCS_DEVELOP/Documentation/Core.Spawn.html
-- https://www.youtube.com/watch?v=mf6sOX2RTNQ

--Spawn_RU_Troops_South = SPAWN
--  :New( "RU Attack Gori South" )				-- Spawns group with name "RU Attack Gori South"
--  :InitLimit( 24, 12 )						-- 24 units can be alive at the same time and 12 can be spawned maximum. Use 0 for infinite.
--  :InitRandomizeTemplate( Spawn_RU_Troops )	-- Script will spawn the group defined in the :New("") function only. Adding this:InitRandomizeTemplate() function it will randomize some of the other possible groups.
--  :InitRandomizeRoute( 2, 1, 2000 )			-- 
--  :SpawnScheduled( 120, 1 )					-- Spawn units every 120 seconds and with max radmonization (1). 0-1 defines how much variation there is in the first number.



