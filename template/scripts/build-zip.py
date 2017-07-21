#!/usr/bin/env python

from __future__ import print_function

import os
import json
import shutil

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
EXTENSION_DIR = os.path.join(BASE_DIR, '../src')
DIST_DIR = os.path.join(BASE_DIR, '../zip-builds')


def extract_extension_data():
    with open(EXTENSION_DIR + '/manifest.json') as content:
        content_json = json.load(content)
        name = content_json.get('name')
        extension_version = content_json.get('version')

    return [name, extension_version]


def main():
    [name, version] = extract_extension_data()
    zip_name = '{}/{}-v{}'.format(DIST_DIR, name, version)

    print('Building {}.zip'.format(zip_name))
    shutil.make_archive(zip_name, 'zip', EXTENSION_DIR)
    print('Ok')


if __name__ == '__main__':
    main()
