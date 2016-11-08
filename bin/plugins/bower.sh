#!/bin/sh

set -u
set -e

bower() {
    log "nodejs_bower"
    docker-compose run --user=1000:33 nodejs bower $@
}

bower_help() {
    log "Display bower usage instructions"
    docker-compose run --user=1000:33 nodejs bower -h $@
}