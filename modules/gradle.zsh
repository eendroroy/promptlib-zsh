#!/usr/bin/env zsh

plib_gradle_version(){
  command -v gradle > /dev/null && echo -ne "$(gradle -v | grep Gradle | awk '{print $2}')"
}

plib_gradle_major_version(){
  command -v gradle > /dev/null && echo -ne "$(gradle -v | grep Gradle | awk -F'[ .]' '{print $2}')"
}

plib_gradle_minor_version(){
  command -v gradle > /dev/null && echo -ne "$(gradle -v | grep Gradle | awk -F'[ .]' '{print $3}')"
}
