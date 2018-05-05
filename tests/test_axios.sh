#!/usr/bin/env bash

set -ev

if ! grep -q "axios" package.json; then
    echo "Axios not found in package.json"
    cat package.json
    exit 1
fi;
