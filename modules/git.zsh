#!/usr/bin/env zsh

plib_is_git(){
  if [[ $(\git branch 2>/dev/null) != "" ]]; then
    echo -n 1
  else
    echo -n 0
  fi
}

plib_git_branch(){
  ref=$(\git symbolic-ref HEAD 2> /dev/null) || ref="detached" || return;
  echo -n "${ref#refs/heads/}";
  unset ref;
}

plib_git_rev(){
  rev=$(\git rev-parse HEAD | cut -c 1-7);
  echo -n "${rev}";
  unset rev;
}

plib_git_dirty(){
  _mod=$(\git status --porcelain 2>/dev/null | grep 'M ' | wc -l | tr -d ' ');
  _add=$(\git status --porcelain 2>/dev/null | grep 'A ' | wc -l | tr -d ' ');
  _del=$(\git status --porcelain 2>/dev/null | grep 'D ' | wc -l | tr -d ' ');
  _new=$(\git status --porcelain 2>/dev/null | grep '?? ' | wc -l | tr -d ' ');
  [[ "$_mod" != "0" ]] && echo -n " ⭑";
  [[ "$_add" != "0" ]] && echo -n " +";
  [[ "$_del" != "0" ]] && echo -n " -";
  [[ "$_new" != "0" ]] && echo -n " ?";

  unset _mod _new _add _del
}

plib_git_left_right(){
  function _branch(){
    ref=$(\git symbolic-ref HEAD 2> /dev/null) || ref="detached" || return;
    echo -ne "${ref#refs/heads/}";
  }
  if [[ $(plib_git_branch) != "detached" ]]; then
    _pull=$(\git rev-list --left-right --count `_branch`...origin/`_branch` 2>/dev/null | awk '{print $2}' | tr -d ' \n');
    _push=$(\git rev-list --left-right --count `_branch`...origin/`_branch` 2>/dev/null | awk '{print $1}' | tr -d ' \n');
    [[ "$_pull" != "0" ]] && [[ "$_pull" != "" ]] && echo -n " ▼";
    [[ "$_push" != "0" ]] && [[ "$_push" != "" ]] && echo -n " ▲";

    unset _pull _push _branch
  fi
}