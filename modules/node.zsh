#!/usr/bin/env zsh

plib_node_version(){
  command -v node > /dev/null && echo -ne "$(node -v | tr -d 'v')"
}

plib_node_major_minor_version(){
  command -v node > /dev/null && echo -ne "$(node -v | awk -F. '{print $1"."$2}' | tr -d 'v')"
}

plib_node_major_version(){
  command -v node > /dev/null && echo -ne "$(node -v | awk -F. '{print $1}' | tr -d 'v')"
}

plib_nodenv_version(){
  command -v nodenv > /dev/null && echo -ne "$(nodenv version-name | awk '{print $1}')"
}

plib_nodenv_major_minor_version(){
  command -v nodenv > /dev/null && echo -ne "$(nodenv version-name | awk -F. '{print $1"."$2}')"
}

plib_nodenv_major_version(){
  command -v nodenv > /dev/null && echo -ne "$(nodenv version-name | awk -F. '{print $1}')"
}
