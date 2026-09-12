#!/usr/bin/env bash
#
# Author: Justus0405
# Date: 01.01.2026
# License: MIT

export scriptVersion="1.0"

### LIBRARIES ###
source "./libs/libBase.sh"
source "./libs/libDownloadArchived.sh"
source "./libs/libDownloadGithub.sh"
source "./libs/libDownloadResourcepacks.sh"
source "./libs/libDownloadRailroading.sh"
source "./libs/libDownloadLWJGL3.sh"

### FUNCTIONS ###
createEnvironment() {
    rm -rf "../downloads"
    mkdir -p "../downloads/mods" "../downloads/resourcepacks" "../downloads/lwjgl3" "../downloads/config/immersiverailroading"
}

export githubRepos=(
    "GTNewHorizons/Angelica"
    "GTNewHorizons/Backhand"
    "GTNewHorizons/Bugtorch"
    "GTNewHorizons/CodeChickenCore"
    "GTNewHorizons/Controlling"
    "GTNewHorizons/CropLoadCore"
    "GTNewHorizons/GTNHLib"
    "GTNewHorizons/HelpFixer"
    "GTNewHorizons/Hodgepodge"
    "GTNewHorizons/MouseTweaks"
    "GTNewHorizons/NetherPortalFix"
    "GTNewHorizons/NotEnoughItems"
    "GTNewHorizons/waila"
    "GTNewHorizons/worldedit-gtnh"
    "GTMEGA/EndlessIDs"
    "FalsePattern/FalsePatternLib"
    "LegacyModdingMC/ChunkAPI"
    "LegacyModdingMC/UniMixins"
    "Roadhog360/Et-Futurum-Requiem"
    "embeddedt/ArchaicFix"
    "makamys/CoreTweaks"
    "zlainsama/SkinPort"
    "slprime/ChromaticTooltips"
    "slprime/ChromaticTooltipsCompat"
)

export archived=(
    "https://mediafilez.forgecdn.net/files/2257/644/Aroma1997Core-1.7.10-1.0.2.16.jar"
    "https://mediafilez.forgecdn.net/files/2284/754/AromaBackup-1.7.10-0.1.0.0.jar"
    "https://mediafilez.forgecdn.net/files/2500/869/BetterFoliage-MC1.7.10-2.0.17.jar"
)

export resourcepacks=(
    "https://mediafilez.forgecdn.net/files/8733/664/Modernity-f1-3.10.3.1.zip"
    "https://github.com/user-attachments/files/24547091/black-tooltips-simple.zip"
)

# NOTE: HOW TO UPDATE
# 1. Update links in array below
# 2. Replace lwjgl3ify-forgePatches.jar inside exports/Server
# 3. Update java9args.txt from https://github.com/GTNewHorizons/lwjgl3ify/blob/master/java9args.txt
# 4. No OCD Replacing minecraft_server.1.7.10.jar
export lwjgl3=(
    "https://github.com/GTNewHorizons/lwjgl3ify/releases/download/3.0.33/lwjgl3ify-3.0.33-multimc.zip"
    "https://github.com/GTNewHorizons/lwjgl3ify/releases/download/3.0.33/lwjgl3ify-3.0.33.jar"
)

### PROGRAM START ###

createEnvironment

downloadGithubMods

dowloadArchivedMods

downloadResourcepacks

downloadLWJGL3

logMessage "done" "Base layer complete!"
exit 0
