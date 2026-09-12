#!/usr/bin/env bash
#
# Author: Justus0405
# Date: 01.01.2026
# License: MIT

export scriptVersion="1.1"
export buildMode="1"

### LIBRARIES ###
source "./libs/libBase.sh"

### FUNCTIONS ###
getArguments() {
    case "$1" in
    "-nc" | "--no-cache")
        buildMode="1"
        ;;
    "-c" | "--cache")
        buildMode="2"
        ;;
    "")
        return
        ;;
    *)
        return
        ;;
    esac
}

buildWithNoCache() {

    ./build_base_layer.sh

    ./build_content_layer.sh

    ./export_curseforge.sh

    ./export_prismlauncher.sh

    ./export_server.sh

    ./generate_diff.sh

    ./clear_tmp.sh
}

buildWithCache() {

    ./export_curseforge.sh

    ./export_prismlauncher.sh

    ./export_server.sh

    ./clear_tmp.sh
}

### PROGRAM START ###

getArguments "$@"

case "${buildMode}" in
"1")
    buildWithNoCache
    ;;
"2")
    buildWithCache
    ;;
*)
    return
    ;;
esac

logMessage "done" "Build Finished"
exit 0
