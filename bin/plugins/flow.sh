#!/bin/sh

set -u
set -e

flow() {
    log "Execute flow command"
    docker-compose exec --user=1000:33 php php flow $@
}

flow_cache_clear() {
    log "Clear flow cache"
    docker-compose exec --user=1000:33 php php flow cache:warmup
}

flow_cache_warmup() {
    log "Warump flow cache"
    docker-compose exec --user=1000:33 php php flow cache:warmup
}