#!/bin/sh

set -u
set -e

nodejs() {
    log "Execute node"
    docker-compose run --user=1000:33 nodejs node $@
}

nodejs_bower() {
    log "Execute bower"
    docker-compose run --user=1000:33 nodejs bower $@
}

nodejs_grunt() {
    log "Execute grunt"
    docker-compose run --user=1000:33 nodejs grunt $@
}

nodejs_npm() {
    log "Execute npm"
    docker-compose run --user=1000:33 nodejs npm $@
}