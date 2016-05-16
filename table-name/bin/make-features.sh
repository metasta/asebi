#!/bin/sh -
#
# usage: make-features.sh path/to/fontinfo.txt path/to/ipamjm.ttf > features
#
#       asebi.name の作成に必要な features ファイルを生成する。
#

fontinfo="$1"
ipamjmin="$2"

test -r "$fontinfo" || { echo "$fontinfo not found" >&2; exit 1; }
test -r "$ipamjmin" || { echo "$ipamjmin not found" >&2; exit 1; }

echo_ipacopyright()
{
  spot -t name=3 "$ipamjmin" \
    | grep 0000 \
    | awk -F'[<>]' '{print $2}' \
    | sed 's/"/\\0022/g'
}

IPACopyright=$(echo_ipacopyright)

while read key val
do
  case "$key" in
  Version )
    version="$val"
    ;;
  * )
    ;;
  esac
done < "$fontinfo"

cat <<__EOT__
table head {
  FontRevision ${version};
} head;
table name {
  nameid 0 "${IPACopyright}";
} name;
table OS/2 {
  Vendor "IPA ";
} OS/2;
__EOT__
