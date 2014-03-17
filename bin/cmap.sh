#!/bin/sh
test -r "$1" || { echo "usage: $0 font.otf"; exit 1; }

spot -t cmap "$1" \
  | tail -n 1 \
  | tr ' ' '\n' \
  | awk -F'[{},]' '!/^$/{s=$2;g=$4;while(s<=$3){print s" "g;s+=1;g+=1;}}' 
