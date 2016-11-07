#!/bin/sh

set -u
set -e

composer() {
    log "Execute composer command"
    docker-compose run --rm composer $@
}