#!/usr/bin/env bash
#
# Author: Justus0405
# Date: 01.01.2026
# License: MIT

downloadResourcepacks() {
    cd "../resourcepacks" || exit 1
    for projectUrl in "${resourcepacks[@]}"; do

        file=$(basename "${projectUrl}")

        curl -s -L -O "${projectUrl}" || logMessage "error" "Could not finish download of: ${file}"

        logMessage "info" "Downloaded: ${file}"
    done
}
