#!/usr/bin/env bash
#
# Author: Justus0405
# Date: 01.01.2026
# License: MIT

downloadLWJGL3() {
    cd "../lwjgl3" || exit 1

    for projectUrl in "${lwjgl3[@]}"; do

        file=$(basename "${projectUrl}")

        curl -s -L -O "${projectUrl}" || logMessage "error" "Could not finish download of: ${file}"

        logMessage "info" "Downloaded: ${file}"
    done

    unzip lwjgl3ify-*-multimc.zip
}
