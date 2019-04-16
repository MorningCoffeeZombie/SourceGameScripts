@ECHO OFF
TITLE "Deploying Files From SourceGameScripts..."
ECHO "Copying files from local repo to proper locations on your PC..."


:: GLOBAL VARS
::::::::::::::
:: Installation Status (Unknown, Installed, Absent)
SET CSGO_STATUS=Unknown
SET CSS_STATUS=Unknown
SET DOD_STATUS=Unknown
SET GMOD_STATUS=Unknown
SET PORTAL_STATUS=Unknown
SET L4D_STATUS=Unknown
SET TF2_STATUS=Unknown
SET HL2_STATUS=Unknown
SET HL_STATUS=Unknown

:: Full Game Names By Folder Naming Convention in C:\Program Files...
SET AR_SOURCES[0]="Counter-Strike Global Offensive"
SET AR_SOURCES[1]="Counter-Strike Source"
SET AR_SOURCES[2]="Day of Defeat Source"
SET AR_SOURCES[3]="GarrysMod"
SET AR_SOURCES[4]="Portal"
SET AR_SOURCES[5]="left 4 dead"
SET AR_SOURCES[6]="Team Fortress 2"
SET AR_SOURCES[7]="Half-Life 2"
SET AR_SOURCES[8]="Half-Life"

:: Loop Counter
SET "x=0"



:: Deploy Files
:::::::::::::::
IF EXIST "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\" (
	SET GMOD_STATUS=Installed
	:: Source General
	COPY ../source_debugging.cfg "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\cfg\"
	COPY ../source_enable_user_sprays.cfg "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\cfg\"
	COPY ../source_fake_lag.cfg "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\cfg\"
	COPY ../source_fake_lag_removal.cfg "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\cfg\"
	COPY ../source_network_boost.cfg "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\cfg\"
	COPY ../source_optimize_low_end_pc.cfg "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\cfg\"
	COPY ../source_spray_compass.jpg "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\"
	:: Game Custom
	COPY ../autoexec.cfg "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\cfg\"
	COPY ../gmod_general.cfg "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\cfg\"
	COPY ../gmod_mcore_off.cfg "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\cfg\"
	COPY ../gmod_mcore_on.cfg "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\cfg\"
) ELSE ( SET GMOD_STATUS=Absent )


IF EXIST "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\" (
	SET CSGO_STATUS=Installed
	:: Source General
	COPY ../source_debugging.cfg "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\csgo\cfg\"
	COPY ../source_enable_user_sprays.cfg "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\csgo\cfg\"
	COPY ../source_fake_lag.cfg "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\csgo\cfg\"
	COPY ../source_fake_lag_removal.cfg "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\csgo\cfg\"
	COPY ../source_network_boost.cfg "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\csgo\cfg\"
	COPY ../source_optimize_low_end_pc.cfg "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\csgo\cfg\"
	COPY ../source_spray_compass.jpg "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\"
	:: Game Custom
	COPY ../csgo_general.cfg "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Global Offensive\csgo\cfg\"
) ELSE ( SET CSGO_STATUS=Absent )


IF EXIST "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Source\" (
	SET CSS_STATUS=Installed
	:: Source General
	COPY ../source_debugging.cfg "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Source\cstrike\cfg\"
	COPY ../source_enable_user_sprays.cfg "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Source\cstrike\cfg\"
	COPY ../source_fake_lag.cfg "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Source\cstrike\cfg\"
	COPY ../source_fake_lag_removal.cfg "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Source\cstrike\cfg\"
	COPY ../source_network_boost.cfg "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Source\cstrike\cfg\"
	COPY ../source_optimize_low_end_pc.cfg "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Source\cstrike\cfg\"
	COPY ../source_spray_compass.jpg "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Source\"
	:: Game Custom
	COPY ../css_general.cfg "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Source\cstrike\cfg\"
	COPY ../cstrike_english.txt "C:\Program Files (x86)\Steam\steamapps\common\Counter-Strike Source\cstrike\resource\"
) ELSE ( SET CSS_STATUS=Absent )


IF EXIST "C:\Program Files (x86)\Steam\steamapps\common\Day of Defeat Source\" (
	SET DOD_STATUS=Installed
	:: Source General
	COPY ../source_debugging.cfg "C:\Program Files (x86)\Steam\steamapps\common\Day of Defeat Source\dod\cfg\"
	COPY ../source_enable_user_sprays.cfg "C:\Program Files (x86)\Steam\steamapps\common\Day of Defeat Source\dod\cfg\"
	COPY ../source_fake_lag.cfg "C:\Program Files (x86)\Steam\steamapps\common\Day of Defeat Source\dod\cfg\"
	COPY ../source_fake_lag_removal.cfg "C:\Program Files (x86)\Steam\steamapps\common\Day of Defeat Source\dod\cfg\"
	COPY ../source_network_boost.cfg "C:\Program Files (x86)\Steam\steamapps\common\Day of Defeat Source\dod\cfg\"
	COPY ../source_optimize_low_end_pc.cfg "C:\Program Files (x86)\Steam\steamapps\common\Day of Defeat Source\dod\cfg\"
	COPY ../source_spray_compass.jpg "C:\Program Files (x86)\Steam\steamapps\common\Day of Defeat Source\"
	:: Game Custom
) ELSE ( SET DOD_STATUS=Absent )


IF EXIST "C:\Program Files (x86)\Steam\steamapps\common\Portal\" (
	SET PORTAL_STATUS=Installed
	:: Source General
	COPY ../source_debugging.cfg "C:\Program Files (x86)\Steam\steamapps\common\Portal\portal\cfg\"
	COPY ../source_enable_user_sprays.cfg "C:\Program Files (x86)\Steam\steamapps\common\Portal\portal\cfg\"
	COPY ../source_fake_lag.cfg "C:\Program Files (x86)\Steam\steamapps\common\Portal\portal\cfg\"
	COPY ../source_fake_lag_removal.cfg "C:\Program Files (x86)\Steam\steamapps\common\Portal\portal\cfg\"
	COPY ../source_network_boost.cfg "C:\Program Files (x86)\Steam\steamapps\common\Portal\portal\cfg\"
	COPY ../source_optimize_low_end_pc.cfg "C:\Program Files (x86)\Steam\steamapps\common\Portal\portal\cfg\"
	COPY ../source_spray_compass.jpg "C:\Program Files (x86)\Steam\steamapps\common\Portal\"
	:: Game Custom
) ELSE ( SET PORTAL_STATUS=Absent )


IF EXIST "C:\Program Files (x86)\Steam\steamapps\common\left 4 dead\" (
	SET L4D_STATUS=Installed
	:: Source General
	COPY ../source_debugging.cfg "C:\Program Files (x86)\Steam\steamapps\common\left 4 dead\left4dead\cfg\"
	COPY ../source_enable_user_sprays.cfg "C:\Program Files (x86)\Steam\steamapps\common\left 4 dead\left4dead\cfg\"
	COPY ../source_fake_lag.cfg "C:\Program Files (x86)\Steam\steamapps\common\left 4 dead\left4dead\cfg\"
	COPY ../source_fake_lag_removal.cfg "C:\Program Files (x86)\Steam\steamapps\common\left 4 dead\left4dead\cfg\"
	COPY ../source_network_boost.cfg "C:\Program Files (x86)\Steam\steamapps\common\left 4 dead\left4dead\cfg\"
	COPY ../source_optimize_low_end_pc.cfg "C:\Program Files (x86)\Steam\steamapps\common\left 4 dead\left4dead\cfg\"
	COPY ../source_spray_compass.jpg "C:\Program Files (x86)\Steam\steamapps\common\left 4 dead\"
	:: Game Custom
) ELSE ( SET L4D_STATUS=Absent )


IF EXIST "C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\" (
	SET TF2_STATUS=Installed
	:: Source General
	COPY ../source_debugging.cfg "C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\tf\cfg\"
	COPY ../source_enable_user_sprays.cfg "C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\tf\cfg\"
	COPY ../source_fake_lag.cfg "C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\tf\cfg\"
	COPY ../source_fake_lag_removal.cfg "C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\tf\cfg\"
	COPY ../source_network_boost.cfg "C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\tf\cfg\"
	COPY ../source_optimize_low_end_pc.cfg "C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\tf\cfg\"
	COPY ../source_spray_compass.jpg "C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\"
	:: Game Custom
	COPY ../tf2_general.cfg "C:\Program Files (x86)\Steam\steamapps\common\Team Fortress 2\tf\cfg\"
) ELSE ( SET TF2_STATUS=Absent )


IF EXIST "C:\Program Files (x86)\Steam\steamapps\common\Half-Life 2\" (
	SET HL2_STATUS=Installed
	:: Source General
	COPY ../source_debugging.cfg "C:\Program Files (x86)\Steam\steamapps\common\Half-Life 2\hl2\cfg\"
	COPY ../source_enable_user_sprays.cfg "C:\Program Files (x86)\Steam\steamapps\common\Half-Life 2\hl2\cfg\"
	COPY ../source_fake_lag.cfg "C:\Program Files (x86)\Steam\steamapps\common\Half-Life 2\hl2\cfg\"
	COPY ../source_fake_lag_removal.cfg "C:\Program Files (x86)\Steam\steamapps\common\Half-Life 2\hl2\cfg\"
	COPY ../source_network_boost.cfg "C:\Program Files (x86)\Steam\steamapps\common\Half-Life 2\hl2\cfg\"
	COPY ../source_optimize_low_end_pc.cfg "C:\Program Files (x86)\Steam\steamapps\common\Half-Life 2\hl2\cfg\"
	COPY ../source_spray_compass.jpg "C:\Program Files (x86)\Steam\steamapps\common\Half-Life 2\"
	:: Game Custom
	COPY ../hl2_power_script.cfg "C:\Program Files (x86)\Steam\steamapps\common\Half-Life 2\hl2\cfg\"
	COPY ../hl2_commands.lst "C:\Program Files (x86)\Steam\steamapps\common\Half-Life 2\hl2\cfg\"
) ELSE ( SET HL2_STATUS=Absent )

IF EXIST "C:\Program Files (x86)\Steam\steamapps\common\Half-Life\" (
	SET HL_STATUS=Installed
	:: Half-Life 1 General
	COPY ../autoexec.cfg "C:\Program Files (x86)\Steam\steamapps\common\Half-Life\valve\"
	COPY ../cs_general.cfg "C:\Program Files (x86)\Steam\steamapps\common\Half-Life\valve\"
	IF EXIST "C:\Program Files (x86)\Steam\steamapps\common\Half-Life\cstrike\" (
		:: CS 1.6 General
		COPY ../autoexec.cfg "C:\Program Files (x86)\Steam\steamapps\common\Half-Life\cstrike\"
		COPY ../cs_general.cfg "C:\Program Files (x86)\Steam\steamapps\common\Half-Life\cstrike\"
	)
	IF EXIST "C:\Program Files (x86)\Steam\steamapps\common\Half-Life\czeror\" (
		:: CS CZ General
		COPY ../autoexec.cfg "C:\Program Files (x86)\Steam\steamapps\common\Half-Life\czeror\"
		COPY ../cs_general.cfg "C:\Program Files (x86)\Steam\steamapps\common\Half-Life\czeror\"
	)
) ELSE ( SET HL_STATUS=Absent )





:: REPORT INSTALLATIONS
:::::::::::::::::::::::
ECHO REPORT OF INSTALLATION:
ECHO CSGO:	%CSGO_STATUS%
ECHO CSS:	%CSS_STATUS%
ECHO DoD:	%DOD_STATUS%
ECHO GMod:	%GMOD_STATUS%
ECHO Portal:	%PORTAL_STATUS%
ECHO L4D:	%L4D_STATUS%
ECHO TF2:	%TF2_STATUS%
ECHO HL2:	%HL2_STATUS%










PAUSE
EXIT





:: UNUSED RESOURCES
:::::::::::::::::::

:: The below script would work if there weren't 2 folders specific to game name. Ie: \Counter-Strike Source\cstrike\
:: Loop Counter
SET "x=0"
:: ^ In variables section. v In script
:SymLoop
IF DEFINED AR_SOURCES[%x%] (
	IF EXIST "C:\Program Files (x86)\Steam\steamapps\common\%%AR_SOURCES[%x%]%%\" (
		COPY ../source_debugging.cfg "C:\Program Files (x86)\Steam\steamapps\common\%%AR_SOURCES[%x%]%%\garrysmod\cfg\"
		COPY ../source_enable_user_sprays.cfg "C:\Program Files (x86)\Steam\steamapps\common\%%AR_SOURCES[%x%]%%\garrysmod\cfg\"
		COPY ../source_fake_lag.cfg "C:\Program Files (x86)\Steam\steamapps\common\%%AR_SOURCES[%x%]%%\garrysmod\cfg\"
		COPY ../source_fake_lag_removal.cfg "C:\Program Files (x86)\Steam\steamapps\common\%%AR_SOURCES[%x%]%%\garrysmod\cfg\"
		COPY ../source_network_boost.cfg "C:\Program Files (x86)\Steam\steamapps\common\%%AR_SOURCES[%x%]%%\garrysmod\cfg\"
		COPY ../source_optimize_low_end_pc.cfg "C:\Program Files (x86)\Steam\steamapps\common\%%AR_SOURCES[%x%]%%\garrysmod\cfg\"
		COPY ../source_spray_compass.jpg "C:\Program Files (x86)\Steam\steamapps\common\%%AR_SOURCES[%x%]%%\"
	)
    SET /a "x+=1"
    GOTO :SymLoop
)
:: Reset Loop
SET "x=0"





:: COPY/PASTE TEMPLATE (safety word = banana)
::::::::::::::::::::::
IF EXIST "C:\Program Files (x86)\Steam\steamapps\common\BANANA\" (
	SET BANANA=Installed
	:: Source General
	COPY ../source_debugging.cfg "C:\Program Files (x86)\Steam\steamapps\common\BANANA\BANANA\cfg\"
	COPY ../source_enable_user_sprays.cfg "C:\Program Files (x86)\Steam\steamapps\common\BANANA\BANANA\cfg\"
	COPY ../source_fake_lag.cfg "C:\Program Files (x86)\Steam\steamapps\common\BANANA\BANANA\cfg\"
	COPY ../source_fake_lag_removal.cfg "C:\Program Files (x86)\Steam\steamapps\common\BANANA\BANANA\cfg\"
	COPY ../source_network_boost.cfg "C:\Program Files (x86)\Steam\steamapps\common\BANANA\BANANA\cfg\"
	COPY ../source_optimize_low_end_pc.cfg "C:\Program Files (x86)\Steam\steamapps\common\BANANA\BANANA\cfg\"
	COPY ../source_spray_compass.jpg "C:\Program Files (x86)\Steam\steamapps\common\BANANA\"
	:: Game Custom
	COPY ../BANANA.cfg "C:\Program Files (x86)\Steam\steamapps\common\BANANA\BANANA\cfg\"
) ELSE ( SET BANANA=Absent )








