#!/bin/sh -
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
  * )
    ;;
  esac
done

unic=$(python3 -c 'import sys; print("".join([hex(ord(x)) for x in sys.argv[1]]).replace("0x","\\"))' "$fontnameja")
sjis=$(python3 -c 'import sys; print("".join([hex(x) for x in sys.argv[1].encode("shift-jis")]).replace("0x","\\"))' "$fontnameja")

cat <<EOT
[${psname}-Regular]
  f=${fontname}
  s=Regular

  f=3,1,0x411,${unic}
  s=3,1,0x411,Regular

  f=1,1,11,${sjis}
  s=1,1,11,Regular

[${psname}-Bold]
  f=${fontname}
  s=Bold

  f=3,1,0x411,${unic}
  s=3,1,0x411,Bold

  f=1,1,11,${sjis}
  s=1,1,11,Bold
EOT
