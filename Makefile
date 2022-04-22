BUILDDIR = build

.PHONY: build install

build:
	mkdir -p $(BUILDDIR)
	cd $(BUILDDIR) && \
		cmake ../src && \
		make

# a user must have permissions to write to /usr/local/lib
# a user must have permissions to run ldconfig
# /usr/local/lib must be listed in the ld.so.conf
install:
	cp $(BUILDDIR)/libchai.so /usr/local/lib
	ldconfig

clean:
	rm -r $(BUILDDIR)
