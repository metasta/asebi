# asebi.cmap を作成する。
# 実際には sammin の cmap をそのまま使用する。

.PHONY: all
all: asebi.cmap

asebi.cmap: ../src/sammin.otf
	-sfntedit -x cmap ../src/sammin.otf
	mv ../src/sammin.cmap asebi.cmap

clean:
	-rm -f asebi.cmap ../src/sammin.cmap
