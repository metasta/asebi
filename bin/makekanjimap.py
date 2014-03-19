#!python3
import sys

def file2dict(filename):
	with open(filename) as f:
		d = dict([line.split() for line in f])
	return d

u2cmap = file2dict(sys.argv[1])
m2gmap = file2dict(sys.argv[2])

status = 0

d = {}
for line in sys.stdin:
	if line.startswith('#'):
		pass
	else:
		kanji, mj = line.strip().split(None, 1)
		if kanji.startswith('U+'):
			pass  # cannot interpret 'U+xxxx' form yet
		elif len(kanji) == 1:
			cid = u2cmap[str(ord(kanji))]
			glyph = m2gmap[mj]
			d[cid] = glyph
		else:
			sys.stderr.write(kanji + mj + " < error")
			status = 1

print("mergeFonts")
for k, v in sorted(d.items(), key=lambda x:int(x[0])):
	print(k + "\t" +  v)

sys.exit(status)
