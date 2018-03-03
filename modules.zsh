#!/usr/bin/env zsh

if [[ -z "${MODULES}" ]]
then
MODULES=(
  background_job
  crystal
  disk
  elixir
  git
  go
  java
  mercurial
  node
  python
  ruby
  ssh
  subversion
  time
)
fi
