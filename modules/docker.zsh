#!/usr/bin/env zsh

plib_docker_version(){
  command -v docker > /dev/null && echo -ne "$(docker -v | awk -F'[ ,.]' '{print $3"."$4"."$5}')"
}

plib_docker_major_minor_version(){
  command -v docker > /dev/null && echo -ne "$(docker -v | awk -F'[ ,.]' '{print $3"."$4}')"
}

plib_docker_major_version(){
  command -v docker > /dev/null && echo -ne "$(docker -v | awk -F'[ ,.]' '{print $3}')"
}
