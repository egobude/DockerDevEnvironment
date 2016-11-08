#!/bin/sh

set -u
set -e

grunt() {
    log "Execute grunt"
    docker-compose run --user=1000:33 nodejs grunt $@
}

grunt_help() {
    log "Display grunt usage instructions"
    docker-compose run --user=1000:33 nodejs grunt -h
}