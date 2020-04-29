### Globals
export PRJDIR	:= $(dir  $(abspath $(lastword $(MAKEFILE_LIST))))
export OUTDIR	:= $(PRJDIR)build_results
export OBJDIR	:= $(OUTDIR)/obj
export DEPDIR	:= $(OUTDIR)/deps
export EXEDIR	:= $(OUTDIR)/bin
export RELEASE	:= $(OUTDIR)/release

### Build flags for all targets
#
DEPFLAGS	= -MT $@ -MMD -MP -MF $(DEPDIR)/$*.d
CFLAGS_ALL	= -g -Wall $(DEPFLAGS)
LFLAGS_ALL	= 
LIBS_ALL	=

### Build tools
# 
CC		= gcc
CXX		= g++
COMP	= $(CC) $(CFLAGS_ALL) $(CFLAGS_TGT) -o $@ -c $<
LINK	= $(CC) $(LFLAGS_ALL) $(LFLAGS_TGT) -o $@ $(filter %.o, $^) $(LIBS_TGT) $(LIBS_ALL)
### Standard parts
#
include Rules.mk
