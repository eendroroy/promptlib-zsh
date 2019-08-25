#!/usr/bin/env zsh

plib_php_version(){
  command -v php > /dev/null && echo -ne "$(php -v | head -1 | awk -F'[ -]' '{print $2}')"
}

plib_php_major_minor_version(){
  command -v php > /dev/null && echo -ne "$(php -v | head -1 | awk -F'[ -.]' '{print $2"."$3}')"
}

plib_php_major_version(){
  command -v php > /dev/null && echo -ne "$(php -v | head -1 | awk -F'[ -.]' '{print $2}')"
}
