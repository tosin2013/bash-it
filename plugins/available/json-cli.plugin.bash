# shellcheck shell=bash
# stub for renamed file
# https://github.com/swaggest/json-cli
#set -x
cite about-plugin
about-plugin 'A CLI app to find unordered diff between two JSON documents (based on swaggest/json-diff), generate JSON Schema and Go/PHP code, pretty print, minify, yaml convert, etc....'

if ! _command_exists json-cli
then
  function php-install() {
      # Check the Linux distribution
      distribution=$(cat  /etc/os-release | grep ID | head -1 | cut -d "=" -f 2)
      # Install PHP based on the Linux distribution
      if [ "$distribution" == "ubuntu" ] || [ "$distribution" == "debain" ]; then
        sudo apt-get update -y
        sudo apt-get install -y php
      elif [ "$distribution" == "centos" ] || [ "$distribution" == "rhel" ]|| [ "$distribution" == "rocky" ]; then
        sudo dnf update -y
        sudo dnf install -y php
      else
        echo "Error: unsupported Linux distribution: $distribution"
        exit 1
      fi
  }

  function json-cli-install() {
    curl -OL https://github.com/swaggest/json-cli/releases/download/v1.11.1/json-cli
    chmod +x json-cli
    sudo mv json-cli /usr/local/bin/json-cli
    if ! _command_exists php
    then
      php-install
    fi
  }

  json-cli-install
fi


function json-cli_on_disable() {
  about 'Destructor of json-cli plugin'
  group 'json-cli'

  rm -f /usr/local/bin/json-cli
}