#!/bin/sh

set -u
set -e

start() {
    log "Start development environment"
    docker-compose up -d
}

stop() {
    log "Stop development environment"
    docker-compose down --remove-orphans $@
}

status() {
    log "Status for the development environment"
    docker-compose ps $@
}

restart() {
    log "Restart development environment"
    stop
    start
}

pull() {
    log "Pull latest docker images"
    docker-compose pull
}

upgrade() {
    log "Upgrade development environment"
    while true; do
    read -p "Do you really want to upgrade your development environment?" yn
    case $yn in
        [Yy]* ) pull; restart; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no. Choose wisely ;)" ;;
    esac
done
}