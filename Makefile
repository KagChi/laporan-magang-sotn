# Laporan Magang STMIK Kuwera (SOTN) — build memakai XeLaTeX + latexmk

MAIN   = main
SAMPUL = sampul-only
ENGINE = -pdfxe
FLAGS  = -interaction=nonstopmode -halt-on-error
DIST   = dist/Laporan Magang - Samuel - 2231010010.pdf

.PHONY: all watch sampul dist clean cleanall

all:
	latexmk $(ENGINE) $(FLAGS) $(MAIN).tex

watch:
	latexmk $(ENGINE) $(FLAGS) -pvc $(MAIN).tex

sampul:
	latexmk $(ENGINE) $(FLAGS) $(SAMPUL).tex

dist: all
	mkdir -p dist
	cp $(MAIN).pdf "$(DIST)"
	@echo "Ekspor: $(DIST)"

clean:
	latexmk -c $(MAIN).tex $(SAMPUL).tex

cleanall:
	latexmk -C $(MAIN).tex $(SAMPUL).tex

