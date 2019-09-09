#!/usr/bin/env zsh

if [[ -z "${MODULES}" ]]
then
MODULES=(
  background_job
  crystal
  disk
  docker
  elixir
  git
  go
  java
  mercurial
  mysqld
  node
  php
  python
  ruby
  ssh
  subversion
  time
  vagrant
)
fi
