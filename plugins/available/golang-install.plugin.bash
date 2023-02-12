# shellcheck shell=bash
# stub for renamed file
# https://github.com/swaggest/go
#set -x
cite about-plugin
about-plugin 'Install Golang. Go, also known as GoLang, is an open source programming language developed at Google by Robert Griesemer, Rob Pike, and Ken Thompson in 2007.'

if ! _command_exists go
then

  function go-install() {
    if [ ! -f /home/${HOME}/.go/bin/go ];
    then 
      export BASH_IT_LOG_LEVEL=BASH_IT_LOG_LEVEL_ALL
      wget https://storage.googleapis.com/golang/getgo/installer_linux
      chmod +x ./installer_linux
      ./installer_linux 
      source /home/${USER}/.bash_profile
      unset $BASH_IT_LOG_LEVEL
    fi
  }

  go-install
fi


function go_on_disable() {
  about 'Destructor of go plugin'
  group 'go'

  sudo rm -f /home/${HOME}/.go/bin/go
}


# go install github.com/spf13/cobra-cli@latest