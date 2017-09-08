# Compile with code coverage instrumentation
CXXFLAGS += --coverage
LDFLAGS += --coverage

# We have separate source and test subdirectories
SUBDIRS = src test

# default target: compile everything, execute tests
all: $(SUBDIRS)

# Always enter subdirectories
.PHONY: $(SUBDIRS)

# The test executable in test needs the objects from src:
test: src

# descend into sub directories
$(SUBDIRS):
	$(MAKE) -C $@

