# Compile with code coverage instrumentation
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
all: $(SUBDIRS)

# Always enter subdirectories
.PHONY: $(SUBDIRS)

# The test executable in test needs the objects from src:
test: src $(GOOGLEDIRS)

export CXXFLAGS
export LDFLAGS 
export LDLIBS
export GOOGLEMOCKLIBDIR

# descend into sub directories
$(SUBDIRS):
	$(MAKE) -C $@
