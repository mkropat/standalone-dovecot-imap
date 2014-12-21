PREFIX	= /usr/local
BIN	= $(DESTDIR)/$(PREFIX)/bin

install:
	mkdir -p "$(BIN)"
	cp sdimap sdsync "$(BIN)"

uninstall:
	rm -f "$(BIN)/sdimap" "$(BIN)/sdsync"
