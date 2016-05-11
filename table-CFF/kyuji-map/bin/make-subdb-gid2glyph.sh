#!/bin/sh -
# usage: glyph-list.py ipamjm.ttf | make-subdb-gid2glyph.sh > subdb

awk '{printf("%d %s \n", NR-1, $0)}' | sort
