#!/usr/bin/env zsh

plib_crystal_version(){
  command -v crystal > /dev/null && echo -ne "$(crystal -v | head -1 | awk '{print $2}')"
}

plib_crystal_major_minor_version(){
  command -v crystal > /dev/null && echo -ne "$(crystal -v | head -1 | awk -F'[ .]' '{print $2"."$3}')"
}

plib_crystal_major_version(){
  command -v crystal > /dev/null && echo -ne "$(crystal -v | head -1 | awk -F'[ .]' '{print $2}')"
}

plib_crenv_version(){
  command -v crenv > /dev/null && echo -ne "$(crenv version-name | awk '{print $1}')"
}

plib_crenv_major_minor_version(){
  command -v crenv > /dev/null && echo -ne "$(crenv version-name | awk -F. '{print $1"."$2}')"
}

plib_crenv_major_version(){
  command -v crenv > /dev/null && echo -ne "$(crenv version-name | awk -F. '{print $1}')"
}
