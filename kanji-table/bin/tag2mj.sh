#!/bin/sh -
# usage: tag2mj.sh ipamjm.ttf

ipamjm="$1"
test -r "$ipamjm" || { echo "$ipamjm not found" >&2; exit 1; }

spot -t post "$ipamjm" 2>/dev/null \
	| tail -n 1 \
	| tr ' ' '\n' \
	| awk -F'[<>]' '!/^$/{print NR"\t"$2}' \
	| sort
