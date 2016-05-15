# asebi.CFF (OpenType CFF テーブル) を作成する。

.PHONY: all
all: asebi.CFF

asebi.CFF: cidfontinfo kanji.map ipamjm.CFF otagi.map otagi.CFF sammin-kanji.map sammin.CFF
	mergeFonts -cid cidfontinfo xasebiU.CFF \
		kanji.map ipamjm.CFF \
		otagi.map otagi.CFF \
		sammin.CFF
	tx -cff xasebiU.CFF asebi.CFF 2>/dev/null

cidfontinfo: ../fontinfo.txt
	sh bin/make-cidfontinfo.sh ../fontinfo.txt > cidfontinfo

kanji.map: ../kanji-table/kanji-table.txt
	sh bin/make-kanji-map.sh ../kanji-table/kanji-table.txt > kanji.map

../kanji-table/kanji-table.txt:
	cd ../kanji-table && $(MAKE)

ipamjm.CFF: ../src/ipamjm.ttf
	tx -cff ../src/ipamjm.ttf xipamjm2048.CFF 2>/dev/null
	IS -cff -z2 xipamjm2048.CFF ipamjm.CFF 2>/dev/null

otagi.map: ../src/otagi.otf
	perl bin/fdarray-check.pl ../src/otagi.otf \
	| sh bin/make-otagi-map.sh \
	> otagi.map

otagi.CFF: ../src/otagi.otf
	tx -cff ../src/otagi.otf otagi.CFF 2>/dev/null

sammin-kanji.map: ../src/sammin.otf
	perl bin/fdarray-check.pl ../src/sammin.otf \
	| sh bin/make-sammin-kanji-map.sh \
	> sammin-kanji.map

sammin.CFF: ../src/sammin.otf
	tx -cff ../src/sammin.otf sammin.CFF 2>/dev/null

.PHONY: clean
clean:
	-rm -f cidfontinfo xasebiU.CFF asebi.CFF \
		kanji.map xipamjm2048.CFF ipamjm.CFF \
		otagi.map otagi.CFF sammin-kanji.map sammin.CFF
