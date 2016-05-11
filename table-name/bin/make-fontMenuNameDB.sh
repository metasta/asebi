#!/bin/sh -
#
# usage: make-fontMenuNameDB.sh path/to/fontinfo.txt > fontMenuNameDB
#
#	asebi.name の作成に必要な fontMenuNameDB ファイルを生成する。
#	実行に python3 が必要。

fontinfo="$1"
test -r "$fontinfo" || { echo "$fontinfo not found" >&2; exit 1; }

while read key val
do
  case "$key" in
  "#"* )
    ;;
  PSName )
    psname="$val"
    ;;
  FontName )
    fontname="$val"
    ;;
  FontNameJa )
    fontnameja="$val"
    ;;
  Weight )
    weight="$val"
    ;;
  * )
    ;;
  esac
done < "$fontinfo"

unic=$(python3 -c 'import sys; print("".join([hex(ord(x)) for x in sys.argv[1]]).replace("0x","\\"))' "$fontnameja")
sjis=$(python3 -c 'import sys; print("".join([hex(x) for x in sys.argv[1].encode("shift-jis")]).replace("0x","\\"))' "$fontnameja")

cat <<__EOT__
[${psname}-${weight}]
  f=${fontname}
  s=${weight}
  l=${fontname} ${weight}

  f=3,1,0x411,${unic}
  s=3,1,0x411,${weight}
  l=3,1,0x411,${unic} ${weight}

  f=1,1,11,${sjis}
  s=1,1,11,${weight}
  l=1,1,11,${sjis} ${weight}
__EOT__
