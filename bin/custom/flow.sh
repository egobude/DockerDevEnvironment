#!/bin/sh

set -u
set -e

flow() {
    log "Execute flow commands"
    docker-compose exec --user=1000:33 php php flow $@
}