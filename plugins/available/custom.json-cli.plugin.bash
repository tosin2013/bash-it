# shellcheck shell=bash
# stub for renamed file

cite about-plugin
about-plugin 'A CLI app to find unordered diff between two JSON documents (based on swaggest/json-diff), generate JSON Schema and Go/PHP code, pretty print, minify, yaml convert, etc....'

if [ ! -f "/usr/local/bin/json-cli" ]; then
   curl -OL https://github.com/swaggest/json-cli/releases/download/v1.11.1/json-cli
   chmod +x json-cli
   mv json-cli /usr/local/bin/json-cli
elif [ -f "/usr/bin/json-cli" ]; then
  json-cli
fi