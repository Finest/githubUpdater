#!/usr/bin/env bash

rootDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
git=$1
file=$(basename ${git} .git)
name=$2
old_revision=0
new_revision=0

cd ${rootDir}

    if [ -d "${rootDir}/${file}" ];then
        echo "--------------------------------------"
        echo "- ${name} Files vorhanden -"
        echo "--------------------------------------"
	else
		cd ${rootDir}
		git clone ${git}
    	echo "--------------------------------------"
    	echo "- ${name} clone GithubRepo -"
    	echo "--------------------------------------"
	fi

new_revision=$(git ls-remote -h  ${git} | grep "master" | cut -f1)

cd ${rootDir}

if [ -f "revision_${file}.txt" ];then
	old_revision=$(cat revision_${file}.txt)
else
	  echo "no revision_${file}.txt exist - Default Value:${old_revision}"
fi

if [ ${old_revision} != ${new_revision} ]; then
    echo "old Revision: ${old_revision} | new Revision: ${new_revision}"
	
cd ${rootDir}/${file}
git pull
    if [ -d "${rootDir}/mod.7d2d.${name}" ];then
        rm -rf ${rootDir}/mod.7d2d.${name}
        echo "--------------------------------------"
        echo "-        loesche alte datein         -"
    fi
mkdir ${rootDir}/mod.7d2d.${name}
cp -r ${rootDir}/${file}/* ${rootDir}/mod.7d2d.${name}

echo ${new_revision} > ${rootDir}/revision_${file}.txt
        echo "--------------------------------------"
        echo "-        revision_${file}.txt updated         -"
        echo "--------------------------------------"
        echo "-         kopiere Dateien            -"
        if [ ! -d /data/steamUpdater/queue/mod.7d2d.${name} ]; then
            mv ${rootDir}/mod.7d2d.${name} /data/steamUpdater/queue
        fi


else
    echo "--------------------------------------"
    echo "- ${name} ist uptodate -"
    echo "--------------------------------------"

fi
