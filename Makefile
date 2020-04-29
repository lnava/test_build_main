BUILD_DIRS := apps

export PRJDIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
export OUTDIR = $(PRJDIR)build_results

.PHONY: all
all:
	mkdir -p $(OUTDIR)
	for DIR in $(BUILD_DIRS); do cd $$DIR; $(MAKE); cd $(PRJDIR); done

clean:
	rm -rf $(OUTDIR)
