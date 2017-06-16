# kanji-table.txt の作成。
#
# 	kanji-table.txt の各行は以下の情報を保持する。
#	CID	漢字	gname	lsb	tsb
#
#	CID と gname は table-CFF の kanji.map 作成に、
#	CID と l(t)sb は table-metrics の asebi_h(v)mtx.ttx 作成に使用する。

.PHONY: all
all: kanji-table.txt

kanji-table.txt: map/uni2cid.txt map/mj2gname-lsb-tsb.txt
	cat ../kyuji-map-*.txt \
	| sh bin/make-kanji-table.sh map/uni2cid.txt map/mj2gname-lsb-tsb.txt \
	> kanji-table.txt

map/uni2cid.txt: ../src/sammin.otf
	sh bin/uni2cid.sh ../src/sammin.otf \
	> map/uni2cid.txt

map/mj2gname-lsb-tsb.txt: map/tag2mj.txt map/tag2gname-lsb-tsb.txt
	join map/tag2mj.txt map/tag2gname-lsb-tsb.txt \
	| cut -d ' ' -f 2- \
	> map/mj2gname-lsb-tsb.txt

map/tag2mj.txt: ../src/ipamjm.ttf
	sh bin/tag2mj.sh ../src/ipamjm.ttf \
	> map/tag2mj.txt

map/tag2gname-lsb-tsb.txt: ../table-CFF/ipamjm.CFF
	sh bin/tag2gname-lsb-tsb.sh ../table-CFF/ipamjm.CFF \
	> map/tag2gname-lsb-tsb.txt

../table-CFF/ipamjm.CFF:
	cd ../table-CFF; $(MAKE) ipamjm.CFF

.PHONY: clean
clean:
	-rm -f kanji-table.txt map/uni2cid.txt map/mj2gname-lsb-tsb.txt \
		map/tag2mj.txt map/tag2gname-lsb-tsb.txt
