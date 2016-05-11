#!/bin/sh -
# usage: make-subdb-gid2mj.sh ipamjm.ttf > subdb

ipamjm="$1"
test -r "$ipamjm" || { echo "$ipamjm not found" >&2; exit 1; }

spot -t post "$ipamjm" 2>/dev/null \
	| tail -n 1 \
	| tr ' ' '\n' \
	| awk -F'[<>]' '!/^$/{print NR" "$2}' \
	| sort
