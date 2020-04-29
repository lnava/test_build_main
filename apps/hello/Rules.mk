### Standard things <DO NOT EDIT> ###
sp 				:= $(sp).x
dirstack_$(sp)	:= $(d)
d				:= $(dir)
#####################################

### Subdirectories, in random order
#dir			:= $(d)/<DIR>
#include		$(dir)/Rules.mk

# Local rules and targets

TGTS_$(d)	:= $(d)/hello
DEPS_$(d)	:= $(TGTS_$(d):%=%.d)

TGT_BIN		:= $(TGT_BIN) $(TGTS_$(d))
CLEAN		:= $(CLEAN) $(TGTS_$(d)) $(DEPS_$(d))

$(TGTS_$(d)):	$(d)/Rules.mk

$(TGTS_$(d)):	CF_TGT :=
$(TGTS_$(d)):	LL_TGT :=
$(TGTS_$(d)):	$(d)/hello.c
	$(COMPLINK)


### Standard things <DO NOT EDIT> ###
-include	$(DEPS_$(d))

d		:= $(dirstack_$(sp))
sp		:= $(basename $(sp))
#####################################
