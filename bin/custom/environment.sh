#!/bin/sh

set -u
set -e

environment_start() {
    log "Start development environment"
    docker-compose up -d
}

environment_stop() {
    log "Stop development environment"
    docker-compose down --remove-orphans $@
}

environment_status() {
    log "Status for the development environment"
    docker-compose ps $@
}

environment_restart() {
    log "Restart development environment"
    environment_stop
    environment_start
}

environment_pull() {
    log "Pull latest docker images"
    docker-compose pull
}

environment_upgrade() {
    log "Upgrade development environment"
    while true; do
    read -p "Do you really want to upgrade your development environment?" yn
    case $yn in
        [Yy]* ) environment_pull; environment_restart; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no. Choose wisely ;)" ;;
    esac
done
}