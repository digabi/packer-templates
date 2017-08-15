PACKER ?= packer
CONFIG_PACKER ?= packer_amd64.json

VAGRANT ?= vagrant

BUILD_ID ?= $(shell date +%Y%m%d%H%M%S)
DEBIAN_MIRROR ?= http://http.debian.net/debian
_DEBIAN_MIRROR_HOSTNAME = $(shell echo $(DEBIAN_MIRROR) |sed 's,^http://,,;s|\/.*||')
_DEBIAN_MIRROR_DIRECTORY = $(shell echo $(DEBIAN_MIRROR) |sed 's,http://[^/]*,,g')

all:

clean:
	rm -rf output-*

purge:	clean
	rm -rf packer_cache
	rm -f *.box

validate:
	$(PACKER) validate -syntax-only $(CONFIG_PACKER)

build: validate
	$(PACKER) build -only vmware-iso -var "build_id=$(BUILD_ID)" -var "debian_mirror=$(DEBIAN_MIRROR)" -var "debian_mirror_hostname=$(_DEBIAN_MIRROR_HOSTNAME)" -var "debian_mirror_directory=$(_DEBIAN_MIRROR_DIRECTORY)" $(CONFIG_PACKER)

build-virtualbox: validate
	$(PACKER) build -only virtualbox-iso -var "build_id=$(BUILD_ID)" -var "debian_mirror=$(DEBIAN_MIRROR)" -var "debian_mirror_hostname=$(_DEBIAN_MIRROR_HOSTNAME)" -var "debian_mirror_directory=$(_DEBIAN_MIRROR_DIRECTORY)" $(CONFIG_PACKER)

debug:
	@echo "Build-ID:         $(BUILD_ID)"
	@echo "Mirror:           $(DEBIAN_MIRROR)"
	@echo "Mirror hostname:  $(_DEBIAN_MIRROR_HOSTNAME)"
	@echo "Mirror directory: $(_DEBIAN_MIRROR_DIRECTORY)"
# TODO: Install Vagrant vmware plugin if necessary (vagrant plugin
#       install vagrant-vmware-workstation), ruby-dev package required
#       on Debian
# TODO: Install plugin license: vagrant plugin license vagrant-vmware-workstation license.lic
