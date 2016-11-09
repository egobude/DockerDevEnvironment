#!/bin/sh

set -u
set -e

nodejs() {
    log "Execute node"
    docker-compose run --user=1000:33 nodejs node $@
}

nodejs_help() {
    log "Display nodejs usage instructions"
    docker-compose run --user=1000:33 nodejs node -h
}