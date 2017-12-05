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
  [[ -z "${PLIB_GIT_ADD_SYM}" ]] && PLIB_GIT_ADD_SYM=+
  [[ -z "${PLIB_GIT_DEL_SYM}" ]] && PLIB_GIT_DEL_SYM=-
  [[ -z "${PLIB_GIT_MOD_SYM}" ]] && PLIB_GIT_MOD_SYM=⭑
  [[ -z "${PLIB_GIT_NEW_SYM}" ]] && PLIB_GIT_NEW_SYM=?
  __mod=$(\git status --porcelain 2>/dev/null | grep '^M[A,M,D,R, ]\{1\}\|^[A,M,D,R, ]\{1\}M\|^R[A,M,D,R, ]\{1\}\|^[A,M,D,R, ]\{1\}R' | wc -l | tr -d ' ');
  __add=$(\git status --porcelain 2>/dev/null | grep '^A[A,M,D,R, ]\{1\}\|^[A,M,D,R, ]\{1\}A' | wc -l | tr -d ' ');
  __del=$(\git status --porcelain 2>/dev/null | grep '^D[A,M,D,R, ]\{1\}\|^[A,M,D,R, ]\{1\}D' | wc -l | tr -d ' ');
  __new=$(\git status --porcelain 2>/dev/null | grep '^?? ' | wc -l | tr -d ' ');
  [[ "$__mod" != "0" ]] && echo -n " ${PLIB_GIT_MOD_SYM}";
  [[ "$__add" != "0" ]] && echo -n " ${PLIB_GIT_ADD_SYM}";
  [[ "$__del" != "0" ]] && echo -n " ${PLIB_GIT_DEL_SYM}";
  [[ "$__new" != "0" ]] && echo -n " ${PLIB_GIT_NEW_SYM}";

  unset __mod __new __add __del
}

plib_git_left_right(){
  [[ -z "${PLIB_GIT_PUSH_SYM}" ]] && PLIB_GIT_PUSH_SYM=↑
  [[ -z "${PLIB_GIT_PULL_SYM}" ]] && PLIB_GIT_PULL_SYM=↓
  if [[ "$(plib_git_remote_defined)" == 1 ]]; then
    function _branch(){
      __ref=$(\git symbolic-ref HEAD 2> /dev/null) || __ref="detached" || return;
      echo -ne "${__ref#refs/heads/}";
      unset __rev;
    }
    if [[ $(plib_git_branch) != "detached" ]]; then
      __pull=$(\git rev-list --left-right --count `_branch`...`plib_git_remote_name`/`_branch` 2>/dev/null | awk '{print $2}' | tr -d ' \n');
      __push=$(\git rev-list --left-right --count `_branch`...`plib_git_remote_name`/`_branch` 2>/dev/null | awk '{print $1}' | tr -d ' \n');
      [[ "$__pull" != "0" ]] && [[ "$__pull" != "" ]] && echo -n " ${__pull}${PLIB_GIT_PULL_SYM}";
      [[ "$__push" != "0" ]] && [[ "$__push" != "" ]] && echo -n " ${__push}${PLIB_GIT_PUSH_SYM}";

      unset __pull __push __branch
    fi
  fi
}

plib_git_commit_since(){
  __sedstr='s| year\(s\)\{0,1\}|Y|g;s| month\(s\)\{0,1\}|Mo|g;s| week\(s\)\{0,1\}|W|g;s| day\(s\)\{0,1\}|D|g;s| hour\(s\)\{0,1\}|H|g;s| minute\(s\)\{0,1\}|Mi|g;s| second\(s\)\{0,1\}|S|g'
  __commit_since=`git log -1 --format='%cr' | sed ${__sedstr} | tr -d " ago\n"`

  echo -ne "${__commit_since}"

  unset __commit_since __sedstr
}

plib_is_git_rebasing(){
  [[ $(ls `git rev-parse --git-dir` | grep rebase) ]] && echo -ne 1 || echo -ne 0
}
