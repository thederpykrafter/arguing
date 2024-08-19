# files or dir/
.PHONY: build
.PHONY: run
.PHONY: test

default: build

install: build copy

build:
	c3c build

test:
	c3c run $(ARGS)

copy:
	cp `fd . build/ --type f` /usr/bin

uninstall:
	rm -rf /usr/bin/`fd . build/ --type f | sed "s/build\///"`

clean:
	rm -f `fd . build/ --maxdepth 1 --type f`
