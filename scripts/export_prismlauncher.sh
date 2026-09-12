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
    rm "../build/Redstropolis_Prismlauncher"*
    mkdir -p "../build/tmp/minecraft"
}

packageToPrismlauncherJava8() {
    cd "../build/tmp" || exit 1

    # Export Profile
    cp -r "../../exports/Prismlauncher/instance.cfg" "./"
    sed -i "s|PLACEHOLDER|${modpackVersion}|g" "./instance.cfg"
    cp -r "../../exports/Prismlauncher/mmc-pack.json" "./"
    cp -r "../../exports/Prismlauncher/redstropolis.png" "./"

    # Assets
    cp -r "../../options.txt" "./minecraft/"
    cp -r "../../config" "./minecraft/"
    cp -r "../../downloads/config" "./minecraft/"
    cp -r "../../downloads/mods" "./minecraft/"
    cp -r "../../downloads/resourcepacks" "./minecraft/"
    cp -r "../../extras/OpenSecurity" "./minecraft/mods/"

    zip -r "../Redstropolis_Prismlauncher_${modpackVersion}_Java_8.zip" "./"

    logMessage "info" "Exported to build/Redstropolis_Prismlauncher_${modpackVersion}_Java_8.zip"
}

packageToPrismlauncherJava17() {

    cp -r "../../downloads/lwjgl3/mmc-pack.json" "./"
    cp -r "../../downloads/lwjgl3/libraries" "./"
    cp -r "../../downloads/lwjgl3/patches" "./"
    cp -r ../../downloads/lwjgl3/lwjgl3ify-*.jar "./minecraft/mods"

    zip -r "../Redstropolis_Prismlauncher_${modpackVersion}_Java_17-25.zip" "./"

    logMessage "info" "Exported to build/Redstropolis_Prismlauncher_${modpackVersion}_Java_17-25.zip"
}

### PROGRAM START ###

checkEnvironment

createEnvironment

packageToPrismlauncherJava8

packageToPrismlauncherJava17

logMessage "done" "Exported all Prismlauncher builds"
exit 0
