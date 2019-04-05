#!/usr/bin/env bash

scenarios=( full full-airbnb minimal )

for scenario in "${scenarios[@]}"
do
    echo "-------------------------------"
    echo "Generating example $scenario..."

    echo "Removing previous example..."
    cd examples
    rm -fr $scenario

    echo "Generating new example"
    VUE_TEMPLATE=$scenario vue init .. $scenario
    cd $scenario
    cat << EOF > README.md
# Project: Minimal

This project has been generated with \`vue init kocal/vue-web-extension .\` command, following [$scenario scenario](../../scenarios/minimal.json).
EOF

    echo "Installing dependencies"
    yarn

    if [[ "$scenario" =~ ^full ]];then
        echo "Linting..."
        yarn lint --fix;
    fi

    if [[ "$scenario" =~ ^full ]];then
        echo "Prettying..."
        yarn prettier:write;
    fi

    echo "Commiting..."
    git add .
    git commit -m "chore(example): update \"$scenario\" example" --no-verify

    cd ../..
done
