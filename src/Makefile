all: libundertest.a

SOURCES = $(wildcard *.cpp)
OBJECTS = $(patsubst %.cpp, %.o, $(SOURCES))

libundertest.a: $(OBJECTS)
	ar -rucs $@ $^

clean:
	rm -f *.o *.a
