# asebi.name (OpenType name テーブル) を作成する。
# そのために、遠回りだが
# makeotf で一度 otf ファイルを作成し、そこから name テーブルだけを抽出する。
# この makeotf に必要な下準備が意外に多くて手間がかかる。

.PHONY: all
all: asebi.name

asebi.name: asebiname.CFF features fontMenuNameDB
	makeotf -r -nS -f asebiname.CFF -ff features -mf fontMenuNameDB -o asebi.otf
	-sfntedit -x name asebi.otf

asebiname.CFF: ../fontinfo.txt ../src/otagi.otf
	sh bin/make-cidfontinfo-aj10.sh ../fontinfo.txt > cidfontinfo-aj10
	tx -cff ../src/otagi.otf otagi.CFF 2>/dev/null
	mergeFonts -cid cidfontinfo-aj10 asebiname.CFF otagi.CFF

features: ../fontinfo.txt ../src/ipamjm.ttf
	sh bin/make-features.sh ../fontinfo.txt ../src/ipamjm.ttf > features

fontMenuNameDB: ../fontinfo.txt
	sh bin/make-fontMenuNameDB.sh ../fontinfo.txt > fontMenuNameDB

clean:
	-rm -f asebi.name asebi.otf asebiname.CFF asebiname.CFF.tmp \
	current.fpr cidfontinfo-aj10 features fontMenuNameDB otagi.CFF 
