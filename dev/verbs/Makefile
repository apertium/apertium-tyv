all:
	hfst-lexc verbs.lexc -o verbs.lexc.hfst
	hfst-compose-intersect -1 verbs.lexc.hfst -2 ../../.deps/tyv.twol.hfst -o verbs.hfst
	hfst-invert verbs.hfst | hfst-fst2fst -O -o verbs.ohfst

clean: 
	rm verbs.hfst verbs.lexc.hfst verbs.ohfst
