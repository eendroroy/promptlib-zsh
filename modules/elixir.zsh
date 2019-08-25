#!/usr/bin/env zsh

plib_elixir_version(){
  command -v elixir > /dev/null && echo -ne "$(elixir -v | awk '/Elixir/ {printf("%s", $2)}')"
}

plib_elixir_major_minor_version(){
  command -v elixir > /dev/null && echo -ne "$(elixir -v | awk -F'[ .]' '/Elixir/ {printf("%s.%s", $2, $3)}')"
}

plib_elixir_major_version(){
  command -v elixir > /dev/null && echo -ne "$(elixir -v | awk -F'[ .]' '/Elixir/ {printf("%s", $2)}')"
}

plib_exenv_version(){
  command -v exenv > /dev/null && echo -ne "$(exenv version-name | awk '{printf("%s", $1)}')"
}

plib_exenv_major_minor_version(){
  command -v exenv > /dev/null && echo -ne "$(exenv version-name | awk -F. '{printf("%s.%s", $1, $2)}')"
}

plib_exenv_major_version(){
  command -v exenv > /dev/null && echo -ne "$(exenv version-name | awk -F. '{printf("%s", $1)}')"
}
