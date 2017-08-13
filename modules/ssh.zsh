#!/usr/bin/env zsh

plib_ssh_st(){
  [[ -n "$SSH_CLIENT" ]] && echo -n "[S]"
}

plib_ssh_client_ip(){
  [[ -n "$SSH_CLIENT" ]] && echo -n `echo $SSH_CLIENT | awk '{print $1}'`
}

plib_ssh_client_port(){
  [[ -n "$SSH_CLIENT" ]] && echo -n `echo $SSH_CLIENT | awk '{print $3}'`
}
