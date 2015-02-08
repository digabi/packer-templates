#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""Create metadata.json to publish versioned Vagrant boxes

See
<https://superuser.com/questions/747699/vagrant-box-url-for-json-metadata-file>

Usage:

vagrant-metadata.py --version=1.0.123 --virtualbox=virtualbox.box \
                    --vmware=vmware.box --boxname="ypcs/debian-jessie64.box" \
                    --outfile=metadata.json --baseurl="https://cdn.ypcs.fi/pub"

You can use metadata.json as Vagrantbox config.vm.box_url.

Vagrant will then check if new box version is available.
"""

# Author: Ville Korhonen <ville@xd.fi>
# License: GPLv2

import os
import sys
import json
import logging

_ = lambda x: x

DEFAULT_BOX_NAME = 'ypcs/debian-jessie64'
DEFAULT_BOX_URL_BASE = 'https://cdn.ypcs.fi/vagrant'
DEFAULT_BOX_VERSION = '1'
STDOUT = '-'

STATUS_ACTIVE = 'active'

class VagrantMetadata(object):
    """Handle metadata.json"""
    def __init__(self, name, **kwargs):
        self.logger = kwargs.get('logger', logging.getLogger(__name__))
        self._data = {}
        infile = kwargs.get('infile', None)
        if infile is not None:
            self.read(filename=infile)
        self._data['name'] = name
        self._baseurl = kwargs.get('baseurl', DEFAULT_BOX_URL_BASE)

    def read(self, filename):
        """Read existing metadata.json & add new version data to it."""
        if not os.path.exists(filename):
            raise IOError(_('Initial data file not found: %s.') % filename)
        self.logger.debug('Read initial data from file %s.', filename)
        self._data = json.loads(open(filename, 'r').read())
        return True

    def _create_url(self, filename):
        """Create full URL to Vagrant basebox."""
        if filename.startswith('http'):
            return filename
        if self._baseurl.endswith('/'):
            url = self._baseurl
        else:
            url = self._baseurl + '/'
        return '%s%s' % (
            url,
            filename
        )

    # def remove(self, provider, version):
    #     """Remove box and/or version."""
    #     raise NotImplementedError

    def add(self, provider, filename, version):
        """Add new provider for version from file."""
        self.logger.debug('Add new box %s from %s.', provider, filename)

        if not self._data.has_key('versions'):
            self._data['versions'] = []

        for ver in self._data['versions']:
            if ver.get('version', None) == version:
                if not ver.has_key('providers'):
                    ver['providers'] = []

                for pro in ver['providers']:
                    if pro['name'] == provider:
                        pro['url'] = self._create_url(filename)
                        self.logger.debug('Replace old box url, provider %s,' +
                                          'filename %s', provider, filename)
                        return True

                ver['providers'].append({
                    'name': provider,
                    'url': self._create_url(filename)
                })
                self.logger.debug('Add new provider %s to version %s', provider,
                                  version)
                return True

        self._data['versions'].append({
            'status': STATUS_ACTIVE,
            'version': version,
            'description_html': '',
            'description_markdown': '',
            'providers': [{
                'name': provider,
                'url': self._create_url(filename)
            },],
            })
        self.logger.debug('Add new provider %s to new version %s', provider,
                          version)
        return True

    def dump(self):
        """Dump configuration as string."""
        return json.dumps(self._data)

    def write(self, filename, overwrite=False):
        """Write configuration to file."""
        if not overwrite and os.path.exists(filename):
            raise IOError(
                _('File already exists, not overwriting: %s.') % filename
                )
        with open(filename, 'w') as ofile:
            ofile.write(self.dump())
        return True

def main(args):
    """Run the CLI"""
    logger = logging.getLogger(__name__)
    handler = logging.StreamHandler()
    logger.addHandler(handler)
    formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
    handler.setFormatter(formatter)

    if args.verbose == 0:
        logger.setLevel(logging.ERROR)
    elif args.verbose == 1:
        logger.setLevel(logging.WARNING)
    elif args.verbose == 2:
        logger.setLevel(logging.INFO)
    else:
        logger.setLevel(logging.DEBUG)
    logger.debug('Loglevel: %s', logger.getEffectiveLevel())

    mdj = VagrantMetadata(name=args.boxname, version=args.version,
                          infile=args.infile, logger=logger)

    if args.virtualbox:
        mdj.add(provider='virtualbox', filename=args.virtualbox,
                version=args.version)
    if args.vmware:
        mdj.add(provider='vmware_desktop', filename=args.vmware,
                version=args.version)

    if args.outfile == STDOUT:
        print mdj.dump()
    else:
        mdj.write(args.outfile, overwrite=args.force)

    return 0


def run():
    """Setup CLI arguments"""
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument('--version', help=_('Vagrant box version.'),
                        default=DEFAULT_BOX_VERSION, required=True)

    parser.add_argument('-n', '--box-name', dest='boxname', help=_('Box name.'),
                        default=DEFAULT_BOX_NAME)

    parser.add_argument('-b', '--base-url', dest='base_url',
                        default=DEFAULT_BOX_URL_BASE)

    parser.add_argument('-f', '--force', dest='force', action='store_true',
                        default=False,
                        help=_('Overwrite files if already exist.'))
    parser.add_argument('-i', '--infile', dest='infile', default=None)
    parser.add_argument('-o', '--outfile', dest='outfile', default=STDOUT)

    parser.add_argument('--verbose', '-v', action='count', default=0)

    parser.add_argument('--virtualbox', dest='virtualbox',
                        help=_('Path to VirtualBox .box.'))
    parser.add_argument('--vmware', dest='vmware',
                        help=_('Path to VMware .box.'))
    args = parser.parse_args()
    sys.exit(main(args))

if __name__ == "__main__":
    run()
