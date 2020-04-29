### update dir pointer <DO NOT EDIT> ###
decorator	:= $(decorator).x
dirsave_$(_decorator) := $(d)
d := $(dir)
########################################


### Add Subdirs to build ###
dir := $(d)/helloworld
include $(dir)/Rules.mk

dir := $(d)/byeworld
include $(dir)/Rules.mk
############################


### revert dir pointer <DO NOT EDIT> ###
d := $(dirsave_$(decorator))
decorator := $(basename $(decorator))
########################################
