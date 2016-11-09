#!/bin/sh

set -u
set -e

# Show log message
log() {
    echo "${HOSTNAME} | $BLUE > $1 $NORMAL"
}