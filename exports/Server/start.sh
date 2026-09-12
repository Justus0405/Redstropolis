#!/bin/sh
#
# Author: Justus0405
# Date: 19.02.2026
# License: MIT

MEMORY="6G"

if [ ! -f "eula.txt" ]; then
    echo "eula=true" >eula.txt
fi

java -Xms${MEMORY} -Xmx${MEMORY} -Dfml.readTimeout=180 -Dfml.queryResult=confirm @java9args.txt -jar lwjgl3ify-forgePatches.jar nogui
