PACKER ?= packer
PACKER_CONFIG ?= packer.json

VAGRANT ?= vagrant

BUILD_ID ?= $(shell date +%Y%m%d%H%M%S)
DEBIAN_MIRROR ?= http://http.debian.net/debian

all:

clean:
	rm -rf output-*
	rm -rf packer_cache
	rm -f *.box

validate:
	$(PACKER) validate $(PACKER_CONFIG)

build: validate
	$(PACKER) build -var "build_id=$(BUILD_ID)" -var "debian_mirror=$(DEBIAN_MIRROR)" $(PACKER_CONFIG)

# TODO: Install Vagrant vmware plugin if necessary (vagrant plugin
#       install vagrant-vmware-workstation), ruby-dev package required
#       on Debian
# TODO: Install plugin license: vagrant plugin license vagrant-vmware-workstation license.lic
