#!/bin/sh -
basedir=$(cd $(dirname "$0"); dirname $(pwd))
ipamjm="${basedir}/src/ipamjm.ttf"

spot -t post "$ipamjm" 2>/dev/null \
  | tail -n 1 | tr ' ' '\n' \
  | awk -F'[<>]' '!/^$/{print NR" "$2}' \
  | sort
