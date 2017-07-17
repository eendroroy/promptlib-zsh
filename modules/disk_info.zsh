#!/usr/bin/env zsh

plib_p_name(){
  echo -ne "`df -h . | tail -1 | awk '{print $1}'`";
}

plib_p_size(){
  echo -ne "`df -h . | tail -1 | awk '{print $2}'`";
}

plib_p_used(){
  echo -ne "`df -h . | tail -1 | awk '{print $3}'`";
}

plib_p_avail(){
  echo -ne "`df -h . | tail -1 | awk '{print $4}'`";
}

plib_p_cap(){
  echo -ne "`df -h . | tail -1 | awk '{print $5}'`";
}
