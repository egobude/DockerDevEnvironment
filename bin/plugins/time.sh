#!/bin/sh

set -u
set -e

timestamp() {
   log "Show current timestamp" 
   date +'%s'
}
