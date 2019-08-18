#!/usr/bin/env zsh

plib_bg_count() {
  jobs | grep -v "pwd" | wc -l | tr -d ' \n'
}
