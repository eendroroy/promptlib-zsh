#!/usr/bin/env zsh

plib_bg_count() {
  __jobc="`jobs | grep -v "pwd" | wc -l | tr -d ' '`";
  if [[ "$__jobc" != 0 ]]; then
    echo -ne "[$__jobc] "
  fi
  unset __jobc;
}
