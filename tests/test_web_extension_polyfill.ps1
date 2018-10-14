$ErrorActionPreference = "Stop"

if (!(Get-Content package.json | Out-String) -like "*webextension-polyfill*")
{
    throw "webextension-polyfill not found in package.json"
    Get-Content package.json
}

if (!(Get-Content package.json | Out-String) -like "*web-ext-types*")
{
    throw "web-ext-types not found in package.json"
    Get-Content package.json
}

if ((Get-Content package.json | Out-String) -like "*@types/chrome*")
{
    throw "@types/chrome should not be in package.json"
    Get-Content package.json
}
