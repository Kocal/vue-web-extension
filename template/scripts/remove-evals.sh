#!/bin/bash

set -e

echo Running $0

BUNDLES_PATH=dist
BUNDLES=("background.js" "popup/popup.js")

for BUNDLE in ${BUNDLES[@]};
do
    FILE=${BUNDLES_PATH}/${BUNDLE}

    echo "Removing eval()'s from ${FILE}..."

    sed -e '/This works if eval is allowed (see CSP)/,+1d' ${FILE} > ${FILE}.tmp
    mv ${FILE}.tmp ${FILE}
    sed -e '/This works if the window reference is available/,+2d' ${FILE} > ${FILE}.tmp
    mv ${FILE}.tmp ${FILE}
done
