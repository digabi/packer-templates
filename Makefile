PACKER ?= packer
PACKER_CONFIG ?= packer.json

VERSION ?= 1.0.$(shell date +%Y%m%d%H%M%S)

VAGRANT ?= vagrant

BUILD_ID ?= $(shell date +%Y%m%d%H%M%S)
DEBIAN_MIRROR ?= http://http.debian.net/debian
_DEBIAN_MIRROR_HOSTNAME = $(shell echo $(DEBIAN_MIRROR) |sed 's,^http://,,;s|\/.*||')
_DEBIAN_MIRROR_DIRECTORY = $(shell echo $(DEBIAN_MIRROR) |sed 's,http://[^/]*,,g')

all:

clean:
	rm -rf output-*
	rm -f metadata.json

purge:	clean
	rm -rf packer_cache
	rm -f *.box

validate:
	$(PACKER) validate $(PACKER_CONFIG)

build: validate
	$(PACKER) build -var "build_id=$(BUILD_ID)" -var "debian_mirror=$(DEBIAN_MIRROR)" -var "debian_mirror_hostname=$(_DEBIAN_MIRROR_HOSTNAME)" -var "debian_mirror_directory=$(_DEBIAN_MIRROR_DIRECTORY)" $(PACKER_CONFIG)

metadata.json:
	./scripts/vagrant-metadata.py --version=$(VERSION) --outfile=metadata.json

debug:
	@echo "Build-ID:         $(BUILD_ID)"
	@echo "Mirror:           $(DEBIAN_MIRROR)"
	@echo "Mirror hostname:  $(_DEBIAN_MIRROR_HOSTNAME)"
	@echo "Mirror directory: $(_DEBIAN_MIRROR_DIRECTORY)"
# TODO: Install Vagrant vmware plugin if necessary (vagrant plugin
#       install vagrant-vmware-workstation), ruby-dev package required
#       on Debian
# TODO: Install plugin license: vagrant plugin license vagrant-vmware-workstation license.lic
