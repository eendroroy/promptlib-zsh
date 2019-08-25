#!/usr/bin/env zsh

plib_java_version(){
  command -v java > /dev/null && echo -ne "$(java -version 2>&1 | awk -F '["_]' '/version/ {print $2}')";
}

plib_java_major_version(){
  _version1=$(command -v java > /dev/null && echo -ne "$(java -version 2>&1 | awk -F '["_.]' '/version/ {print $2}')")
  _version2=$(command -v java > /dev/null && echo -ne "$(java -version 2>&1 | awk -F '["_.]' '/version/ {print $3}')")
  [[ $_version1 == '1' ]] && echo -ne "$_version2" || echo -ne "$_version1"
}
