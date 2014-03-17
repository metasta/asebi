#!/bin/sh -
basedir=$(cd $(dirname "$0"); dirname $(pwd))
ipamjm="${basedir}/src/ipamjm.ttf"

tx -pdf "$ipamjm" 2>/dev/null \
  | awk -F'[),(]' \
    'NR>60&&/\(/{if($0~/^\([0-9]+\)\047$/){print ""}else{printf $2" "}}' \
  | sort
