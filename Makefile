PACKER ?= packer
PACKER_CONFIG ?= packer.json

VAGRANT ?= vagrant

BUILD_ID ?= $(shell date +%Y%m%d%H%M%S)
VERSION ?= 1.0.$(BUILD_ID)
DEBIAN_MIRROR ?= http://http.debian.net/debian
_DEBIAN_MIRROR_HOSTNAME = $(shell echo $(DEBIAN_MIRROR) |sed 's,^http://,,;s|\/.*||')
_DEBIAN_MIRROR_DIRECTORY = $(shell echo $(DEBIAN_MIRROR) |sed 's,http://[^/]*,,g')

BOX_VIRTUALBOX = $(shell ls vagrant_*_virtualbox_*.box |head -n1)
BOX_VMWARE = $(shell ls vagrant_*_vmware_*.box |head -n1)

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
	./scripts/vagrant_metadata.py --version=$(VERSION) --outfile=metadata.json --virtualbox=$(BOX_VIRTUALBOX) --vmware=$(BOX_VMWARE)

debug:
	@echo "Build-ID:         $(BUILD_ID)"
	@echo "Mirror:           $(DEBIAN_MIRROR)"
	@echo "Mirror hostname:  $(_DEBIAN_MIRROR_HOSTNAME)"
	@echo "Mirror directory: $(_DEBIAN_MIRROR_DIRECTORY)"
# TODO: Install Vagrant vmware plugin if necessary (vagrant plugin
#       install vagrant-vmware-workstation), ruby-dev package required
#       on Debian
# TODO: Install plugin license: vagrant plugin license vagrant-vmware-workstation license.lic
