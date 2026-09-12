#!/usr/bin/env bash
#
# Author: Justus0405
# Date: 01.01.2026
# License: MIT

# GitHub API base URL.
export githubAPI="https://api.github.com/repos"

# Github authentication token (required for multiple API calls).
source "./libs/.env"

downloadGithubMods() {
    cd "../downloads/mods" || exit 1

    # Check if token is set.
    if [[ -z "${githubToken}" ]]; then
        logMessage "error" "githubToken variable not set inside /libs/.env!"
    fi

    for repo in "${githubRepos[@]}"; do

        # Fetch with authentication header.
        json=$(curl -s -H "Authorization: Bearer ${githubToken}" \
            -H "Accept: application/vnd.github+json" \
            "${githubAPI}/${repo}/releases/latest")

        # Extract the latest valid .jar asset URL (ignoring -api, -dev, etc.).
        jarUrl=$(echo "${json}" | grep -oP '"browser_download_url": "\K[^"]+\.jar' | grep -vE '(-api|-dev-preshadow|-dev|-sources|-fairplay|-predowngrade|-deploader)' | head -n 1)

        # Check if found a valid JAR file.
        if [[ -z "${jarUrl}" ]]; then
            logMessage "warning" "No valid JAR file found for ${repo}! This may be an API slowdown"
        fi

        file=$(basename "${jarUrl}")

        curl -s -L -O "${jarUrl}" || logMessage "warning" "Could not finish download of: ${file}"

        logMessage "info" "Downloaded: ${file}"
    done
}
