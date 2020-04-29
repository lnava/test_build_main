### Globals
PRJDIR			= ${CURDIR}
OUTDIR			= ${CURDIR}/build_results

### Build flags for all targets
#
CF_ALL          = -g -Wall
LF_ALL          = 
LL_ALL          =

### Build tools
# 
CC              = gcc
INST			= ./build/install
COMP            = mkdir -p $$(dirname $@); $(CC) $(CF_ALL) $(CF_TGT) -o $@ -c $<
LINK            = mkdir -p $$(dirname $@); $(CC) $(LF_ALL) $(LF_TGT) -o $@ $^ $(LL_TGT) $(LL_ALL)
COMPLINK        = mkdir -p $$(dirname $@); $(CC) $(CF_ALL) $(CF_TGT) $(LF_ALL) $(LF_TGT) -o $@ $< $(LL_TGT) $(LL_ALL)

### Standard parts
#
include Rules.mk
