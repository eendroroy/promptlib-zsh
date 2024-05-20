#!/usr/bin/env zsh

plib_maven_version(){
  command -v mvn > /dev/null && echo -ne "$(mvn -v | grep 'Apache Maven' | awk '{print $3}')"
}

plib_maven_major_version(){
  command -v mvn > /dev/null && echo -ne "$(mvn -v | grep 'Apache Maven' | awk -F'[. ]' '{print $3}')"
}

plib_maven_minor_version(){
  command -v mvn > /dev/null && echo -ne "$(mvn -v | grep 'Apache Maven' | awk -F'[. ]' '{print $4}')"
}

plib_maven_major_minor_version(){
  command -v mvn > /dev/null && echo -ne "$(mvn -v | grep 'Apache Maven' | awk -F'[. ]' '{print $3"."$4}')"
}

plib_maven_patch_version(){
  command -v mvn > /dev/null && echo -ne "$(mvn -v | grep 'Apache Maven' | awk -F'[. ]' '{print $5}')"
}
