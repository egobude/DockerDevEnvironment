#!/bin/sh

set -u
set -e

bash() {
    log "Starting bash in php container"
    docker-compose exec --user=1000:33 php /bin/bash
}