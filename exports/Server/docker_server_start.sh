#!/usr/bin/env bash
#
# Author: Justus0405
# Date: 20.03.2026
# License: MIT

mkdir "server-backups" "server-world"

tee "./.dockerignore" >/dev/null <<EOF
Dockerfile
docker-compose.yml
.dockerignore
docker_server_start.sh
docker_server_stop.sh
docker_server_debug.sh
server-backups
server-world
EOF

clear && docker-compose down --timeout 0 && docker-compose up -d --build && docker-compose logs --follow
