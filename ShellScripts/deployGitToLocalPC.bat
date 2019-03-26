@ECHO OFF
TITLE "Deploying Files From SourceGameScripts..."
ECHO "Copying files from local repo to proper locations on your PC..."



:: SOURCE GENERAL
:::::::::::::::::
COPY ../source_debugging.cfg "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\cfg\"
COPY ../source_enable_user_sprays.cfg "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\cfg\"
COPY ../source_fake_lag.cfg "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\cfg\"
COPY ../source_fake_lag_removal.cfg "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\cfg\"
COPY ../source_network_boost.cfg "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\cfg\"
COPY ../source_optimize_low_end_pc.cfg "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\cfg\"
COPY ../source_spray_compass.jpg "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\"




:: GMOD
:::::::
COPY ../autoexec.cfg "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\cfg\"
COPY ../gmod_general.cfg "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\cfg\"
COPY ../gmod_mcore_off.cfg "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\cfg\"
COPY ../gmod_mcore_on.cfg "C:\Program Files (x86)\Steam\steamapps\common\GarrysMod\garrysmod\cfg\"









::PAUSE
EXIT
