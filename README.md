packer-templates
================

Templates for automated creation of new virtual machine images.

Currently builds Debian 8 (jessie) images using VirtualBox & VMware providers.


## Usage

Requirements: [packer.io](https://packer.io/), VirtualBox, VMware, ...

### Build new Vagrantbox
    make clean
    make build

### Add new boxes to vagrant

    vagrant box add --provider virtualbox debian-jessie64 vagrant_virtualbox*.box
    vagrant box add --provider vmware-workstation debian-jessie64 vagrant_vmware*.box
