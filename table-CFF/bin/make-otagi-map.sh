#!/bin/awk -f
#
# usage: fdarray-check.pl otagi.otf | make-otagi-map.sh > otagi.map
#
# asebi.CFF の作成に必要な otagi.map の作成。
# /23058(や行え)と /23059(ア行エ)を交換しておく。
# sammin の cmap と一致させるため。
#
# ちなみに otagi 0.603 と sammin 1.001 の cmap はほとんど同じであり、
# えとエの他には
#
#   175 (U+00AF) MACRON (アンダースコアの逆、オーバースコア) の幅
#  8216 (U+2018) 開始シングルクォート の幅
#  8217 (U+2019) 終了シングルクォート の幅
#  8220 (U+201C) 開始ダブルクォート の幅
#  8221 (U+201D) 終了ダブルクォート の幅
# 漢字 交、分、文、月、校、父 のデザイン差
#
# 以外は同じだった(以下のコマンドで確認できる)。
# これらのグリフのための修正は不要と判断した。
#
# cmap 差分確認用コマンド
# % sh cmap.sh sammin.otf | sort > sammin.cmap 
# % sh cmap.sh otagi.otf | sort > otagi.cmap 
# % join sammin.cmap otagi.cmap | while read cid codesam codeota
# do
# if [ "x$codesam" != "x$codeota" ] 
# then
# echo "$cid      $codesam        $codeota"
# fi
# done
#

awk -F'[: ]' '!/Detected/ && !/Generic/ && !/Mana/{print $4}' \
	| sed -e 's:/::g' \
	| tr ',' '\n' \
	| awk -F'-' '{v=$1;print v;while(v<$2){v+=1;print v}}' \
	| sort -n \
	| awk 'BEGIN{print "mergeFonts"} \
		{
			     if($0 == 23058){print $0,23059}
			else if($0 == 23059){print $0,23058}
			else                {print $0,$0}
		}'
