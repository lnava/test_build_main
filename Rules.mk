.PHONY: all targets clean
all: targets

dir := helloworld
include $(dir)/Rules.mk

targets: $(TGTS_BIN) $(TGTS_LIB)

clean:
	rm -rf $(OUTDIR)

$(OBJDIR_$(d))/%.o: $(PRJDIR)%.c
	mkdir -p $(dir $@)
	$(COMP)

%.so:
	mkdir -p $(dir $@)
	$(SOLINK)

%:
	mkdir -p $(dir $@)
	$(LINK)
