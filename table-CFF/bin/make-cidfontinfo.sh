#!/bin/sh -
#
# usage: make-cidfontinfo.sh path/to/fontinfo.txt > cidfontinfo
#
#       asebi.CFF の作成に必要な cidfontinfo ファイルを生成する。
#

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
  Version )
    version="$val"
    ;;
  Weight )
    weight="$val"
    ;;
  * )
    ;;
  esac
done < "$fontinfo"

cat <<__EOT__
FontName       (${psname}-${weight})
FullName       (${fontname} ${weight})
FamilyName     (${fontname})
Weight         (${weight})
version        ($version)
Registry       (Adobe)
Ordering       (Identity)
Supplement     0
AdobeCopyright ()
__EOT__
