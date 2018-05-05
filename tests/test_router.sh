#!/usr/bin/env bash

set -ev

if ! grep -q "vue-router" package.json; then
    echo "Vue-Router not found in package.json"
    cat packages.json
    exit 1
fi;

test -f src/popup/router/pages/Index.vue
test -f src/popup/router/index.js
test -f src/popup/router/routes.js

if ! grep -ql "^import router from './router';$" src/popup/popup.js; then
    echo "Line « import router from './router'; » not found in src/popup/popup.js"
    cat src/popup/popup.js
    exit 2
fi;

if ! grep -ql "^[[:space:]][[:space:]]router,$" src/popup/popup.js; then
    echo "Line « router, » not found in src/popup/popup.js"
    cat src/popup/popup.js
    exit 2
fi;

