#!/usr/bin/env zsh

plib_is_hg(){
  if [[ $(hg branch 2>/dev/null) != "" ]]; then
    echo -n 1
  else
    echo -n 0
  fi
}

plib_hg_branch(){
  __ref=$(hg branch 2> /dev/null) || return;
  echo -ne "${__ref}";
  unset __ref;
}

plib_hg_rev(){
  __rev=$(hg identify --num 2>/dev/null | tr -d " +") || return;
  echo -ne "${__rev}";
  unset __rev;
}
