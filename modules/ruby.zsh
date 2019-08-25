#!/usr/bin/env zsh

plib_ruby_version(){
  command -v ruby > /dev/null && echo -ne "$(ruby -v | tr 'p' ' ' | awk '{print $2}' | tr -d ' \n')"
}

plib_ruby_short_version(){
  command -v ruby > /dev/null && echo -ne "$(ruby -v | tr 'p' ' ' | awk -F '[. ]' '{printf("%s.%s",$2,$3)}')"
}

plib_rbenv_version(){
  command -v rbenv > /dev/null && echo -ne "$(rbenv version | awk '{print $1}' | tr -d ' \n')"
}
