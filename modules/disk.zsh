#!/usr/bin/env zsh

plib_disk_name(){
  echo -ne "`df -h . | tail -1 | awk '{print $1}'`";
}

plib_disk_size(){
  echo -ne "`df -h . | tail -1 | awk '{print $2}'`";
}

plib_disk_used(){
  echo -ne "`df -h . | tail -1 | awk '{print $3}'`";
}

plib_disk_avail(){
  echo -ne "`df -h . | tail -1 | awk '{print $4}'`";
}

plib_disk_cap(){
  echo -ne "`df -h . | tail -1 | awk '{print $5}'`";
}
