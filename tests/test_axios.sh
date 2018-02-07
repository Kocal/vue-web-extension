#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR/output"

echo "Checking Axios..."

grep axios package.json 2>&1 >/dev/null
