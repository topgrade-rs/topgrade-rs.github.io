default: serve

all: install build

install:
	cargo install mdbook

s serve:
	mdbook serve

build:
	mdbook build