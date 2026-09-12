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
checkEnvironment() {
    ls ../downloads/mods >/dev/null || exit 1
}

export githubRepos=(
    "GTNewHorizons/ArchitectureCraft"
    "GTNewHorizons/BuildCraft"
    "GTNewHorizons/CarpentersBlocks"
    "GTNewHorizons/Chisel"
    "GTNewHorizons/Custom-Main-Menu"
    "GTNewHorizons/ForgeMultipart"
    "GTNewHorizons/ForgeRelocation"
    "GTNewHorizons/ForgeRelocationFMP"
    "GTNewHorizons/LittleTiles"
    "GTNewHorizons/MalisisDoors"
    "GTNewHorizons/ModularUI2"
    "GTNewHorizons/ModernMarkings"
    "GTNewHorizons/MrTJPCore"
    "GTNewHorizons/Nuclear-Control"
    "GTNewHorizons/OpenBlocks"
    "GTNewHorizons/OpenComputers"
    "GTNewHorizons/OpenModsLib"
    "GTNewHorizons/OpenSecurity"
    "GTNewHorizons/ProjectRed"
    "GTNewHorizons/TX-Loader"
    "age-series/ElectricalAge"
    "hbmmods/hbm-s-nuclear-tech-git"
    "Justus0405/NTM-Fluid-Converters"
    "quentin452/SecurityCraft"
)

# NOTE: only catwalks-2 and projectblue need to be checked manually for updates
# SOURCE: https://nexus.gtnewhorizons.com/#browse/browse:releases:com%2Fgithub%2FGTNewHorizons
export archived=(
    "https://nexus.gtnewhorizons.com/repository/releases/com/github/GTNewHorizons/Catwalks-2/2.4.1-GTNH/Catwalks-2-2.4.1-GTNH.jar"
    "https://nexus.gtnewhorizons.com/repository/releases/com/github/GTNewHorizons/ProjectBlue/1.2.10-GTNH/ProjectBlue-1.2.10-GTNH.jar"
    "https://mediafilez.forgecdn.net/files/2221/679/MrCrayfishFurnitureModv3.4.7%281.7.10%29.jar"
    "https://mediafilez.forgecdn.net/files/2233/250/ChickenChunks-1.7.10-1.3.4.19-universal.jar"
    "https://mediafilez.forgecdn.net/files/2388/750/CoFHCore-%5B1.7.10%5D3.1.4-329.jar"
    "https://mediafilez.forgecdn.net/files/2388/756/ThermalDynamics-%5B1.7.10%5D1.2.1-172.jar"
    "https://mediafilez.forgecdn.net/files/2388/758/ThermalExpansion-%5B1.7.10%5D4.1.5-248.jar"
    "https://mediafilez.forgecdn.net/files/2388/752/ThermalFoundation-%5B1.7.10%5D1.2.6-118.jar"
    "https://mediafilez.forgecdn.net/files/2388/794/coroutil-1.7.10-1.1.6.jar"
    "https://mediafilez.forgecdn.net/files/2414/535/Decocraft-2.4.2_1.7.10.jar"
    "https://mediafilez.forgecdn.net/files/2513/48/weather2-1.7.10-2.3.20.jar"
    "https://mediafilez.forgecdn.net/files/3335/234/itlt-1.7.x-1.0.3.jar"
    "https://mediafilez.forgecdn.net/files/6833/54/industrialcraft-2-2.2.828-experimental.jar"
)

# "https://mediafilez.forgecdn.net/files/4970/93/ImmersiveRailroading-1.7.10-forge-1.10.0.jar"
# "https://mediafilez.forgecdn.net/files/7084/723/UniversalModCore-1.7.10-forge-1.2.2-0b6732c.jar"
# "https://mediafilez.forgecdn.net/files/2825/257/TrackAPI-1.2.jar"
# "https://mediafilez.forgecdn.net/files/5765/434/LandOfSignals-1.7.10-forge-1.3.3.jar"

export railroading=(
    "https://mediafilez.forgecdn.net/files/6019/307/GVR_Official_1.0.1.zip"
)

### PROGRAM START ###

checkEnvironment

downloadGithubMods

dowloadArchivedMods

#downloadRailroading

logMessage "done" "Content layer complete!"
exit 0
