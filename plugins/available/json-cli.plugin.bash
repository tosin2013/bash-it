# shellcheck shell=bash
# stub for renamed file
set -x
cite about-plugin
about-plugin 'A CLI app to find unordered diff between two JSON documents (based on swaggest/json-diff), generate JSON Schema and Go/PHP code, pretty print, minify, yaml convert, etc....'

if ! _command_exists json-cli
then
  function json-cli-install() {
   curl -OL https://github.com/swaggest/json-cli/releases/download/v1.11.1/json-cli
   chmod +x json-cli
   sudo mv json-cli /usr/local/bin/json-cli
  }

  json-cli-install
fi


function json-cli_on_disable() {
  about 'Destructor of json-cli plugin'
  group 'json-cli'

  rm -f /usr/local/bin/json-cli
}