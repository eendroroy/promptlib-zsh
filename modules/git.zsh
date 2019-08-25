#!/usr/bin/env zsh

plib_is_git(){
  if [[ $(\git rev-parse --git-dir 2>/dev/null) != "" ]]; then
    echo -n 1
  else
    echo -n 0
  fi
}

plib_git_is_bare(){
  if [[ $(\git rev-parse --is-bare-repository 2>/dev/null) == "true" ]]; then
    echo -n 1
  else
    echo -n 0
  fi
}

plib_git_branch(){
  __ref=$(\git symbolic-ref HEAD 2>/dev/null) || __ref="detached" || return
  echo -n "${__ref#refs/heads/}"
  unset __ref
}

# Gets the short SHA-1 of the current revision.
plib_git_rev(){
  git rev-parse HEAD 2>/dev/null | cut -c 1-7 | tr -d ' \n'
}

plib_git_remote_is_defined(){
  if [[ -n "$1" ]] && [[ "$(\git remote -v | grep -c "$1")" -gt 0 ]]; then
    echo -ne 1
  else
    echo -ne 0
  fi
}

plib_git_remote_name(){
  if \git remote -v | grep origin >/dev/null; then
    echo -ne "origin"
  else
    echo -ne "$(\git remote -v | head -1 | awk '{print $1}')"
  fi
}

# For everything related to git status parsing please refer to this documentation:
# https://git-scm.com/docs/git-status#_short_format

plib_git_status(){
  echo -n "$(\git status --porcelain 2>/dev/null)"
}

# Returns the number of staged file modifications.
# Takes a 'git status --porcelain 2' value as argument.
plib_git_staged_mod(){
  echo -n "$1" | grep -c '^M[A,M,D,R, ]\{1\} \|^R[A,M,D,R, ]\{1\} ' | tr -d ' '
}

# Returns the number of unstaged file modifications.
# Takes a 'git status --porcelain 2' value as argument.
plib_git_unstaged_mod(){
  echo -n "$1" | grep -c '^[A,M,D,R, ]\{1\}M \|^[A,M,D,R, ]\{1\}R ' | tr -d ' '
}

# Returns the number of staged file deletions.
# Takes a 'git status --porcelain 2' value as argument.
plib_git_staged_del(){
  echo -n "$1" | grep -c '^D[A,M,D,R, ]\{1\} ' | tr -d ' '
}

# Returns the number of unstaged file deletions.
# Takes a 'git status --porcelain 2' value as argument.
plib_git_unstaged_del(){
  echo -n "$1" | grep -c '^[A,M,D,R, ]\{1\}D ' | tr -d ' '
}

# Returns the number of staged new files.
# Takes a 'git status --porcelain 2' value as argument.
plib_git_staged_add(){
  echo -n "$1" | grep -c '^A[A,M,D,R, ]\{1\} ' | tr -d ' '
}

# Returns the number of unstaged new files.
# Takes a 'git status --porcelain 2' value as argument.
plib_git_unstaged_add(){
  echo -n "$1" | grep -c '^[A,M,D,R, ]\{1\}A ' | tr -d ' '
}

# Returns the number of unstaged untracked files.
# Takes a 'git status --porcelain 2' value as argument.
plib_git_status_new(){
  echo -n "$1" | grep -c '^?? ' | tr -d ' '
}

# This determines how many commit behind or ahead of the target branch the current revision is.
# https://git-scm.com/docs/git-rev-list#Documentation/git-rev-list.txt---left-right
#
# It takes a remote name and a remote branch name as argument.
# Directly returns the git rev-list --left-right value or an empty string if something went wrong.
plib_git_left_right(){
  __remote_name="$1"
  [[ -z "$__remote_name" ]] && __remote_name='origin'

  __local_branch_name=$(plib_git_branch)
  
  if [[ "$__local_branch_name" != "detached" ]]; then

    __remote_branch_name="$2"
    [[ -z "$__remote_branch_name" ]] && __remote_branch_name="$__local_branch_name"

    git rev-list --left-right --count \
      "refs/heads/${__local_branch_name}...refs/remotes/${__remote_name}/${__remote_branch_name}" \
      2>/dev/null || echo ''

    unset __remote_branch_name
  fi

  unset __remote_name __local_branch_name
}

plib_git_commit_since(){
  __sed_year='s| year\(s\)\{0,1\}|Y|g'
  __sed_month='s| month\(s\)\{0,1\}|Mo|g'
  __sed_week='s| week\(s\)\{0,1\}|W|g'
  __sed_day='s| day\(s\)\{0,1\}|D|g'
  __sed_hour='s| hour\(s\)\{0,1\}|H|g'
  __sed_minute='s| minute\(s\)\{0,1\}|Mi|g'
  __sed_second='s| second\(s\)\{0,1\}|S|g'
  __sedstr="${__sed_year};${__sed_month};${__sed_week};${__sed_day};${__sed_hour};${__sed_minute};${__sed_second}"
  __commit_since_raw=$(\git log -1 --format='%cr' 2>/dev/null || echo '-0t')
  __commit_since=$(echo "${__commit_since_raw}" | sed "${__sedstr}" | tr -d " ago\n")

  echo -ne "${__commit_since}"

  unset __commit_since __commit_since_raw __sedstr
  unset __sed_year __sed_month __sed_week __sed_day __sed_hour __sed_minute __sed_second
}

plib_is_git_rebasing(){
  if [[ -d "$(git rev-parse --git-path rebase-merge)" || -d "$(git rev-parse --git-path rebase-apply)" ]]; then
    echo -n 1
  else
    echo -n 0
  fi
}

plib_git_stash(){
  echo -n "$(\git stash list | wc -l | tr -d ' ')"
}
