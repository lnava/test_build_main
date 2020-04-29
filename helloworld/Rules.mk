### update dir pointer <DO NOT EDIT> ###
decorator	:= $(decorator).x
dirsave_$(_decorator) := $(dir)
dir := $(dir)
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
OBJDIR_$(d)	:= $(OUTDIR_$(d))/obj
EXEDIR_$(d)	:= $(OUTDIR_$(d))/exe
DEPDIR_$(d) := $(OUTDIR_$(d))/deps
SRCS_$(d) 		:= $(SOURCES_$(d):%.c=$(PRJDIR)$(d)/%.c) $(ESOURCES_$(d):%.c=$(PRJDIR)%.c)
OBJS_$(d)		:= $(SRCS_$(d):$(PRJDIR)%.c=$(OBJDIR_$(d))/%.o)
INCS_$(d)		:= $(addprefix -I$(PRJDIR)$(d)/, $(INCLUDES_$(d))) $(addprefix -I$(PRJDIR), $(EINCLUDES_$(d)))
DEPS_$(d)		:= $(SRCS_$(d):$(PRJDIR)%.c=$(DEPDIR_$(d))/%.d)
CFLAGS_TGT		:= $(INCS_$(d))

#Add fullpath target to all
TGT_$(d)	 := $(EXEDIR_$(d))/$(APP_$(d))
TGTS_BIN 	 += $(TGT_$(d))
## Application build rule (using full dest path)
$(TGT_$(d)): $(DEPDIR_$(d)) $(OBJS_$(d))
	mkdir -p $(EXEDIR_$(d))
	$(LINK)

#Add alternative targets (Appname/path)
.PHONY: $(APP) $(dir) $(dir)/
$(APP) $(dir) $(dir)/: $(TGT_$(d))


### Generating Autodependencies <DO NOT EDIT> ##
$(DEPS_$(d)):

include $(wildcard $(DEPS_$(d)))
#################################################
### revert dir pointer <DO NOT EDIT> ###
dir := $(dirsave_$(decorator))
decorator := $(basename $(decorator))
########################################
