#!/usr/bin/env zsh

plib_elixir_version(){
  which elixir > /dev/null && echo -ne `elixir -v | awk '/Elixir/ {printf("%s", $2)}'`;
}

plib_exenv_version(){
  which exenv > /dev/null && echo -ne `exenv version | awk '{printf("%s", $1)}'`;
}

