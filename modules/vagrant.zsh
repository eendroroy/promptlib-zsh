#!/usr/bin/env zsh

plib_vagrant_version(){
  command -v vagrant > /dev/null && echo -ne "$(vagrant -v | awk -F'[ .]' '{print $2"."$3"."$4}')"
}

plib_vagrant_major_minor_version(){
  command -v vagrant > /dev/null && echo -ne "$(vagrant -v | awk -F'[ .]' '{print $2"."$3}')"
}

plib_vagrant_major_version(){
  command -v vagrant > /dev/null && echo -ne "$(vagrant -v | awk -F'[ .]' '{print $2}')"
}
