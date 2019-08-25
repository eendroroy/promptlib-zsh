#!/usr/bin/env zsh

plib_go_version(){
  command -v go > /dev/null && echo -ne "$(go version | tr 'p' ' ' | awk '{print $3}' | tr -d 'go')"
}

plib_go_major_minor_version(){
  command -v go > /dev/null && echo -ne "$(go version | tr 'p' ' ' | awk -F'[ .]' '{print $3"."$4}' | tr -d 'go')"
}

plib_go_major_version(){
  command -v go > /dev/null && echo -ne "$(go version | tr 'p' ' ' | awk -F'[ .]' '{print $3}' | tr -d 'go')"
}

plib_goenv_version(){
  command -v goenv > /dev/null && echo -ne "$(goenv version-name)"
}

plib_goenv_major_minor_version(){
  command -v goenv > /dev/null && echo -ne "$(goenv version-name | awk -F. '{print $1"."$2}')"
}

plib_goenv_major_version(){
  command -v goenv > /dev/null && echo -ne "$(goenv version-name | awk -F. '{print $1}')"
}
