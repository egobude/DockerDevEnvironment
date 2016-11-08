#!/bin/sh

set -u
set -e

neos_create_project() {
    log "Create new neos application"
    composer create-project --no-dev neos/neos-base-distribution /app
}

neos_site_prune() {
    log "neos_site_prune"    
}

neos_site_import() {
    log "neos_site_import"    
}

neos_site_export() {
    log "neos_site_export"    
}