LLENG=ca_AD.utf8
LANG1=tyv
STAMP=$(shell date)
DATE=$(shell date +%Y-%m-%d.%H:%M)
LOG=history.log
SRC=src.1500.txt
REF=ref.1500.txt
TST=tst.1500.txt.$(DATE)
all:
	cat $(SRC) | LANG=$(LLENG) lt-proc -w ../$(LANG1).automorf.bin > $(TST)
	echo -ne $(STAMP)"\t" >> $(LOG)
	LANG=$(LLENG) python3 evaluate-morph.py $(TST) $(REF) 2>> $(LOG)
