.PHONY: all
all: asebi_hmtx.ttx asebi_vmtx.ttx

asebi_hmtx.ttx: hmtx/asebi.txt hmtx/otagi.ttx
	sh bin/make-asebi-mtx.sh hmtx/asebi.txt hmtx/otagi.ttx \
	> asebi_hmtx.ttx

asebi_vmtx.ttx: vmtx/asebi.txt vmtx/otagi.ttx
	sh bin/make-asebi-mtx.sh vmtx/asebi.txt vmtx/otagi.ttx \
	> asebi_vmtx.ttx

hmtx/asebi.txt: hmtx/kanji.txt hmtx/sammin-kanji.txt hmtx/otagi.txt
	join -a 1 -a 2 hmtx/kanji.txt hmtx/sammin-kanji.txt \
	| join -a 1 -a 2 - hmtx/otagi.txt \
	| cut -d ' ' -f 1-3 \
	| sort \
	> hmtx/asebi.txt

vmtx/asebi.txt: vmtx/kanji.txt vmtx/sammin-kanji.txt vmtx/otagi.txt
	join -a 1 -a 2 vmtx/kanji.txt vmtx/sammin-kanji.txt \
	| join -a 1 -a 2 - vmtx/otagi.txt \
	| cut -d ' ' -f 1-3 \
	| sort \
	> vmtx/asebi.txt

hmtx/sammin-kanji.txt: hmtx/sammin.txt ../table-CFF/sammin-kanji.map
	awk '{printf "cid%05d\n", $$1}' ../table-CFF/sammin-kanji.map \
	| join - hmtx/sammin.txt \
	> hmtx/sammin-kanji.txt

vmtx/sammin-kanji.txt: vmtx/sammin.txt ../table-CFF/sammin-kanji.map
	awk '{printf "cid%05d\n", $$1}' ../table-CFF/sammin-kanji.map \
	| join - vmtx/sammin.txt \
	> vmtx/sammin-kanji.txt

../table-CFF/sammin-kanji.map:
	cd ../table-CFF; $(MAKE) sammin-kanji.map

hmtx/sammin.txt: ../src/sammin.otf
	ttx -t hmtx -o - ../src/sammin.otf \
	| awk -F'"' '/<mtx /{print $$2,$$4,$$6}' \
	> hmtx/sammin.txt

vmtx/sammin.txt: ../src/sammin.otf
	ttx -t vmtx -o - ../src/sammin.otf \
	| awk -F'"' '/<mtx /{print $$2,$$4,$$6}' \
	> vmtx/sammin.txt

hmtx/otagi.txt: hmtx/otagi.ttx
	awk -F'"' '/<mtx /{print $$2,$$4,$$6}' hmtx/otagi.ttx \
	| sort \
	> hmtx/otagi.txt

vmtx/otagi.txt: vmtx/otagi.ttx
	awk -F'"' '/<mtx /{print $$2,$$4,$$6}' vmtx/otagi.ttx \
	| sort \
	> vmtx/otagi.txt

hmtx/otagi.ttx: ../src/otagi.otf
	ttx -t hmtx -o hmtx/otagi.ttx ../src/otagi.otf

vmtx/otagi.ttx: ../src/otagi.otf
	ttx -t vmtx -o vmtx/otagi.ttx ../src/otagi.otf

hmtx/kanji.txt: ../kanji-table/kanji-table.txt
	sh bin/make-kanji-mtx.sh h ../kanji-table/kanji-table.txt \
	> hmtx/kanji.txt

vmtx/kanji.txt: ../kanji-table/kanji-table.txt
	sh bin/make-kanji-mtx.sh v ../kanji-table/kanji-table.txt \
	> vmtx/kanji.txt

../kanji-table/kanji-table.txt:
	cd ../kanji-table && $(MAKE)

.PHONY: clean
clean:
	-rm -f asebi_hmtx.ttx hmtx/asebi.txt hmtx/otagi.ttx hmtx/otagi.txt hmtx/kanji.txt hmtx/sammin.txt hmtx/sammin-kanji.txt
	-rm -f asebi_vmtx.ttx vmtx/asebi.txt vmtx/otagi.ttx vmtx/otagi.txt vmtx/kanji.txt vmtx/sammin.txt vmtx/sammin-kanji.txt
