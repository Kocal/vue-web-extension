#!/usr/bin/env bash

set -ev

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$DIR/output"

echo "Checking version behavior..."
test $(jq -r '.version' src/manifest.json) = "null"
test $(jq -r '.version' package.json) = "1.0.0"
test $(jq -r '.version' dist/manifest.json) = "1.0.0"

echo "Upgrade version then build..."
yarn version --new-version major --no-git-tag-version
yarn build --display errors-only

echo "Version should be updated"
test $(jq -r '.version' src/manifest.json) = "null"
test $(jq -r '.version' package.json) = "2.0.0"
test $(jq -r '.version' dist/manifest.json) = "2.0.0"
