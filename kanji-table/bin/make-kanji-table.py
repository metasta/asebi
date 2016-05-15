#!python3
import sys

def file2dict(filename):
	with open(filename) as f:
		d = dict([line.strip().split( maxsplit=1 ) for line in f])
	return d

u2cmap = file2dict(sys.argv[1])
m2gmap = file2dict(sys.argv[2])

error_counter = 0

d = {}
for line in sys.stdin:
	kanji, mj = line.strip().split( maxsplit=1 )
	if len(kanji) == 1:
		decimal = str(ord(kanji))
		if decimal in u2cmap and mj in m2gmap:
			cid = u2cmap[decimal]
			ginfo = m2gmap[mj]
			d[cid] = kanji + " " + ginfo
		else:
			sys.stderr.write(line.strip() + " <== error: uni " + decimal + " or mj " + mj + " not found\n")
			error_counter += 1
	else:
		sys.stderr.write(line.strip() + " <== error: len ne 1\n")
		error_counter += 1
	if error_counter > 10:
		sys.stderr.write("abored: too many errors\n")
		sys.exit(1)

for k, v in d.items():
	print(k + "\t" +  v)

if error_counter == 0:
	sys.exit(0)
else:
	sys.exit(1)
