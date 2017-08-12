#!/usr/bin/env zsh

plib_ruby_version(){
  which ruby > /dev/null && echo -ne `ruby -v | tr 'p' ' ' | awk '{print $2}' | tr -d ' \n'`;
}

plib_rbenv_version(){
  which ruby > /dev/null && echo -ne `rbenv version | awk '{print $1}' | tr -d ' \n'`;
}