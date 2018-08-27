$ErrorActionPreference = "Stop"

Test-Path src/popup/router/pages/Index.vue | Assert-True
Test-Path src/popup/router/index.js | Assert-True
Test-Path src/popup/router/routes.js | Assert-True

if (Get-Content package.json | Assert-NotContain "vue-router")
{
    echo "Vue-router not found in package.json"
    Get-Content package.json
    exit 1
}

if (Get-Content src/popup/popup.js | Assert-NotContain "import router from './router'")
{
    echo "Line « import router from './router' » not found in src/popup/popup.js"
    Get-Content src/popup/popup.js
    exit 2
}

if (Get-Content src/popup/popup.js | Assert-NotContain "router,")
{
    echo "Line « router, » not found in src/popup/popup.js"
    Get-Content src/popup/popup.js
    exit 2
}

