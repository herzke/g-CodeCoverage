all: execute_test

clean:
	rm -rf *.o test

execute_test: test
	./test

TESTS = $(wildcard *_test.cpp)
TESTOBJECTS = $(patsubst %.cpp, %.o, $(TESTS))

test: $(TESTOBJECTS) ../$(GOOGLEMOCKLIBDIR)/gmock_main.a ../src/libundertest.a
	$(CXX) -o $@ $^ $(LDFLAGS) $(LDLIBS)
