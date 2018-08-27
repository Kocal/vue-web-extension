$ErrorActionPreference = "Stop"

Test-Path src/store/actions.js | Assert-True
Test-Path src/store/getters.js | Assert-True
Test-Path src/store/index.js | Assert-True
Test-Path src/store/mutation-types.js | Assert-True
Test-Path src/store/mutations.js | Assert-True

if ((Get-Content package.json | Out-String) -like "*vuex*")
{
    Get-Content package.json
    throw "Vuex not found in package.json"
}

if ((Get-Content src/background.js | Out-String) -like "*import store from './store'*")
{
    Get-Content src/background.js
    throw "Line « import store from './store' » not found in src/background.js"
}

if ((Get-Content src/popup/popup.js | Out-String) -like "*import store from '../store'*")
{
    Get-Content src/popup/popup.js
    throw "Line « import store from '../store' » not found in src/popup/popup.js"
}

if ((Get-Content src/popup/popup.js | Out-String) -like "*store,*")
{
    Get-Content src/popup/popup.js
    throw "Line « store, » not found in src/popup/popup.js"
}
