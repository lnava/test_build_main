BUILD_DIRS := hello

.PHONY: all
all:
	for DIR in $(BUILD_DIRS); do pushd $$DIR; $(MAKE); popd; done


clean:
	for DIR in $(BUILD_DIRS); do pushd $$DIR; $(MAKE) clean; popd; done
