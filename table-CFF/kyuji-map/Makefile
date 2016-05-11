# sammin の cid と ipamjm のグリフ名とを対応させる kyuji.map の作成。

.PHONY:all
all:kyuji.map

kyuji.map: db-uni2cid.txt db-mj2glyph.txt
	cat ../../kyuji-map-*.txt \
	| python3 bin/make-kyuji-map.py db-uni2cid.txt db-mj2glyph.txt \
	> kyuji.map

db-uni2cid.txt: ../../src/sammin.otf
	sh bin/make-db-uni2cid.sh ../../src/sammin.otf \
	> db-uni2cid.txt

db-mj2glyph.txt: subdb-gid2mj.txt subdb-gid2glyph.txt
	join subdb-gid2mj.txt subdb-gid2glyph.txt \
	| sort -n -k1 \
	| cut -d' ' -f 2-3 \
	> db-mj2glyph.txt

subdb-gid2mj.txt: ../../src/ipamjm.ttf
	sh bin/make-subdb-gid2mj.sh ../../src/ipamjm.ttf \
	> subdb-gid2mj.txt

subdb-gid2glyph.txt: ../../src/ipamjm.ttf
	perl ../bin/glyph-list.pl ../../src/ipamjm.ttf \
	| sh bin/make-subdb-gid2glyph.sh \
	> subdb-gid2glyph.txt 

clean:
	-rm -f kyuji.map db-uni2cid.txt db-mj2glyph.txt \
		subdb-gid2mj.txt subdb-gid2glyph.txt
