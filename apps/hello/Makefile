### User defined variables
APP := hello
C_SRCS 		:= hello.c
EC_SRCS 	:=
INC_DIRS	:=
EINC_DIRS 	:= includes libs/hello_lib/incs

### Auto formatting variables for building
OBJDIR 	:= $(OUTDIR)/$(APP)/obj/
EXEDIR 	:= $(OUTDIR)/$(APP)/exe/
DEPDIR	:= $(OUTDIR)/$(APP)/deps/
APPOUT 	:= $(EXEDIR)$(APP)
SRCS 	:= $(addprefix ${CURDIR}/, $(C_SRCS)) $(addprefix $(PRJDIR), $(EC_SRCS))
OBJS 	:= $(SRCS:$(PRJDIR)%.c=$(OBJDIR)%.o)
INC_DIRS    := $(addprefix ${CURDIR}/, $(INC_DIRS))
EINC_DIRS   := $(addprefix $(PRJDIR), $(EINC_DIRS))
INCLUDES    := $(addprefix -I, $(INC_DIRS) $(EINC_DIRS))

### Build Flags
DEPFLAGS = -MT $@ -MMD -MP -MF $(DEPDIR)$*.d

### Build Rules
.PHONY: $(APP)
$(APPOUT): $(OBJS)
	mkdir -p $(EXEDIR)
	$(CC) $(OBJS) -o $(APPOUT)

$(OBJDIR)%.o: $(PRJDIR)%.c
$(OBJDIR)%.o: $(PRJDIR)%.c $(DEPDIR)%.d
	mkdir -p $(dir $@)
	mkdir -p $(dir $(shell echo $@ | sed "s|$(OBJDIR)|$(DEPDIR)|"))
	$(CC) -o $@ $(DEPFLAGS) $(INCLUDES) -c $<

DEPFILES := $(SRCS:$(PRJDIR)%.c=$(DEPDIR)%.d)
$(DEPFILES):

include $(wildcard $(DEPFILES))
