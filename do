#!/bin/sh

set -u
set -e

# Set variables
BASEDIR=$(dirname "$0")
SYSTEM_PLUGIN_PATH="$BASEDIR/plugins"
CUSTOM_PLUGIN_PATH=$(realpath ~/.do)

# Define colors
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
YELLOW="$(tput setaf 3)"
BLUE="$(tput setaf 4)"
BOLD="$(tput bold)"
NORMAL="$(tput sgr0)"

function createDockerCompose() {
    printf "${GREEN}createDockerCompose${NORMAL}\n"
}

function createEnvFile() {
    printf "${GREEN}createEnvFile${NORMAL}\n"
}

function checkForDockerComposeFile() {
    if [ ! -e "docker-compose.yml" ]; then    
    while true; do
        printf "${YELLOW}No docker-compose file detected.${NORMAL}\n"
        read -p "Do you want to to create a default docker-compose file? " yn
        case $yn in
            [Yy]* ) createDockerCompose; break;;
            [Nn]* ) echo "Skip creating docker-compose file"; exit;;
            * ) echo "Please answer yes or no" ;;
        esac
    done
fi
}

function checkForEnvFile() {
    if [ ! -e ".env" ]; then    
    while true; do
        printf "${YELLOW}No .env file detected.${NORMAL}\n"
        read -p "Do you want to to create a .env file? " yn
        case $yn in
            [Yy]* ) createEnvFile; break;;
            [Nn]* ) echo "Skip creating .env file"; exit;;
            * ) echo "Please answer yes or no" ;;
        esac
    done
fi
}

# Check if docker and docker-compose are available on trhe system
command -v docker >/dev/null 2>&1 || { printf "${RED}docker is not installed.${NORMAL}  Aborting." >&2; exit 1; }
command -v docker-compose >/dev/null 2>&1 || { printf "${RED}docker-compose is not installed.${NORMAL} Aborting." >&2; exit 1; }

# check if .env file exists in current directory
#if [ ! -e "docker-compose.yml" ]; then
#  echo ".env file does not exist in current folder. Aborting." >&2
#  exit 1
#fi

# Get docker and docker-compose version
dockerVersion=`docker --version`
dockerComposeVersion=`docker-compose --version`

function install() {
    checkForDockerComposeFile
    checkForEnvFile
}

# Show a list of commands
function help() {
    echo "$GREEN-----------------------------------------------------------------------"
    echo "Overview"
    echo                                                             
    echo "$dockerVersion"
    echo "$dockerComposeVersion"
    echo 
    echo "PluginPath: $SYSTEM_PLUGIN_PATH"
    echo "CustomPath: $CUSTOM_PLUGIN_PATH"
    echo "$NORMAL"
    echo "-----------------------------------------------------------------------"
    typeset -f | awk '/ \(\) $/ && !/^log / {print $1}'        
    echo "-----------------------------------------------------------------------"
}

# Include additional shell scripts
if [ -d $SYSTEM_PLUGIN_PATH ]; then
  for file in $SYSTEM_PLUGIN_PATH/*.sh; do    
    source "$file"
  done
fi

# Include user specific shell scripts located under ~/.do
if [ -d ~/.do ] && [ "$(ls -A ~/.do/)" ]; then
  for file in  ~/.do/*.sh; do    
    source "$file"
  done
fi

$*
