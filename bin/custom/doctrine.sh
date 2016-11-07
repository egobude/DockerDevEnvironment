#!/bin/sh

set -u
set -e

doctrine_migrationgenerate() {
    log "Execute flow doctrine:migrationgenerate"
    docker-compose exec --user=1000:33 php php flow doctrine:migrationgenerate $@
}

doctrine_migrationstatus() {
    log "Execute flow migrationstatus"
    docker-compose exec --user=1000:33 php php flow doctrine:migrationstatus $@
}

doctrine_migrate() {
    log "Execute flow doctrine:migrate"
    docker-compose exec --user=1000:33 php php flow doctrine:migrationgenerate $@
}