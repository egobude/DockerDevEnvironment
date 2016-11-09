#!/bin/sh

set -u
set -e

beanstalkd() {
    log "Starting telnet into the beanstalkd container"
    log "http://www.markhneedham.com/blog/2013/03/21/beanstalkd-getting-the-status-of-the-queue/"
    telnet localhost 11300
}