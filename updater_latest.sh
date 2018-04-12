#!/usr/bin/env bash


rootDir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
apiurl=$1
name=$2
file=""
old_version=0
new_version=0

cd ${rootDir}
url=$(curl -s ${apiurl} | jq -r ".assets[] | select(.name | test(\".zip\")) | .browser_download_url")
file=$(basename ${url})
new_version=$(dirname ${url} | xargs basename)

if [ -f "version_${name}.txt" ];then
	old_version=$(cat version_${name}.txt)
    # echo "version_${name}.txt exists - OLD Version: ${old_version}"
else
	  echo "no version_${name}.txt exist - Default Value:${old_version}"
fi

if [ ${old_version} != ${new_version} ]; then
    echo "old Version: ${old_version} | new Version: ${new_version}"

    if [ -f "${name}" ];then
        rm -rf ${rootDir}/mod.7d2d.${name}
        echo "--------------------------------------"
        echo "-        loesche alte datein         -"
        echo "--------------------------------------"
    fi
    echo "--------------------------------------"
    echo "-       download neue Datein         -"
    echo "--------------------------------------"
    wget ${url}

    if [ -f "${file}" ];then
        echo "--------------------------------------"
        echo "-         kopiere Dateien            -"
        echo "--------------------------------------"
        if [ -d mod.7d2d.${name} ]; then
            rm -r mod.7d2d.${name}
        fi

        mkdir mod.7d2d.${name}
        cd mod.7d2d.${name}
        cp -av ${rootDir}/${file} ./
        echo ${new_version} > ${rootDir}/version_${name}.txt
        cp -av ${rootDir}/version_${name}.txt ${rootDir}/mod.7d2d.${name}/
		mv ${rootDir}/mod.7d2d.${name}/version_${name}.txt ${rootDir}/mod.7d2d.${name}/version.txt
        echo "--------------------------------------"
        echo "-        version_${name}.txt updated         -"
        echo "--------------------------------------"
        unzip ${file}
        rm -rf ${rootDir}/${file}
        rm -rf ${rootDir}/mod.7d2d.${name}/${file}

        if [ ! -d /data/steamUpdater/queue/mod.7d2d.${name} ]; then
            mv ${rootDir}/mod.7d2d.${name} /data/steamUpdater/queue
        fi

        echo "--------------------------------------"
        echo "-  ${name} ${new_version} Update wird eingespielt     -"
        echo "--------------------------------------"
    else
        echo "--------------------------------------"
        echo "-    Download hat nicht geklappt     -"
        echo "--------------------------------------"
        exit
    fi
else
    echo "--------------------------------------"
    echo "- ${name} ist uptodate -"
    echo "--------------------------------------"
fi
