#!/bin/sh -
#
# usage: make-fontMenuNameDB.sh path/to/fontinfo.txt > fontMenuNameDB
#
#	asebi.name の作成に必要な fontMenuNameDB ファイルを生成する。

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

unic=$(printf "$fontnameja" | perl -ne 'use Encode;foreach(split(//,decode_utf8($_))){printf"\\%x",ord($_)}')
macj=$(printf "$fontnameja" | perl -ne 'use Encode;foreach(split(//,encode("MacJapanese",decode_utf8($_)))){printf"\\%x",ord($_)}')

cat <<__EOT__
[${psname}-${weight}]
  f=${fontname}
  s=${weight}
  l=${fontname} ${weight}

  f=3,1,0x411,${unic}
  s=3,1,0x411,${weight}
  l=3,1,0x411,${unic} ${weight}

  f=1,1,11,${macj}
  s=1,1,11,${weight}
  l=1,1,11,${macj} ${weight}
__EOT__
