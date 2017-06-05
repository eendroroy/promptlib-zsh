#!/usr/bin/env zsh


plib_is_hg(){
  if [[ $(hg branch 2>/dev/null) != "" ]]; then
    echo -n 1
  else
    echo -n 0
  fi
}

plib_hg_branch(){
  ref=$(hg branch 2> /dev/null) || return;
  echo -ne "${ref}";
  unset ref;
}

plib_hg_rev(){
  rev=$(hg identify --num 2>/dev/null | tr -d " +") || return;
  echo -ne "${rev}";
  unset rev;
}
