#!/usr/bin/env zsh

plib_elixir_version(){
  command -v elixir > /dev/null && echo -ne "$(elixir -v | awk '/Elixir/ {printf("%s", $2)}')"
}

plib_exenv_version(){
  command -v exenv > /dev/null && echo -ne "$(exenv version | awk '{printf("%s", $1)}')"
}

