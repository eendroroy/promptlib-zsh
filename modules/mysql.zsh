#!/usr/bin/env zsh

plib_mysql_version(){
  command -v mysqld > /dev/null && echo -ne "$(mysqld --version | sed 's|.*Ver||g' | tr -s ' ' | awk -F'[ -.]' '{print $2"."$3"."$4}')"
}

plib_mysql_major_minor_version(){
  command -v mysqld > /dev/null && echo -ne "$(mysqld --version | sed 's|.*Ver||g' | tr -s ' ' | awk -F'[ -.]' '{print $2"."$3}')"
}

plib_mysql_major_version(){
  command -v mysqld > /dev/null && echo -ne "$(mysqld --version | sed 's|.*Ver||g' | tr -s ' ' | awk -F'[ -.]' '{print $2}')"
}

plib_mysql_service_status_homebrew(){
  command -v brew > /dev/null || return
  command -v mysqld > /dev/null && echo -ne "$(brew services list | grep 'mysql' | awk '{print $2}')"
}

plib_mysql_service_status_linux(){
  command -v service > /dev/null || return
  command -v mysqld > /dev/null && echo -ne "$(service mysql status | grep 'Active' | awk '{print $2}')"
}
