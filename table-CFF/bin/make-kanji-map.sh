#!/bin/sh -
# usage: sh make-kanji-map.sh path/to/kanji-table.txt > kanji.map
#

kanjitable="$1"
test -r "$kanjitable" || { echo "$kanjitable not found" >&2; exit 1; }

echo "mergeFonts IPAmjMincho 1"
echo "0	.notdef"
awk '{print $1 "\t" $3}' "$kanjitable" | sort -n -k1,1
