#!/usr/bin/env bash


rootDir="/root/githubUpdater"
interval=300

##### MODLIST #####
starvation="https://github.com/StarvationTeam/StarvationServer.git"
warofthewalker="https://github.com/dwallorde/WotWServerFiles-BBM-.git"
warofthewalkerv5="https://github.com/dwallorde/WotWServerFilesV5-2BBM.git"
ravenhearst="https://github.com/Ravenhearst30/BF7DayNormal.git"
ravenhearst_21dayversion="https://github.com/Ravenhearst30/BF21DayNormal.git"
ravenhearst_streamer_version="https://github.com/Ravenhearst30/BF7DayStreamer.git"
ravenhearst_21daystreamer_version="https://github.com/Ravenhearst30/BF21DayStreamer.git"
valmod="https://github.com/ExperimentalSDXMods/ValmodDedicated.git"
servertools="https://api.github.com/repos/dmustanger/7dtd-ServerTools/releases/latest"
allocs_server_fixer="http://illy.bz/fi/7dtd/server_fixes.tar.gz"

cd ${rootDir}
#git checkout master
#git pull

./updater.sh ${starvation} StarvationServer
./updater.sh ${warofthewalker} WotWServerFiles-BBM-
./updater.sh ${warofthewalkerv5} WotWServerFilesV5_2BBM
./updater.sh ${ravenhearst} ravenhearstV3.X
./updater.sh ${ravenhearst_21dayversion} ravenhearstV3.X_21DayVersion
./updater.sh ${ravenhearst_streamer_version} ravenhearstV3.X_7DayStreamerVersion
./updater.sh ${ravenhearst_21daystreamer_version} ravenhearstV3.X_21DayStreamerVersion
./updater.sh ${valmod} ValmodDedicated
./updater_latest.sh ${servertools} ServerTools
./updater_link.sh ${allocs_server_fixer} Allocs_Server_fix_AdminMap

    echo "--------------------------------------"
    echo "-        Pause ${interval} Sekunden  -"
    echo "--------------------------------------"

sleep ${interval}
