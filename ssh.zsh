#!/usr/bin/env zsh

plib_ssh_st(){
  [[ -n "$SSH_CLIENT" ]] && echo -n "[S]"
}
