#!/usr/bin/env zsh

plib_ruby_version(){
  command -v ruby > /dev/null && echo -ne "$(ruby -v | tr 'p' ' ' | awk '{print $2}' | tr -d ' \n')"
}

plib_ruby_major_version(){
  command -v ruby > /dev/null && echo -ne "$(ruby -v | tr 'p' ' ' | awk -F '[. ]' '{printf("%s",$2)}')"
}

plib_ruby_major_minor_version(){
  command -v ruby > /dev/null && echo -ne "$(ruby -v | tr 'p' ' ' | awk -F '[. ]' '{printf("%s.%s",$2,$3)}')"
}

plib_rbenv_version(){
  command -v rbenv > /dev/null && echo -ne "$(rbenv version-name | awk '{print $1}')"
}

plib_rbenv_major_version(){
  command -v rbenv > /dev/null && echo -ne "$(rbenv version-name | awk -F'.' '{printf("%s",$1)}')"
}

plib_rbenv_major_minor_version(){
  command -v rbenv > /dev/null && echo -ne "$(rbenv version-name | awk -F'.' '{printf("%s.%s",$1,$2)}')"
}
