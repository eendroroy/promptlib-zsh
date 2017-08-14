#!/usr/bin/env zsh

plib_time(){
  echo -ne "`date '+%H:%M:%S'`"
}

plib_date(){
  echo -ne "`date '+%d/%m/%y'`"
}

plib_day(){
  echo -ne "`date '+%a'`"
}
