$ErrorActionPreference = "Stop"

if (Get-Content package.json | Assert-NotContain "axios")
{
    Write-Color "Axios not found in package.json" -Color Red
    Get-Content package.json
    exit 1
}
