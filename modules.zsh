#!/usr/bin/env zsh

if [[ -z "${MODULES}" ]]
then
MODULES=(
  git
  mercurial
  subversion
  ssh
  background_job
  python
  ruby
  node
  disk
  time
)
fi
