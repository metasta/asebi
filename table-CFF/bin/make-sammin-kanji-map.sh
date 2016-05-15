#!/bin/awk -f
#
# usage: fdarray-check.pl sammin.otf | make-sammin-kanji-map.sh > sammin-kanji.map
#
# asebi.CFF の作成に必要な sammin-kanji.map の作成。

awk -F'[: ]' '/Kanji/{print $4}' \
	| sed -e 's:/::g' \
	| tr ',' '\n' \
	| awk -F'-' '{v=$1;print v;while(v<$2){v+=1;print v}}' \
	| sort -n \
	| awk 'BEGIN{print "mergeFonts SamMin-Kanji 1"}{print $0,$0}'
