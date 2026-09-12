#!/usr/bin/env bash
#
# Author: Justus0405
# Date: 01.01.2026
# License: MIT

### COLOR CODES ###
export black="\e[1;30m"
export red="\e[1;31m"
export green="\e[1;32m"
export yellow="\e[1;33m"
export blue="\e[1;34m"
export purple="\e[1;35m"
export cyan="\e[1;36m"
export lightGray="\e[1;37m"
export gray="\e[1;90m"
export lightRed="\e[1;91m"
export lightGreen="\e[1;92m"
export lightYellow="\e[1;93m"
export lightBlue="\e[1;94m"
export lightPurple="\e[1;95m"
export lightCyan="\e[1;96m"
export white="\e[1;97m"
export bold="\e[1m"
export faint="\e[2m"
export italic="\e[3m"
export underlined="\e[4m"
export blinking="\e[5m"
export reset="\e[0m"

### INFO VARIABLES ###
export success="${gray}[${green}✓${gray}]${reset}"
export error="${red}Error:${reset}"
export warning="${gray}[${red}!${gray}]${reset}"
export section="${gray}[${yellow}!${gray}]${reset}"
export info="${gray}[${cyan}i${gray}]${reset}"

### FUNCTIONS ###
logMessage() {
    local type="$1"
    local message="$2"
    case "${type}" in
    "info" | "INFO")
        echo -e "[  ${cyan}INFO${reset}  ] ${message}"
        ;;
    "done" | "DONE")
        echo -e "[  ${green}DONE${reset}  ] ${message}"
        ;;
    "warning" | "WARNING")
        echo -e "[ ${red}FAILED${reset} ] ${message}"
        ;;
    "error" | "ERROR")
        echo -e "[  ${red}ERROR${reset} ] ${message}"
        exit 1
        ;;
    *)
        echo -e "[UNDEFINED] ${message}"
        ;;
    esac
}
