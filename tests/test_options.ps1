Test-Path src/options/options.js | Assert-True
Test-Path src/options/options.html | Assert-True
Test-Path src/options/App.vue | Assert-True

Test-Path dist/options/options.html | Assert-True
Test-Path dist/options/options.js | Assert-True
Test-Path dist/options/options.css | Assert-True

if (Get-Content webpack.config.js | Assert-NotContain "'options/options': './options/options.js',")
{
    Write-Color "Line « 'options/options': './options/options.js', » not found in webpack.config.js" -Color Red
    Get-Content webpack.config.js
    exit 2
}

if (Get-Content webpack.config.js | Assert-NotContain  "{ from: 'options/options.html', to: 'options/options.html' },")
{
    echo "Line « { from: 'options/options.html', to: 'options/options.html' }, » not found in webpack.config.js"
    Get-Content webpack.config.js
    exit 2
}

if (Get-Content src/manifest.json | Assert-NotContain "\"page\": \"options/options.html\",")
{
    echo "Options page has not been correctly registered in src/manifest.json"
    Get-Content src/manifest.json
    exit 2
}
