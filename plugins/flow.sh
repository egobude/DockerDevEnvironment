#!/bin/sh

set -u
set -e

flow() {
    log "Execute flow command"
    docker-compose exec --user=1000:33 php php flow $@
}

flow_create_project() {
    log "Create new flow application"
    composer create-project --no-dev neos/flow-base-distribution /app
}

flow_cache_clear() {
    log "Clear flow cache"
    docker-compose exec --user=1000:33 php php flow cache:warmup
}

flow_cache_warmup() {
    log "Warump flow cache"
    docker-compose exec --user=1000:33 php php flow cache:warmup
}

flow_doctrine_migrationgenerate() {
    log "Execute flow doctrine:migrationgenerate"
    docker-compose exec --user=1000:33 php php flow doctrine:migrationgenerate $@
}

flow_doctrine_migrationstatus() {
    log "Execute flow migrationstatus"
    docker-compose exec --user=1000:33 php php flow doctrine:migrationstatus $@
}

flow_doctrine_migrate() {
    log "Execute flow doctrine:migrate"
    docker-compose exec --user=1000:33 php php flow doctrine:migrationgenerate $@
}