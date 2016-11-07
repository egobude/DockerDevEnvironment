#!/bin/sh

set -u
set -e

mysql() {
    log "Execute mysql commands"
    docker-compose exec mysql mysql -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE $@
}

mysql_dump() {
    log "Dumps the mysql database"
    # docker-compose exec db mysqldump -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE $@
}

mysql_import() {
    log "Imports the mysql database"
    # docker exec -i $(docker-compose ps | grep _db_ | awk '{print $1}') mysql -u$MYSQL_USER -p$MYSQL_PASSWORD $MYSQL_DATABASE
}