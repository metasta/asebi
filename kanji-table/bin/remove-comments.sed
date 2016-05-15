#!/bin/sed -f
s/#.*$//g
s:\s\s*:\t:g
/^\s*$/d
