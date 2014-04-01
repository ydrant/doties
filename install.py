#!/usr/bin/env python

from __future__ import absolute_import, print_function, unicode_literals

import datetime
import os


def main():
    timestamp = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
    configdir = os.path.abspath(os.path.dirname(__file__))
    homedir = os.path.expanduser('~')
    for line in open(os.path.join(configdir, 'MANIFEST')):
        filename = line.strip()
        if len(filename) == 0 or filename.startswith("#"):
            continue
        toks = filename.split("=")
        if len(toks) == 2:
            source = os.path.join(homedir, toks[1].strip())
            target = os.path.join(configdir, toks[0].strip())
        else:
            source = os.path.join(homedir, os.path.basename(filename))
            target = os.path.join(configdir, filename)
        print('{} -> {}'.format(target, source))
        if os.path.exists(target):

                if os.path.islink(source):
                    os.unlink(source)
                if os.path.exists(source):
                    os.rename(source, '%s.%s' % (source, timestamp))
                os.symlink(target, source)

if __name__ == '__main__':
    main()
