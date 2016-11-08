#!/bin/sh

set -u
set -e

redis() {
    log "Command line interface utility to talk with Redis"
    log "http://redis.io/commands/info"
    docker-compose exec --user=1000:33 redis redis-cli
}

redis_monitor() {
    log "Debugging command that streams back every command processed by the Redis server"
    docker-compose exec --user=1000:33 redis redis-cli MONITOR
}

redis_info() {
    log "Info command that returns information and statistics about the server"
    docker-compose exec --user=1000:33 redis redis-cli INFO
}

redis_ping() {
    log "Sending a PING command using redis-cli to check if Redis is working properly"
    docker-compose exec --user=1000:33 redis redis-cli PING
}