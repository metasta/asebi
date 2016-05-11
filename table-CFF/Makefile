# asebi.CFF (OpenType CFF テーブル) を作成する。

.PHONY: all
all: asebi.CFF

asebi.CFF: cidfontinfo kyuji.map ipamjm.CFF otagi.map otagi.CFF sammin.CFF
	mergeFonts -cid cidfontinfo xasebiU.CFF \
		kyuji.map ipamjm.CFF \
		otagi.map otagi.CFF \
		sammin.CFF
	tx -cff xasebiU.CFF asebi.CFF 2>/dev/null

cidfontinfo: ../fontinfo.txt
	sh bin/make-cidfontinfo.sh ../fontinfo.txt > cidfontinfo

kyuji.map:
	cd kyuji-map && $(MAKE)
	cp kyuji-map/kyuji.map .

ipamjm.CFF: ../src/ipamjm.ttf
	tx -cff ../src/ipamjm.ttf xipamjm2048.CFF 2>/dev/null
	IS -cff -z2 xipamjm2048.CFF ipamjm.CFF 2>/dev/null

otagi.map: ../src/otagi.otf
	perl bin/fdarray-check.pl ../src/otagi.otf \
	| sh bin/make-otagi-map.sh \
	> otagi.map

otagi.CFF: ../src/otagi.otf
	tx -cff ../src/otagi.otf otagi.CFF 2>/dev/null

sammin.CFF: ../src/sammin.otf
	tx -cff ../src/sammin.otf sammin.CFF 2>/dev/null

clean:
	-rm -f cidfontinfo xasebiU.CFF asebi.CFF kyuji.map xipamjm2048.CFF ipamjm.CFF otagi.map otagi.CFF sammin.CFF
	cd kyuji-map && $(MAKE) clean
