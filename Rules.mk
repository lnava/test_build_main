.PHONY: all targets clean
all: targets

dir := apps
include $(dir)/Rules.mk

targets: $(TGTS_BIN) $(TGTS_LIB)

clean:
	rm -rf $(OUTDIR)

$(OBJDIR)/%.o: $(PRJDIR)%.c
$(OBJDIR)/%.o: $(PRJDIR)%.c $(DEPDIR)/%.d
	mkdir -p $(dir $@)
	$(COMP)
