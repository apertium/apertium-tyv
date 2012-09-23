all:
	hfst-lexc apertium-tyv.tyv.lexc -o tyv-lexc.hfst
	hfst-twolc apertium-tyv.tyv.twol -o tyv-twol.hfst
	hfst-compose-intersect -1 tyv-lexc.hfst -2 tyv-twol.hfst -o tyv-gen.hfst
	hfst-invert tyv-gen.hfst -o tyv-mor.hfst
	hfst-fst2fst -O -i tyv-gen.hfst -o tyv.autogen.hfst
	hfst-fst2fst -O -i tyv-mor.hfst -o tyv.automorf.hfst
