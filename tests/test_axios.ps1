$ErrorActionPreference = "Stop"

if (!(Get-Content package.json | Out-String) -like "*axios*")
{
    throw "Axios not found in package.json"
    Get-Content package.json
}
