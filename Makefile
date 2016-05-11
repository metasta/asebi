.PHONY:all
all:AsebiMin-Light.otf

AsebiMin-Light.otf: asebi.name asebi.CFF asebi.cmap src/otagi.otf
	cp src/otagi.otf AsebiMin-Light.otf
	-sfntedit -a name=asebi.name,CFF=asebi.CFF,cmap=asebi.cmap AsebiMin-Light.otf

asebi.name:
	cd table-name && $(MAKE)
	cp table-name/asebi.name .

asebi.CFF:
	cd table-CFF && $(MAKE)
	cp table-CFF/asebi.CFF .

asebi.cmap:
	cd table-cmap && $(MAKE)
	cp table-cmap/asebi.cmap .

clean:
	-rm AsebiMin-Light.otf asebi.name asebi.CFF asebi.cmap
	cd table-name && $(MAKE) clean
	cd table-CFF  && $(MAKE) clean
	cd table-cmap && $(MAKE) clean
