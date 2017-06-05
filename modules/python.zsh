#!/usr/bin/env zsh

plib_venv(){
  if [[ -n "${VIRTUAL_ENV}" ]]; then
    __venv="(`basename \"$VIRTUAL_ENV\"`)"
    echo -n "${__venv}"
    unset __venv
  fi
}