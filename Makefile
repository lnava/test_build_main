### Globals
PRJDIR			:= $(dir  $(abspath $(lastword $(MAKEFILE_LIST))))
OUTDIR			:= $(PRJDIR)build_results

### Build flags for all targets
#
DEPFLAGS	= -MT $@ -MMD -MP -MF $(DEPDIR_$(d))/$*.d
CFLAGS_ALL	= -g -Wall $(DEPFLAGS)
LFLAGS_ALL	= 
LIBS_ALL	=

### Build tools
# 
CC		= gcc
CXX		= g++
COMP	= $(CC) $(CFLAGS_ALL) $(CFLAGS_TGT) -o $@ -c $<
LINK	= $(CC) $(LFLAGS_ALL) $(LFLAGS_TGT) -o $@ $(OBJS_$(d)) $(LIBS_TGT) $(LIBS_ALL)
SOLINK	= $(CC) $(LFLAGS_ALL) $(LFLAGS_TGT) -shared -lfPIC -o $@ $(OBJS_$(d)) $(LIBS_TGT) $(LIBS_ALL)

### Standard parts
#
include Rules.mk
