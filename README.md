Docker Development Environment
===================

Use the commands in `./bin/do` to interact with your development environment:

## Available commands

* `./bin/do bash` - Starts a bash in the php container
* `./bin/do flow <your command>` - Executes a flow command in the php container
* `./bin/do mysql <your command>` - Executes a mysql command in the php container
* `./bin/do start` - Start the development environment
* `./bin/do stop` - Stop the development environment
* `./bin/do status` - Overview over the development environment
* `./bin/do restart` - Restart the development environment
* `./bin/do upgrade` - Upgrade the development environment
* `./bin/do help` - Command overview

## Customize

Under Build/Docker you find some configuration files wich are mounted to the containers on startup. You can customize or add new files for your needs.

## Todo

* Improve documentation
  * How to write custom commands