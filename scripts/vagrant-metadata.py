#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
import json

_ = lambda x:x

def main(args):
    data = {
        'description': 'Debian 8 (jessie) basebox',
        'short_description': 'Debian 8 (jessie)',
        'name': 'ypcs/debian-jessie64',
        'versions': [{
            'version': args.version,
            'status': 'active',
            'description_html': '<p>Debian 8 (jessie)</p>',
            'description_markdown': 'Debian 8 (jessie)',
            'providers': [{
                'name': 'virtualbox',
                'url': '%s/debian-jessie-amd64_virtualbox.box' % (args.base_url)
            },
            {
                'name': 'vmware_desktop',
                'url': '%s/debian-jessie-amd64_vmware.box' % (args.base_url)
            }]
        }]
    }
    if args.outfile == '-':
        print json.dumps(data)
    else:
        if os.path.exists(args.outfile):
            print "File already exists, not creating: %s" % args.outfile
            return 1
        with open(args.outfile, 'w') as ofile:
            ofile.write(json.dumps(data))        
    return 0

def run():
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument('--version', help=_('Vagrant box version.'), default=1)
    parser.add_argument('-b', '--base-url', dest='base_url', default='https://cdn.ypcs.fi/vagrant')
    parser.add_argument('-o', '--outfile', dest='outfile', default='-')
    args = parser.parse_args()
    sys.exit(main(args))

if __name__ == "__main__":
    run()
