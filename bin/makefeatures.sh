#!/bin/sh -
basedir=$(cd $(dirname "$0"); dirname $(pwd))
ipafont="${basedir}/src/ipamjm.ttf"

test -r $ipafont || { echo "$ipafont not found" >&2; exit 1; }

echo_ipacopyright()
{
  spot -t name=3 "$ipafont" \
    | grep 0000 \
    | awk -F'[<>]' '{print $2}' \
    | sed 's/"/\\0022/g'
}

IPACopyright=$(echo_ipacopyright)

cat <<EOT
table name {
  nameid 0 "${IPACopyright}";
} name;
table OS/2 {
  Vendor "IPA ";
} OS/2;
EOT
