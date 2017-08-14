#!/usr/bin/env zsh

plib_node_version(){
  which ruby > /dev/null && echo -ne `node -v | tr -d 'v \n'`;
}

plib_nodenv_version(){
  which ruby > /dev/null && echo -ne `nodenv version | awk '{print $1}' | tr -d ' \n'`;
}