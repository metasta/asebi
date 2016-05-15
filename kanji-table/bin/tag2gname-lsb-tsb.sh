#!/bin/sh -
# usage: tag2gname-lsb-tsb.sh path/to/ipamjm.CFF
#
# 	IPAmj明朝の tag(=gid), gname, lsb, tsb を表示。
#
#	重要な注意：「tsb = 880 - top」は
#		1000x1000 の等幅グリフでしか成立しない。
#

ipamjmCFF="$1"
test -r "$ipamjmCFF" || { echo "$ipamjmCFF not found" >&2; exit 1; }

tx -mtx "$1" 2>/dev/null \
	| awk 'BEGIN{FS="[][{},]"; OFS="\t"} NR != 1{print $2,$4,$8,(880 - $11)}' \
	| sort
