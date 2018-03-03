#!/usr/bin/env zsh

plib_crystal_version(){
  which crystal > /dev/null && echo -ne `crystal -v | head -1 | awk '{print $2}' | tr -d ' \n'`;
}

plib_crenv_version(){
  which crenv > /dev/null && echo -ne `crenv version | awk '{print $1}' | tr -d ' \n'`;
}
