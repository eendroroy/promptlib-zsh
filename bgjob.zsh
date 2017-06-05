#!/usr/bin/env zsh

plib_bg_count() {
  _jobc="`jobs | grep -v "pwd" | wc -l | tr -d ' '`";
  if [[ "$_jobc" != 0 ]]; then
    echo -ne "[$_jobc]%f "
  fi
  unset _jobc
}