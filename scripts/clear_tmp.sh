#!/usr/bin/env bash
#
# Author: Justus0405
# Date: 01.01.2026
# License: MIT

export scriptVersion="1.0"

### LIBRARIES ###
source "./libs/libBase.sh"

### FUNCTIONS ###
clearTMP() {
    rm -rf "../build/tmp"
}

### PROGRAM START ###

clearTMP

logMessage "done" "Cleared tmp files!"
exit 0
