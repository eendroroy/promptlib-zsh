#!/usr/bin/env zsh

if [[ ! -v MODULES ]]
then
MODULES=(
  git
  mercurial
  subversion
  ssh
  background_job
  python
)
fi