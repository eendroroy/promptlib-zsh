#!/usr/bin/env zsh

plib_is_svn(){
  command -v svn > /dev/null || return
  if [[ $(svn info 2>/dev/null) != "" ]]; then
    echo -n 1
  else
    echo -n 0
  fi
 }

plib_svn_rev(){
  command -v svn > /dev/null || return
  __rev=$(svn info 2>/dev/null | grep Revision | awk '{print $2}') || return;
  echo -n "${__rev}";
  unset __rev;
}
