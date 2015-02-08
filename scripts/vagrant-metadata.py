#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import json
import logging

"""Create metadata.json to publish versioned Vagrant boxes

See <https://superuser.com/questions/747699/vagrant-box-url-for-json-metadata-file>

Usage:

vagrant-metadata.py --version=1.0.123 --virtualbox=virtualbox.box --vmware=vmware.box \
                    --boxname="ypcs/debian-jessie64.box" -o metadata.json \
                    --baseurl="https://cdn.ypcs.fi/pub"

You can use metadata.json as Vagrantbox config.vm.box_url.

Vagrant will then check if new box version is available.
"""

# Author: Ville Korhonen <ville@xd.fi>
# License: GPLv2

log = logging.getLogger('vagrant-metadata')
sh = logging.StreamHandler()
log.addHandler(sh)
formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
sh.setFormatter(formatter)

_ = lambda x:x

DEFAULT_BOX_NAME = 'ypcs/debian-jessie64'
DEFAULT_BOX_URL_BASE = 'https://cdn.ypcs.fi/vagrant'
DEFAULT_BOX_VERSION = '1'
STDOUT = '-'

STATUS_ACTIVE = 'active'

class VagrantMetadata(object):
    def __init__(self, name, *args, **kwargs):
        self._data = {}
        if 'infile' in kwargs:
            self.read(filename=kwargs.get('infile'))
        self._data['name'] = name
        self._baseurl = kwargs.get('baseurl', DEFAULT_BOX_URL_BASE)

    def read(self, filename):
        """Read existing metadata.json & add new version data to it."""
        if not os.path.exists(filename):
            raise IOError, _('Initial data file not found: %s.') % filename
        log.debug(_('Read initial data from file %s.') % filename)
        self._data = json.loads(open(filename, 'r').read())
        return True

    def _create_url(self, filename):
        return '%s%s' % (self._baseurl if self._baseurl.endswith('/') else self._baseurl + '/', filename)

    def remove(self, provider, version):
        """Remove box and/or version."""
        raise NotImplementedError

    def add(self, provider, filename, version):
        """Add new provider for version from file."""
        log.debug('Add new box %s from %s.' % (provider, filename))
        
        if not self._data.has_key('versions'):
            self._data['versions'] = []

        for v in self._data['versions']:
            if v.get('version', None) == version:
                if not v.has_key('providers'):
                    v['providers'] = []

                for p in v['providers']:
                    if p['name'] == provider:
                        p['url'] = self._create_url(filename)
                        log.debug('Replace old box url, provider %s, filename %s' % (provider, filename))
                        return True

                v['providers'].append({
                    'name': provider,
                    'url': self._create_url(filename)
                })
                log.debug('Add new provider %s to version %s' % (provider, version))
                return True

        self._data['versions'].append({
                'status': STATUS_ACTIVE,
                'version': version,
                'description_html': '',
                'description_markdown': '',
                'providers': [{
                    'name': provider,
                    'url': self._create_url(filename)
                },]            
            })
        log.debug('Add new provider %s to new version %s' % (provider, version))
        return True

    def dump(self):
        """Dump configuration as string."""
        return json.dumps(self._data)

    def write(self, filename, overwrite=False):
        """Write configuration to file."""
        if not overwrite and os.path.exists(filename):
            raise IOError, _('File already exists, not overwriting: %s.') % filename
        with open(filename, 'w') as ofile:
            ofile.write(self.dump())
        return True

def main(args):
    if args.verbose == 0:
        log.setLevel(logging.ERROR)
    elif args.verbose == 1:
        log.setLevel(logging.WARNING)
    elif args.verbose == 2:
        log.setLevel(logging.INFO)
    else:
        log.setLevel(logging.DEBUG)
    log.debug('Loglevel: %s' % log.getEffectiveLevel())

    mt = VagrantMetadata(name=args.boxname, version=args.version, infile=args.infile)

    if args.virtualbox:
        mt.add(provider='virtualbox', filename=args.virtualbox, version=args.version)
    if args.vmware:
        mt.add(provider='vmware_desktop', filename=args.vmware, version=args.version)

    if args.outfile == STDOUT:
        print mt.dump()
    else:
        mt.write(args.outfile, overwrite=args.force)

    return 0


def run():
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument('--version', help=_('Vagrant box version.'), default=DEFAULT_BOX_VERSION, required=True)

    parser.add_argument('-n', '--box-name', dest='boxname', help=_('Box name.'), default=DEFAULT_BOX_NAME)

    parser.add_argument('-b', '--base-url', dest='base_url', default=DEFAULT_BOX_URL_BASE)

    parser.add_argument('-f', '--force', dest='force', action='store_true', default=False, help=_('Overwrite files if already exist.'))
    parser.add_argument('-i', '--infile', dest='infile', default=None)
    parser.add_argument('-o', '--outfile', dest='outfile', default=STDOUT)

    parser.add_argument('--verbose', '-v', action='count', default=0)

    parser.add_argument('--virtualbox', dest='virtualbox', help=_('Path to VirtualBox .box.'))
    parser.add_argument('--vmware', dest='vmware', help=_('Path to VMware .box.'))
    args = parser.parse_args()
    sys.exit(main(args))

if __name__ == "__main__":
    run()
