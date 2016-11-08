Docker Development Environment
===================

## Available commands

Execute `./bin/do help` to get a list of all available commands.

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

* Improve documentation
* Tweak the output of `./bin/do help` to show a description for each command