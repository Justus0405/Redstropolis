#!/usr/bin/env bash
#
# Author: Justus0405
# Date: 01.01.2026
# License: MIT

export scriptVersion="1.0"

### LIBRARIES ###
source "./libs/libBase.sh"

### FUNCTIONS ###
generateDiff() {
    ls "../downloads/mods" >"../modlist.diff"
}

### PROGRAM START ###

generateDiff

logMessage "done" "Generated modlist.diff"
exit 0
