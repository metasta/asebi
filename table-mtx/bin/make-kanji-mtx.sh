#!/bin/sh -
# usage:
#	sh make-kanji-mtx.sh h path/to/kanji-table.txt > kanji_hmtx.txt
#	sh make-kanji-mtx.sh v path/to/kanji-table.txt > kanji_vmtx.txt



kanjitable="$2"
test -r "$kanjitable" || { echo "$kanjitable not found" >&2; exit 1; }

case "$1" in
h )
	awk '{printf "cid%05d 1000 %s\n", $1, $4}' "$kanjitable" | sort
	;;
v )
	awk '{printf "cid%05d 1000 %s\n", $1, $5}' "$kanjitable" | sort
	;;
* )
	echo "usage: $0 [h|v] path/to/kanji-table.txt" >&2
	exit 1
	;;
esac
