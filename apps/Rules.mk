# Standard things
sp 				:= $(sp).x
dirstack_$(sp)	:= $(d)
d				:= $(dir)


### Subdirectories, in random order
dir			:= $(d)/hello
include	$(dir)/Rules.mk


### Standard things <DO NOT EDIT> ###
-include    $(DEPS_$(d))

d       := $(dirstack_$(sp))
sp      := $(basename $(sp))
#####################################
