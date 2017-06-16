#!/bin/sh -
# usage:
# cat ../kyuji_*.txt \
#	| make-kanji-table.sh uni2cid.txt mj2gname-lsb-tsb.txt
#

test -r "$1" || { echo "$1 not found" >&2; exit 1; } 
test -r "$2" || { echo "$2 not found" >&2; exit 1; } 

trap "rm -f $u_k_mj $u2c $sort_u_k_mj $m2g" EXIT

u_k_mj=$(mktemp)
sed -e 's/#.*$//g' -e 's:\s\s*:\t:g' -e '/^\s*$/d' \
	| perl -CIO -lane 'print ord($F[0])," $F[0] $F[1]"' \
	| sort > "$u_k_mj"

u2c=$(mktemp)
sort "$1" > "$u2c"
rem=$( join -v 1 "$u_k_mj" "$u2c" | head )
test "x$rem" == "x" || { echo "Error in following lines:\n\n$rem" >&2; exit 1; }

sort_u_k_mj=$(mktemp)
sort -k3,3 "$u_k_mj" > "$sort_u_k_mj"

m2g=$(mktemp)
sort "$2" > "$m2g"
rem=$( join -v 1 -1 3 -2 1 "$sort_u_k_mj" "$m2g" | head )
test "x$rem" == "x" || { echo "Error in following lines:\n\n$rem" >&2; exit 1; }

join "$u2c" "$u_k_mj" \
	| sort -k4,4 \
	| join -1 4 -2 1 - "$m2g" \
	| awk '{print $3, $4, $5, $6, $7}' \
	| sort -n \
	| tr ' ' '\t'
