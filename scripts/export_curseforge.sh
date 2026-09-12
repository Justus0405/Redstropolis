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
    rm "../build/Redstropolis_Curseforge"*
    mkdir -p "../build/tmp/overrides"
}

packageToCurseforge() {
    cd "../build/tmp" || exit 1

    # Export Profile
    cp -r "../../exports/Curseforge/manifest.json" "./"
    sed -i "s|PLACEHOLDER|${modpackVersion}|g" "./manifest.json"

    # Assets
    cp -r "../../options.txt" "./overrides/"
    cp -r "../../config" "./overrides/"
    cp -r "../../downloads/config" "./overrides/"
    cp -r "../../downloads/mods" "./overrides/"
    cp -r "../../downloads/resourcepacks" "./overrides/"
    cp -r "../../extras/OpenSecurity" "./overrides/mods/"

    zip -r "../Redstropolis_Curseforge_${modpackVersion}.zip" "./"
}

### PROGRAM START ###

checkEnvironment

createEnvironment

packageToCurseforge

logMessage "done" "Exported to build/Redstropolis_Curseforge_${modpackVersion}.zip"
exit 0
