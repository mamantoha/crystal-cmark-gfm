CMARK = cmark-gfm
SOURCES = $(wildcard $(CMARK)/src/*.c) $(wildcard $(CMARK)/src/*.h)

all: libcmark-gfm.a

libcmark-gfm.a: $(SOURCES)
	cd $(CMARK) && INSTALL_PREFIX=.. make
	cp $(CMARK)/src/*.h .
	cp $(CMARK)/extensions/*.h .
	cp $(CMARK)/build/src/*.h .
	cp $(CMARK)/build/extensions/*.h .
	cp $(CMARK)/build/src/*.a .
	cp $(CMARK)/build/extensions/*.a .

clean:
	rm -rf *.h

distclean: clean
	rm -rf *.a
