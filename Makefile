.PHONY: all
all:AsebiMin-Light.otf

AsebiMin-Light.otf: asebi.name asebi.CFF asebi.cmap asebi_hmtx.ttx asebi_vmtx.ttx src/otagi.otf
	cp src/otagi.otf asebi_nomtx.otf
	-sfntedit -a name=asebi.name,CFF=asebi.CFF,cmap=asebi.cmap asebi_nomtx.otf
	ttx -m asebi_nomtx.otf asebi_hmtx.ttx
	ttx -m asebi_hmtx.otf asebi_vmtx.ttx
	mv asebi_vmtx.otf AsebiMin-Light.otf

asebi.name:
	cd table-name && $(MAKE)
	cp table-name/asebi.name .

asebi.CFF:
	cd table-CFF && $(MAKE)
	cp table-CFF/asebi.CFF .

asebi.cmap:
	cd table-cmap && $(MAKE)
	cp table-cmap/asebi.cmap .

asebi_hmtx.ttx:
	cd table-mtx && $(MAKE)
	cp table-mtx/asebi_hmtx.ttx .

asebi_vmtx.ttx:
	cd table-mtx && $(MAKE)
	cp table-mtx/asebi_vmtx.ttx .

.PHONY: clean
clean:
	-rm -f AsebiMin-Light.otf asebi.name asebi.CFF asebi.cmap \
		asebi_hmtx.ttx asebi_vmtx.ttx asebi_hmtx.otf asebi_nomtx.otf
	cd kanji-table && $(MAKE) clean
	cd table-CFF  && $(MAKE) clean
	cd table-cmap && $(MAKE) clean
	cd table-mtx  && $(MAKE) clean
	cd table-name && $(MAKE) clean
