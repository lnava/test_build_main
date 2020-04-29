APP := hello
C_SRCS := hello.c
INC_DIRS := includes

OBJDIR 	:= $(OUTDIR)/$(APP)/obj/
EXEDIR 	:= $(OUTDIR)/$(APP)/exe/
APP 	:= $(EXEDIR)$(APP)
SRCS 	:= $(addprefix ${CURDIR}/, $(C_SRCS))
OBJS 	:= $(SRCS:$(PRJDIR)%.c=$(OBJDIR)%.o)
INC_DIRS:= $(addprefix $(PRJDIR), $(INC_DIRS))
INCLUDES:= $(addprefix -I, $(INC_DIRS))

DEPDIR	:= $(OUTDIR)/$(APP)/deps/
DEPFLAGS = -MT $@ -MMD -MP -MF $(DEPDIR)$*.d

$(APP): $(OBJS)
	mkdir -p $(EXEDIR)
	$(CC) $(OBJS) -o $(APP)

$(OBJDIR)%.o: $(PRJDIR)%.c
$(OBJDIR)%.o: $(PRJDIR)%.c $(DEPDIR)%.d
	mkdir -p $(dir $@)
	mkdir -p $(dir $(shell echo $@ | sed "s|$(OBJDIR)|$(DEPDIR)|"))
	$(CC) -o $@ $(DEPFLAGS) $(INCLUDES) -c $<

DEPFILES := $(SRCS:$(PRJDIR)%.c=$(DEPDIR)%.d)
$(DEPFILES):

include $(wildcard $(DEPFILES))
