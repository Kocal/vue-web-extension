$ErrorActionPreference = "Stop"

Test-Path src/options/options.js | Assert-True
Test-Path src/options/options.html | Assert-True
Test-Path src/options/App.vue | Assert-True

Test-Path dist/options/options.html | Assert-True
Test-Path dist/options/options.js | Assert-True
Test-Path dist/options/options.css | Assert-True

if (Get-Content webpack.config.js | Assert-NotContain "'options/options': './options/options.js',")
{
    Get-Content webpack.config.js
    throw "Line « 'options/options': './options/options.js', » not found in webpack.config.js"
}

if (Get-Content webpack.config.js | Assert-NotContain  "{ from: 'options/options.html', to: 'options/options.html' },")
{
    Get-Content webpack.config.js
    throw "Line « { from: 'options/options.html', to: 'options/options.html' }, » not found in webpack.config.js"
}

if (Get-Content src/manifest.json | Assert-NotContain "\"page\": \"options/options.html\",")
{
    Get-Content src/manifest.json
    throw "Options page has not been correctly registered in src/manifest.json"
}
