### update dir pointer <DO NOT EDIT> ###
decorator	:= $(decorator).x
dirsave_$(decorator) := $(d)
d := $(dir)
########################################



#User supplied arguments
APP_$(d) 		:= helloworld
SOURCES_$(d) 	:= helloworld.c
ESOURCES_$(d)	:=
INCLUDES_$(d)	:= incs
EINCLUDES_$(d)	:=

#Automatically generated variables
OUTDIR_$(d)	:= $(OUTDIR)/$(APP_$(d))
SRCS_$(d) 		:= $(SOURCES_$(d):%.c=$(PRJDIR)$(d)/%.c) $(ESOURCES_$(d):%.c=$(PRJDIR)%.c)
OBJS_$(d)		:= $(SRCS_$(d):$(PRJDIR)%.c=$(OBJDIR)/%.o)
INCS_$(d)		:= $(addprefix -I$(PRJDIR)$(d)/, $(INCLUDES_$(d))) $(addprefix -I$(PRJDIR), $(EINCLUDES_$(d)))
DEPS_$(d)		:= $(SRCS_$(d):$(PRJDIR)%.c=$(DEPDIR)/%.d)
DEPDIRS_$(d)	:= $(sort $(dir $(DEPS_$(d))))
CFLAGS_TGT		:= $(INCS_$(d))

#Add fullpath target to all
TGT_$(d)	 := $(EXEDIR)/$(d)/$(APP_$(d))
TGTS_BIN 	 := $(TGTS_BIN) $(TGT_$(d))
## Application build rule (using full dest path)
$(TGT_$(d)): $(DEPDIRS_$(d)) $(OBJS_$(d))
	mkdir -p $(dir $@)
	$(LINK)

#Add alternative targets (Appname/path)
.PHONY: $(APP) $(d) $(d)/
$(APP) $(d) $(d)/: $(TGT_$(d))


### Generating Autodependencies <DO NOT EDIT> ##
$(DEPDIRS_$(d)):
	mkdir -p $@

$(DEPS_$(d)):

include $(wildcard $(DEPS_$(d)))
#################################################
### revert dir pointer <DO NOT EDIT> ###
d := $(dirsave_$(decorator))
decorator := $(basename $(decorator))
########################################
