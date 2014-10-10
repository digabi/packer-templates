PACKER ?= packer
PACKER_CONFIG ?= packer.json

all:

clean:
	rm -rf output-*
	rm -rf packer_cache
	rm *.box

validate:
	$(PACKER) validate $(PACKER_CONFIG)

build: validate
	$(PACKER) build $(PACKER_CONFIG)
