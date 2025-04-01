CMARK = cmark-gfm
SOURCES = $(wildcard $(CMARK)/src/*.c) $(wildcard $(CMARK)/src/*.h)

all: libcmark-gfm.a

libcmark-gfm.a: $(CMARK) $(SOURCES)
	mkdir -p $(CMARK)/build
	cd $(CMARK)/build && cmake .. \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=.. \
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5
	cd $(CMARK)/build && make

	cp $(CMARK)/build/src/libcmark-gfm.a .
	cp $(CMARK)/build/extensions/libcmark-gfm-extensions.a .

$(CMARK):
	git clone --depth 1 https://github.com/github/cmark-gfm.git

clean:
	rm -rf cmark-gfm

distclean: clean
	rm -f *.a
