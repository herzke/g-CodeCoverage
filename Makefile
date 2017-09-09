# Compile with code coverage instrumentation
# The default target "all" compiles, tests, and converts coverage data to html.
# To automatically display coverage in the browser, use target show-coverage.

CXXFLAGS += -std=c++11 --coverage
LDFLAGS += --coverage
LDLIBS += -pthread

# We have separate source and test subdirectories
SUBDIRS = src test

# We use googletest and googlemock
GOOGLEGITDIR = googletest-github
GOOGLEMOCKDIR = $(GOOGLEGITDIR)/googlemock
GOOGLEMOCKLIBDIR = $(GOOGLEMOCKDIR)/make
GOOGLEMOCKINCLUDEDIR = $(GOOGLEMOCKDIR)/include
GOOGLETESTDIR = $(GOOGLEGITDIR)/googletest
GOOGLETESTINCLUDEDIR = $(GOOGLETESTDIR)/include
GOOGLEDIRS = $(GOOGLEMOCKLIBDIR)
SUBDIRS += $(GOOGLEDIRS)

# default target: compile everything, execute tests
all: $(SUBDIRS) coverage

clean: TARGET=clean
clean: all
	rm -rf coverage.info coverage

# Always enter subdirectories
.PHONY: $(SUBDIRS) coverage

# The test executable in test needs the objects from src:
test: src $(GOOGLEDIRS)

export CXXFLAGS
export LDFLAGS 
export LDLIBS
export GOOGLEMOCKLIBDIR
export GOOGLEMOCKINCLUDEDIR
export GOOGLETESTINCLUDEDIR

# descend into sub directories
$(SUBDIRS):
	$(MAKE) -C $@ $(TARGET)

coverage: coverage.info
	genhtml coverage.info --prefix $$PWD --output-directory $@

coverage.info: $(SUBDIRS)
	lcov --capture --directory . --output-file coverage.info

show-coverage: coverage
	x-www-browser ./coverage/src/index.html
