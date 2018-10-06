#!/usr/bin/env zsh

plib_is_git(){
  if [[ $(\git rev-parse --git-dir 2> /dev/null) != "" ]]; then
    echo -n 1
  else
    echo -n 0
  fi
}

plib_git_branch(){
  __ref=$(\git symbolic-ref HEAD 2> /dev/null) || __ref="detached" || return
  echo -n "${__ref#refs/heads/}"
  unset __ref
}

plib_git_rev(){
  __rev=$(\git rev-parse HEAD | cut -c 1-7)
  echo -n "${__rev}"
  unset __rev
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

  [[ -z "${PLIB_GIT_TRACKED_COLOR}" ]] && PLIB_GIT_TRACKED_COLOR=green
  [[ -z "${PLIB_GIT_UNTRACKED_COLOR}" ]] && PLIB_GIT_UNTRACKED_COLOR=red

  [[ -z "${PLIB_GIT_ADD_SYM}" ]] && PLIB_GIT_ADD_SYM=+
  [[ -z "${PLIB_GIT_DEL_SYM}" ]] && PLIB_GIT_DEL_SYM=-
  [[ -z "${PLIB_GIT_MOD_SYM}" ]] && PLIB_GIT_MOD_SYM=⭑
  [[ -z "${PLIB_GIT_NEW_SYM}" ]] && PLIB_GIT_NEW_SYM=?
  
  __git_st=$(\git status --porcelain 2>/dev/null)
  
  __mod_t=$(echo ${__git_st} | grep '^M[A,M,D,R, ]\{1\} \|^R[A,M,D,R, ]\{1\} ' | wc -l | tr -d ' ')
  __add_t=$(echo ${__git_st} | grep '^A[A,M,D,R, ]\{1\} ' | wc -l | tr -d ' ')
  __del_t=$(echo ${__git_st} | grep '^D[A,M,D,R, ]\{1\} ' | wc -l | tr -d ' ')
  
  __mod_ut=$(echo ${__git_st} | grep '^[A,M,D,R, ]\{1\}M \|^[A,M,D,R, ]\{1\}R ' | wc -l | tr -d ' ')
  __add_ut=$(echo ${__git_st} | grep '^[A,M,D,R, ]\{1\}A ' | wc -l | tr -d ' ')
  __del_ut=$(echo ${__git_st} | grep '^[A,M,D,R, ]\{1\}D ' | wc -l | tr -d ' ')
  
  __new=$(echo ${__git_st} | grep '^?? ' | wc -l | tr -d ' ')

  [[ "$__add_t" != "0" ]]  && echo -n " %F{$PLIB_GIT_TRACKED_COLOR}${PLIB_GIT_ADD_SYM}%f"
  [[ "$__add_ut" != "0" ]] && echo -n " %F{$PLIB_GIT_UNTRACKED_COLOR}${PLIB_GIT_ADD_SYM}%f"
  [[ "$__mod_t" != "0" ]]  && echo -n " %F{$PLIB_GIT_TRACKED_COLOR}${PLIB_GIT_MOD_SYM}%f"
  [[ "$__mod_ut" != "0" ]] && echo -n " %F{$PLIB_GIT_UNTRACKED_COLOR}${PLIB_GIT_MOD_SYM}%f"
  [[ "$__del_t" != "0" ]]  && echo -n " %F{$PLIB_GIT_TRACKED_COLOR}${PLIB_GIT_DEL_SYM}%f"
  [[ "$__del_ut" != "0" ]] && echo -n " %F{$PLIB_GIT_UNTRACKED_COLOR}${PLIB_GIT_DEL_SYM}%f"
  [[ "$__new" != "0" ]]    && echo -n " %F{$PLIB_GIT_UNTRACKED_COLOR}${PLIB_GIT_NEW_SYM}%f"

  unset __mod_ut __new_ut __add_ut __mod_t __new_t __add_t __del
}

plib_git_left_right(){
  [[ -z "${PLIB_GIT_PUSH_SYM}" ]] && PLIB_GIT_PUSH_SYM=↑
  [[ -z "${PLIB_GIT_PULL_SYM}" ]] && PLIB_GIT_PULL_SYM=↓
  if [[ "$(plib_git_remote_defined)" == 1 ]]; then
    function _branch(){
      __ref=$(\git symbolic-ref HEAD 2> /dev/null) || __ref="detached" || return
      echo -ne "${__ref#refs/heads/}"
      unset __rev
    }
    if [[ $(plib_git_branch) != "detached" ]]; then
      __pp_stat=$(\git rev-list --left-right --count `_branch`...`plib_git_remote_name`/`_branch` 2>/dev/null)
      __pull=$(echo ${__pp_stat} | awk '{print $2}' | tr -d ' \n')
      __push=$(echo ${__pp_stat} | awk '{print $1}' | tr -d ' \n')
      [[ "$__pull" != "0" ]] && [[ "$__pull" != "" ]] && echo -n " ${__pull}${PLIB_GIT_PULL_SYM}"
      [[ "$__push" != "0" ]] && [[ "$__push" != "" ]] && echo -n " ${__push}${PLIB_GIT_PUSH_SYM}"

      unset __pp_stat __pull __push __branch
    fi
  fi
}

plib_git_commit_since(){
  __sedstr='s| year\(s\)\{0,1\}|Y|g;s| month\(s\)\{0,1\}|Mo|g;s| week\(s\)\{0,1\}|W|g;s| day\(s\)\{0,1\}|D|g;s| hour\(s\)\{0,1\}|H|g;s| minute\(s\)\{0,1\}|Mi|g;s| second\(s\)\{0,1\}|S|g'
  __commit_since=`\git log -1 --format='%cr' | sed ${__sedstr} | tr -d " ago\n"`

  echo -ne "${__commit_since}"

  unset __commit_since __sedstr
}

plib_is_git_rebasing(){
  [[ $(ls `\git rev-parse --git-dir` | grep rebase-apply) ]] && echo -ne 1 || echo -ne 0
}
