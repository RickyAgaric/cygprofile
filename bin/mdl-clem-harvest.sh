#!/bin/bash
CWD=$(cd "$(dirname "")"; pwd)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Harvest Server build dependencies

function clemharv () {
VER=16.0.1.0.68                     # Modeler Server build version to harvest from
WINDRV=W:                           # Windows drive letter to be connected
CYGDRV=`cygpath $WINDRV`
SRCBASE="/c/Clearcase/Modeler_Dev1"    		# ClearCase view path to copy files to
TGTPATH="$SRCBASE/clem/Server/components_harvest"  
SMBPATH='\\svs1bo01.svl.ibm.com\Modeler\builds\outputs\MODSERVER_PREPARE\'"$VER"'\internal'

[[ ${BASH_VERSION:0:1} != 4 ]] && echo "You need BASH 4.0+ to run this script" && exit 1
echo "Copy from $SMBPATH to "
read -p "$TGTPATH? [y]/n:" GO
[[ ${GO,,} == n ]] && exit 2

cmd \/c 'net use '"$WINDRV $SMBPATH"
if [[ $? == 0 ]]; then
	echo "start"
    cd $CYGDRV >/dev/null
    find -maxdepth 2 -type d \( -name "include" -o -name "win64" \) -exec rsync -RWrmhv --exclude '*.dll' --exclude '*.pdb' {} "$TGTPATH" \;
    cd - >/dev/null
    cmd \/c 'net use '"$WINDRV"' /delete'
    echo -e \\a
fi
}

clemharv
