#!/usr/bin/env bash

set -ev

if ! grep -q "webextension-polyfill" package.json; then
    echo "webextension-polyfill not found in package.json"
    cat package.json
    exit 1
fi;

if ! grep -q "web-ext-types" package.json; then
    echo "web-ext-types not found in package.json"
    cat package.json
    exit 1
fi;

if grep -q "@types/chrome" package.json; then
    echo "@types/chrome should not be in package.json"
    cat package.json
    exit 1
fi;
