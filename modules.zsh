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
  java
  ruby
  node
  disk
  time
)
fi
