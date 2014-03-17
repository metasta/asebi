#!/bin/sh -

case "$1" in
  Regular | Bold )
    weight="$1"
    ;;
  * )
    echo "usage: $0 [ Regular | Bold ]" >&2;
    exit 1
    ;;
esac

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
  * )
    ;;
  esac
done

cat <<EOT
FontName       (${psname}-${weight})
FullName       (${fontname} ${weight})
FamilyName     (${fontname})
Weight         (${weight})
version        ($version)
Registry       (Adobe)
Ordering       (Japan1)
Supplement     6
AdobeCopyright ()
EOT
