# Laporan Magang STMIK Kuwera (SOTN) — build memakai XeLaTeX + latexmk

MAIN   = main
SAMPUL = sampul-only
ENGINE = -pdfxe
FLAGS  = -interaction=nonstopmode -halt-on-error

.PHONY: all watch sampul clean cleanall

all:
	latexmk $(ENGINE) $(FLAGS) $(MAIN).tex

watch:
	latexmk $(ENGINE) $(FLAGS) -pvc $(MAIN).tex

sampul:
	latexmk $(ENGINE) $(FLAGS) $(SAMPUL).tex

clean:
	latexmk -c $(MAIN).tex $(SAMPUL).tex

cleanall:
	latexmk -C $(MAIN).tex $(SAMPUL).tex

