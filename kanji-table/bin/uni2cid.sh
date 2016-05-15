#!/bin/sh -
# usage: sh uni2cid.sh sammin.otf
#
#	unicode から cid へのマッピング即ち cmap。

sammin="$1"
test -r "$sammin" || { echo "$sammin not found" >&2; exit 1; }

spot -t cmap "$sammin" \
	| tail -n 1 \
	| tr ' ' '\n' \
	| awk -F'[{},]' '!/^$/{s=$2;g=$4;while(s<=$3){print s" "g;s+=1;g+=1;}}'
