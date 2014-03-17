REGULAR=AsebiMin-Regular
#BOLD=AsebiMin-Bold

.PHONY: all
#all: $(REGULAR).otf $(BOLD).otf
all: $(REGULAR).otf

.PHONY: regular
regular: $(REGULAR).otf

#.PHONY: bold
#bold: $(BOLD).otf

$(REGULAR).otf: _regular.cff _regular.name src/sammin.otf
	cp src/sammin.otf $(REGULAR).otf
	sh bin/sfntedit.sh -a CFF=_regular.cff,name=_regular.name $(REGULAR).otf

#$(BOLD).otf: _bold.cff _bold.name src/sammin.otf
#	cp src/sammin.otf $(BOLD).otf
#	sh bin/sfntedit.sh -a CFF=_bold.cff,name=_bold.name $(BOLD).otf

_regular.cff: _regular.info _min.map _sammin.cff _kanji.map _ipamjm.cff nishiki1.222.map _nishiki.cff
	mergeFonts -cid _regular.info _uregular.cff \
	_min.map _sammin.cff \
	_kanji.map _ipamjm.cff \
	nishiki1.222.map _nishiki.cff \
	_sammin.cff
	tx -cff _uregular.cff _regular.cff

#_bold.cff: _bold.info _min.map _sammin.cff _kanji.map _ipamjm.cff nishiki1.222.map _nishiki.cff
#	mergeFonts -cid _bold.info _ubold.cff \
#	_min.map _sammin.cff \
#	_kanji.map _ipamjm.cff \
#	nishiki1.222.map _nishiki.cff \
#	_sammin.cff
#	tx -cff _ubold.cff _bold.cff

_regular.info: src/fontinfo.txt
	sh bin/makecidfontinfo.sh Regular < src/fontinfo.txt > _regular.info

#_bold.info: src/fontinfo.txt
#	sh bin/makecidfontinfo.sh Bold < src/fontinfo.txt > _bold.info

_regular.name: _regular.otf
	sh bin/sfntedit.sh -x name _regular.otf

_regular.otf: _regular.cff _features fontMenuNameDB
	sh bin/makeotf.sh -f _regular.cff -ff _features -mf fontMenuNameDB -o _regular.otf

#_bold.name: _bold.otf
#	sh bin/sfntedit.sh -x name _bold.otf

#_bold.otf: _bold.cff _features fontMenuNameDB
#	sh bin/makeotf.sh -b -f _bold.cff -ff _features -mf fontMenuNameDB -o _bold.otf

_min.map:
	echo "mergeFonts\n0\t.notdef" > _min.map

#nishiki.map:
#	TODO

_kanji.map: _uni2cid.dat _mj2glyph.dat src/ipamjm.txt
	ruby bin/makekanjimap.rb _uni2cid.dat _mj2glyph.dat < src/ipamjm.txt > _kanji.map

_uni2cid.dat: src/sammin.otf
	sh bin/cmap.sh src/sammin.otf > _uni2cid.dat

_mj2glyph.dat: _gid2mj.dat _gid2glyph.dat
	join _gid2mj.dat _gid2glyph.dat | sort -n -k1 | cut -d' ' -f 2-3 > _mj2glyph.dat

_gid2mj.dat: src/ipamjm.ttf
	sh bin/makemap-gid2mj.sh > _gid2mj.dat

_gid2glyph.dat: src/ipamjm.ttf
	sh bin/makemap-gid2glyph.sh > _gid2glyph.dat

_sammin.cff: src/sammin.otf
	tx -cff src/sammin.otf _sammin.cff

_nishiki.cff: src/nishiki.otf
	tx -cff src/nishiki.otf _nishiki.cff

_ipamjm.cff: src/ipamjm.ttf
	tx -cff src/ipamjm.ttf _ipamjm2048.cff
	IS -cff _ipamjm2048.cff _ipamjm.cff

_features: src/ipamjm.ttf
	sh bin/makefeatures.sh > _features

#fontMenuNameDB: src/fontinfo.txt
#	sh bin/makefontMenuNameDB.sh < src/fontinfo.txt > fontMenuNameDB
#	TODO

.PHONY: clean
clean:
	rm -f _features _gid2glyph.dat _gid2mj.dat _ipamjm.cff _ipamjm2048.cff _kanji.map _min.map _mj2glyph.dat _nishiki.cff _regular.cff _regular.info _regular.name _regular.otf _sammin.cff _uni2cid.dat _uregular.cff current.fpr $(REGULAR).otf
