#!/usr/bin/env bash

set -ev

if ! grep -q "vuex" package.json; then
    echo "Vuex not found in package.json"
    cat packages.json
    exit 1
fi;

test -f src/store/actions.js
test -f src/store/getters.js
test -f src/store/index.js
test -f src/store/mutation-types.js
test -f src/store/mutations.js

if ! grep -ql "import store from './store'" src/background.js; then
    echo "Line « import store from './store' » not found in src/background.js"
    cat src/background.js
    exit 2
fi;

if ! grep -ql "import store from '../store'" src/popup/popup.js; then
    echo "Line « import store from '../store' » not found in src/popup/popup.js"
    cat src/popup/popup.js
    exit 2
fi;

if ! grep -ql "[[:space:]][[:space:]]store," src/popup/popup.js; then
    echo "Line « store, » not found in src/popup/popup.js"
    cat src/popup/popup.js
    exit 2
fi;
