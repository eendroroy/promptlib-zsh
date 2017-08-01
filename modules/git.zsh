#!/usr/bin/env zsh

plib_is_git(){
  if [[ $(\git branch 2>/dev/null) != "" ]]; then
    echo -n 1
  else
    echo -n 0
  fi
}

plib_git_branch(){
  __ref=$(\git symbolic-ref HEAD 2> /dev/null) || __ref="detached" || return;
  echo -n "${__ref#refs/heads/}";
  unset __ref;
}

plib_git_rev(){
  __rev=$(\git rev-parse HEAD | cut -c 1-7);
  echo -n "${__rev}";
  unset __rev;
}

plib_git_remote_defined(){
  if [ ! -z "`\git remote -v | head -1 | awk '{print $1}' | tr -d ' \n'`" ]; then
    echo -ne 1
  else
    echo -ne 0
  fi
}

plib_git_remote_name(){
  if \git remote -v | grep origin > /dev/null; then
    echo -ne "origin"
  else
    echo -ne "`\git remote -v | head -1 | awk '{print $1}' | tr -d " \n"`"
  fi
}

plib_git_dirty(){
  __mod=$(\git status --porcelain 2>/dev/null | grep '^M \|^ M\|^R \|^ R' | wc -l | tr -d ' ');
  __add=$(\git status --porcelain 2>/dev/null | grep '^A \|^ A' | wc -l | tr -d ' ');
  __del=$(\git status --porcelain 2>/dev/null | grep '^D \|^ D' | wc -l | tr -d ' ');
  __new=$(\git status --porcelain 2>/dev/null | grep '^?? ' | wc -l | tr -d ' ');
  [[ "$__mod" != "0" ]] && echo -n " ⭑";
  [[ "$__add" != "0" ]] && echo -n " +";
  [[ "$__del" != "0" ]] && echo -n " -";
  [[ "$__new" != "0" ]] && echo -n " ?";

  unset __mod __new __add __del
}

plib_git_left_right(){
  if [[ "$(plib_git_remote_defined)" == 1 ]]; then
    function _branch(){
      __ref=$(\git symbolic-ref HEAD 2> /dev/null) || __ref="detached" || return;
      echo -ne "${__ref#refs/heads/}";
      unset __rev;
    }
    if [[ $(plib_git_branch) != "detached" ]]; then
      __pull=$(\git rev-list --left-right --count `_branch`...`plib_git_remote_name`/`_branch` 2>/dev/null | awk '{print $2}' | tr -d ' \n');
      __push=$(\git rev-list --left-right --count `_branch`...`plib_git_remote_name`/`_branch` 2>/dev/null | awk '{print $1}' | tr -d ' \n');
      [[ "$__pull" != "0" ]] && [[ "$__pull" != "" ]] && echo -n " ▼";
      [[ "$__push" != "0" ]] && [[ "$__push" != "" ]] && echo -n " ▲";

      unset __pull __push __branch
    fi
  fi
}

plib_git_commit_since(){
  __sedstr='s| year\(s\)\{0,1\}|Y|g;s| month\(s\)\{0,1\}|M|g;s| week\(s\)\{0,1\}|W|g;s| day\(s\)\{0,1\}|D|g;s| hour\(s\)\{0,1\}|H|g;s| minute\(s\)\{0,1\}|Mi|g;s| second\(s\)\{0,1\}|S|g'
  __commit_since=`git log -1 --format='%cr' | sed ${__sedstr} | tr -d " ago\n"`

  echo -ne "${__commit_since}"

  unset __commit_since __sedstr
}
