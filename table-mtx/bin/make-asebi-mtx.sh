#!/bin/sh -
# usage:
#	sh make-asebi-mtx.sh asebi_hmtx.txt otagi_hmtx.ttx > asebi_hmtx.ttx
#	sh make-asebi-mtx.sh asebi_vmtx.txt otagi_vmtx.ttx > asebi_vmtx.ttx

asebitxt="$1"
test -r "$asebitxt" || { echo "$asebitxt not found" >&2; exit 1; }
otagittx="$2"
test -r "$otagittx" || { echo "$otagittx not found" >&2; exit 1; }

if head -n 4 "$otagittx" | grep 'hmtx' > /dev/null
then
	p="width"
	q="lsb"
elif head -n 4 "$otagittx" | grep 'vmtx' > /dev/null
then
	p="height"
	q="tsb"
else
	echo "error: cannot recognize hmtx or vmtx" >&2
	exit 1
fi

head -n 4 "$otagittx"
awk  -v "p=$p" -v "q=$q" '{print "    <mtx name=\042"$1"\042 "p"=\042"$2"\042 "q"=\042"$3"\042/>"}' "$asebitxt"
tail -n 3 "$otagittx"
