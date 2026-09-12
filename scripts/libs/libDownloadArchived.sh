#!/usr/bin/env bash
#
# Author: Justus0405
# Date: 01.01.2026
# License: MIT

dowloadArchivedMods() {

    for projectUrl in "${archived[@]}"; do

        file=$(basename "${projectUrl}")

        curl -s -L -O "${projectUrl}" || logMessage "error" "Could not finish download of: ${file}"

        logMessage "info" "Downloaded: ${file}"
    done
}
