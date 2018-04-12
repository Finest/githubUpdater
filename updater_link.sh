#!/bin/bash

rootDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
url=http://illy.bz/fi/7dtd/server_fixes.tar.gz
name=Allocs_Server_fix_AdminMap
Local=0
Remote=$(curl -sI ${url} | awk '/Content-Length/ {sub("\r",""); print $2}')
file=$(basename ${url})

cd ${rootDir}

    if [ ! -f "${file}" ];then
        wget ${url}
	Local=$(wc -c < ${file})
    		if [ -d "mod.7d2d.${name}" ];then
        		rm -rf ${rootDir}/mod.7d2d.${name}
        		echo "--------------------------------------"
        		echo "-        loesche alte datein         -"
        		echo "--------------------------------------"
   		 fi
	mkdir mod.7d2d.${name}
	cp -av ${rootDir}/${file} ${rootDir}/mod.7d2d.${name}/
	cd ${rootDir}/mod.7d2d.${name}
	tar -xzf ${file}
	rm -rf ${rootDir}/mod.7d2d.${name}/${file}
	if [ ! -d /data/steamUpdater/queue/${name} ]; then
        	mv ${rootDir}/mod.7d2d.${name} /data/steamUpdater/queue
        fi
        echo "--------------------------------------"
        echo "-         kopiere Dateien            -"
        echo "--------------------------------------"
    	echo "-        Pause ${interval} Sekunden  -"
	exit
    fi

Local=$(wc -c < ${file})
if [ $Local != $Remote ]; then
    rm -rf ${rootDir}/${file}
    echo "--------------------------------------"
    echo "-       neue Versionvorhanden        -"
    echo "--------------------------------------"

        wget ${url}

    		if [ -d "mod.7d2d.${name}" ];then
        		rm -rf ${rootDir}/mod.7d2d.${name}
        		echo "--------------------------------------"
        		echo "-        loesche alte datein         -"
        		echo "--------------------------------------"
   		 fi
	mkdir mod.7d2d.${name}
	cp -av ${rootDir}/${file} ${rootDir}/mod.7d2d.${name}/
	cd ${rootDir}/mod.7d2d.${name}
	tar -xzf  ${file}
	rm -rf ${rootDir}/mod.7d2d.${name}/${file}
        echo "--------------------------------------"
        echo "-         kopiere Dateien            -"
        echo "--------------------------------------"
        if [ ! -d /data/steamUpdater/queue/${name} ]; then
            mv ${rootDir}/mod.7d2d.${name} /data/steamUpdater/queue
        fi

else

    echo "--------------------------------------"
    echo "- ${name} ist uptodate -"
    echo "--------------------------------------"

fi
