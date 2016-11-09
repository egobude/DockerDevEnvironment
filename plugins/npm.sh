#!/bin/sh

set -u
set -e

npm() {
    log "Execute npm"
    docker-compose run --user=1000:33 nodejs npm $@
}

npm_help() {
    log "Display npm usage instructions"
    docker-compose run --user=1000:33 nodejs npm -h
}