#!/usr/bin/env bash
#
# Author: Justus0405
# Date: 01.01.2026
# License: MIT

export scriptVersion="1.0"

### LIBRARIES ###
source "./libs/libBase.sh"

### FUNCTIONS ###
checkEnvironment() {
    command -v zip >/dev/null 2>&1 || logMessage "error" "zip command not found."

    ls ../downloads/mods >/dev/null || logMessage "error" "No base layer build."

    modpackVersion=$(jq -r '.version' "../version.json")
}

createEnvironment() {
    rm -rf "../build/tmp"
    rm "../build/Redstropolis_Server"*
    mkdir -p "../build/tmp"
}

packageToServerJava17() {
    cd "../build/tmp" || exit 1

    # Export Profile
    cp -r "../../exports/Server/"* "./"

    # Assets
    cp -r "../../config" "./"
    cp -r "../../downloads/config" "./"
    cp -r "../../downloads/mods" "./"
    cp -r "../../extras/OpenSecurity" "./mods/"
    cp -r ../../downloads/lwjgl3/lwjgl3ify-*.jar "./mods"

    # Custom additions
    rm "./mods/custommainmenu"*

    zip -r "../Redstropolis_Server_${modpackVersion}_Java_17-25.zip" "./"
}

### PROGRAM START ###

checkEnvironment

createEnvironment

packageToServerJava17

logMessage "done" "Exported to build/Redstropolis_Server_${modpackVersion}_Java_17-25.zip"
exit 0
