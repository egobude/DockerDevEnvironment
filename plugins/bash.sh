#!/bin/sh

set -u
set -e

bash() {
    log "Starting a bash in the given container"
    docker-compose exec --user=1000:33 $@ /bin/bash
}