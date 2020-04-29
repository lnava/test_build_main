TARGETS = $(shell find . -name "Makefile" ! -path ./Makefile -exec dirname {} \;;)

export PRJDIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
export OUTDIR = $(PRJDIR)build_results

.PHONY: all $(TARGETS) $(addsuffix, / $(TARGETS))

all: $(TARGETS)

$(TARGETS) $(addsuffix, / $(TARGETS)):
	$(MAKE) --directory=$@

clean:
	rm -rf $(OUTDIR)
