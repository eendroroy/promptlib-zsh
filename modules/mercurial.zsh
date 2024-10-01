#!/usr/bin/env zsh

plib_is_hg(){
  command -v hg > /dev/null || return
  if [[ $(hg branch 2>/dev/null) != "" ]]; then
    echo -n 1
  else
    echo -n 0
  fi
}

plib_hg_branch(){
  command -v hg > /dev/null || return
  __ref=$(hg branch 2> /dev/null) || return;
  echo -ne "${__ref}";
  unset __ref;
}

plib_hg_rev(){
  command -v hg > /dev/null || return
  __rev=$(hg identify --num 2>/dev/null | tr -d " +") || return;
  echo -ne "${__rev}";
  unset __rev;
}
