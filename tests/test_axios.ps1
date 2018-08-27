$content = (Get-Content package.json)

if ($content | Assert-NotContain "axios")
{
    Write-Color "Axios not found in package.json" -Color Red
    echo $content
    exit 1
}
