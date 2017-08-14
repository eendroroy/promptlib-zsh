#!/usr/bin/env zsh

plib_java_version(){
  which java > /dev/null && echo -ne `java -version 2>&1 | awk -F '["_]' '/version/ {print $2}' | tr -d '\n'`;
}

plib_java_major_version(){
  which java > /dev/null && echo -ne `java -version 2>&1 | awk -F '["_.]' '/version/ {print $3}' | tr -d '\n'`;
}
