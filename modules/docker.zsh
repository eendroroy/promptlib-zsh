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

plib_docker_service_status(){
  command -v docker > /dev/null && echo -ne "$(docker info >/dev/null 2>&1; echo $?)"
}

plib_docker_container_count(){
  command -v docker > /dev/null && echo -ne "$(docker ps -q 2>/dev/null | wc -l | tr -d ' ')"
}
