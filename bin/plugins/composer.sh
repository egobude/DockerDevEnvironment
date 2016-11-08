#!/bin/sh

set -u
set -e

composer() {
    log "Execute composer command"
    docker-compose run --rm composer $@
}

composer_help() {
    log "Returns information about a certain command"
    docker-compose run --rm composer help $@
}