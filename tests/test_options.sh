#!/usr/bin/env bash

set -ev

test -f src/options/options.js
test -f src/options/options.html
test -f src/options/App.vue

test -f dist/options/options.html
test -f dist/options/options.js
test -f dist/options/options.css

if ! grep -ql "'options/options': './options/options.js'," webpack.config.js ; then
    echo "Line « 'options/options': './options/options.js', » not found in webpack.config.js"
    cat webpack.config.js
    exit 2
fi;

if ! grep -ql "{ from: 'options/options.html', to: 'options/options.html' }," webpack.config.js ; then
    echo "Line « { from: 'options/options.html', to: 'options/options.html' }, » not found in webpack.config.js"
    cat webpack.config.js
    exit 2
fi;

if ! grep -ql "\"page\": \"options/options.html\"," src/manifest.json ; then
    echo "Options page has not been correctly registered in src/manifest.json"
    cat src/manifest.json
    exit 2
fi;
