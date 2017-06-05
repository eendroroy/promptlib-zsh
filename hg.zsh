#!/usr/bin/env zsh


plib_is_hg(){
  if [[ $(hg branch 2>/dev/null) != "" ]]; then
    echo 1
  else
    echo 0
  fi
}

plib_hg_branch(){
  ref=$(hg branch 2> /dev/null) || return;
  echo -n "${ref}";
  unset ref;
}

plib_hg_rev(){
  rev=$(hg identify --num | tr -d " +") || return;
  echo -n "${rev}";
  unset rev;
}
