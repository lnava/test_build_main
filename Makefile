TARGETS = $(shell find . -name "Makefile" ! -path ./Makefile -exec dirname {} \;;)

export PRJDIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
export OUTDIR = $(PRJDIR)build_results
export RELEASE = $(OUTDIR)/release

.PHONY: all outdir $(TARGETS) $(addsuffix, / $(TARGETS))

all: prebuild $(TARGETS)

prebuild:
	mkdir -p $(OUTDIR) $(RELEASE)

$(TARGETS) $(addsuffix, / $(TARGETS)):
	$(MAKE) --directory=$@

clean:
	rm -rf $(OUTDIR)
