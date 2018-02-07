#!/usr/bin/env bash

set -ev

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR/output"

echo "Checking Axios..."

if ! grep -q "axios" package.json; then
    echo "Axios not found in package.json"
    exit 1
fi;
