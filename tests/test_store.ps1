$ErrorActionPreference = "Stop"

Test-Path src/store/actions.js | Assert-True
Test-Path src/store/getters.js | Assert-True
Test-Path src/store/index.js | Assert-True
Test-Path src/store/mutation-types.js | Assert-True
Test-Path src/store/mutations.js | Assert-True

if (Get-Content package.json | Assert-NotContain "vuex")
{
    echo "Vuex not found in package.json"
    Get-Content package.json
    exit 1
}

if (Get-Content src/background.js | Assert-NotContain "import store from './store'")
{
    echo "Line « import store from './store' » not found in src/background.js"
    Get-Content src/background.js
    exit 2
}

if (Get-Content src/popup/popup.js | Assert-NotContain "import store from '../store'")
{
    echo "Line « import store from '../store' » not found in src/popup/popup.js"
    Get-Content src/popup/popup.js
    exit 2
}

if (Get-Content src/popup/popup.js | Assert-NotContain "store,")
{
    echo "Line « store, » not found in src/popup/popup.js"
    Get-Content src/popup/popup.js
    exit 2
}
