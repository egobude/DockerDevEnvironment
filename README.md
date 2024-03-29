Docker Development Environment
===================

## Available commands

To get a full list of all available commands just execute `./bin/do help`

### Beanstalkd

* `./bin/do beanstalkd`

### Bower

* `./bin/do bower`
* `./bin/do bower_help`

### Composer

* `./bin/do composer`
* `./bin/do composer_help`

### Environment

* `./bin/do environment_start`
* `./bin/do environment_stop`
* `./bin/do environment_status`
* `./bin/do environment_restart`
* `./bin/do environment_pull`
* `./bin/do environment_upgrade`

### Flow Framwork

* `./bin/do flow`
* `./bin/do flow_create_project`
* `./bin/do flow_clear_cache`
* `./bin/do flow_cache_warmup`
* `./bin/do flow_doctrine_migrationgenerate`
* `./bin/do flow_doctrine_migrationstatus`
* `./bin/do flow_doctrine_migrate`

### Grunt

* `./bin/do grunt`
* `./bin/do grunt_help`

### MySQL (Not fully implemented)

* `./bin/do mysql`
* `./bin/do mysql_help`
* `./bin/do mysql_dump`
* `./bin/do mysql_import`

### Neos CMS (Not fully implemented)

* `./bin/do neos_create_project`
* `./bin/do neos_site_prune`
* `./bin/do neos_site_import`
* `./bin/do neos_site_export`

### NodeJs

* `./bin/do nodejs`
* `./bin/do nodejs_help`

### NPM

* `./bin/do npm`
* `./bin/do npm_help`

### Redis

* `./bin/do redis`
* `./bin/do redis_monitor`
* `./bin/do redis_info`
* `./bin/do redis_ping`

### Time

* `./bin/do timestamp`

## Usage

Start the docker environment

`./bin/do environment_start`

Create a Neos CMS project:

`./bin/do composer create-project --no-dev neos/neos-base-distribution /app`

Create a Flow Framework project

`./bin/do composer create-project --no-dev neos/flow-base-distribution /app`

## Customize

### Configuration files

Under ./Build/Docker you find some configuration files wich are mounted to the containers on startup. You can customize or add new files for your needs.

### Write your own scripts

Create a `~/.do` folder in your home directory and place a .sh file in the folder. For example:

Create the folder and the .sh file:

```
mkdir ~/.do
vim ~/.do/foo.sh
```

Put this content into the `~/.do/foo.sh` file

```
#!/bin/sh

set -u
set -e

foo() {
   log "echo bar"
}
```

When you now execute ./bin/do help you should see a new command `foo` in the listing.

## Todo

* Provide own docker images
* Improve documentation
* Tweak the output of `./bin/do help` to show a description for each command