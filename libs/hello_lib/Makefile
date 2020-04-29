### User defined variables
LIB := libhello
C_SRCS 		:= hello_lib.c
EC_SRCS		:=
INC_DIRS 	:= incs
EINC_DIRS 	:= includes

### Auto formatting variables for building
OBJDIR 		:= $(OUTDIR)/$(LIB)/obj/
LIBDIR 		:= $(OUTDIR)/$(LIB)/lib/
DEPDIR		:= $(OUTDIR)/$(LIB)/deps/
LIBOUT 		:= $(LIBDIR)$(LIB).so
SRCS 		:= $(addprefix ${CURDIR}/, $(C_SRCS)) $(addprefix $(PRJDIR), $(EC_SRCS))
OBJS 		:= $(SRCS:$(PRJDIR)%.c=$(OBJDIR)%.o)
INC_DIRS	:= $(addprefix ${CURDIR}/, $(INC_DIRS))
EINC_DIRS	:= $(addprefix $(PRJDIR), $(EINC_DIRS))
INCLUDES	:= $(addprefix -I, $(INC_DIRS) $(EINC_DIRS))

### Build Flags
DEPFLAGS = -MT $@ -MMD -MP -MF $(DEPDIR)$*.d

### Build Rules
.PHONY: $(LIB)
$(LIBOUT): $(OBJS)
	mkdir -p $(LIBDIR)
	$(CC) $(OBJS) -shared -fPIC -o $(LIBOUT)

$(OBJDIR)%.o: $(PRJDIR)%.c
$(OBJDIR)%.o: $(PRJDIR)%.c $(DEPDIR)%.d
	mkdir -p $(dir $@)
	mkdir -p $(dir $(shell echo $@ | sed "s|$(OBJDIR)|$(DEPDIR)|"))
	$(CC) -fPIC -o $@ $(DEPFLAGS) $(INCLUDES) -c $<

DEPFILES := $(SRCS:$(PRJDIR)%.c=$(DEPDIR)%.d)
$(DEPFILES):

include $(wildcard $(DEPFILES))
