#!/usr/bin/env zsh

plib_node_version(){
  which node > /dev/null && echo -ne `node -v | tr -d 'v \n'`;
}

plib_nodenv_version(){
  which nodenv > /dev/null && echo -ne `nodenv version | awk '{print $1}' | tr -d ' \n'`;
}

plib_node_major_version(){
  which node > /dev/null && echo -ne `node -v | awk -F. '{print $1}' | tr -d 'v \n'`;
}

plib_nodenv_major_version(){
  which nodenv > /dev/null && echo -ne `nodenv version | awk -F. '{print $1}' | tr -d ' \n'`;
}
