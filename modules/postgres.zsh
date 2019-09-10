#!/usr/bin/env zsh

plib_postgres_version(){
  command -v psql > /dev/null && echo -ne "$(psql -V | awk -F'[ .]' '{print $3"."$4}')"
}

plib_postgres_major_minor_version(){
  command -v psql > /dev/null && echo -ne "$(psql -V | awk -F'[ .]' '{print $3"."$4}')"
}

plib_postgres_major_version(){
  command -v psql > /dev/null && echo -ne "$(psql -V | awk -F'[ .]' '{print $3}')"
}

plib_postgres_service_status_homebrew(){
  command -v brew > /dev/null || return
  command -v psql > /dev/null && echo -ne "$(brew services list | grep 'postgres' | awk '{print $2}')"
}

plib_postgres_service_status_linux(){
  command -v service > /dev/null || return
  command -v psql > /dev/null && echo -ne "$(service postgres status | grep 'Active' | awk '{print $2}')"
}
