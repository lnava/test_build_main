.PHONY: all targets clean
all: targets

dir := helloworld
include $(dir)/Rules.mk

targets: $(TGTS_BIN) $(TGTS_LIB)

clean:
	rm -rf $(OUTDIR)

$(OBJDIR_$(d))/%.o: $(PRJDIR)%.c
$(OBJDIR_$(d))/%.o: $(PRJDIR)%.c $(DEPDIR_$(d))/%.d | $(DEPDIR_$(d))
	mkdir -p $(dir $@)
	$(COMP)

%.so:
	mkdir -p $(dir $@)
	$(SOLINK)

%Rules.mk:
	echo "Rules.mk was updated. Rebuilding..."

$(DEPDIR_$(d)):
	    mkdir -p $(DEPDIR_$(d))
		$(foreach DEP, $(DEPS_$(d)), mkdir -p $(dir $(DEP)))
