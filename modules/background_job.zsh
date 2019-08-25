#!/usr/bin/env zsh

plib_bg_count() {
  echo -n "$(jobs | grep -cv "pwd")"
}
