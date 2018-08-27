$ErrorActionPreference = "Stop"

Test-Path src/popup/router/pages/Index.vue | Assert-True
Test-Path src/popup/router/index.js | Assert-True
Test-Path src/popup/router/routes.js | Assert-True

if (Get-Content package.json | Assert-NotContain "vue-router")
{
    Get-Content package.json
    throw "Vue-router not found in package.json"
}

if (Get-Content src/popup/popup.js | Assert-NotContain "import router from './router'")
{
    Get-Content src/popup/popup.js
    throw "Line « import router from './router' » not found in src/popup/popup.js"
}

if (Get-Content src/popup/popup.js | Assert-NotContain "router,")
{
    Get-Content src/popup/popup.js
    throw "Line « router, » not found in src/popup/popup.js"
}

