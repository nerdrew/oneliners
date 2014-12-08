PREFIX=/usr/local
BINDIR=$(PREFIX)/bin
BINARIES=bin/*

install:
	install -d $(BINDIR)
	install -v $(BINARIES) $(BINDIR)

.PHONY: install
