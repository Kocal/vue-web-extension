Write-Host "Checking version behavior..."
(Get-Content './src/manifest.json' | ConvertFrom-Json).version | Assert-Null
(Get-Content './package.json' | ConvertFrom-Json).version | Assert-StringEqual -Expected "1.0.0"
(Get-Content './dist/manifest.json' | ConvertFrom-Json).version | Assert-StringEqual -Expected "1.0.0"

Write-Host "Upgrade version then build..."
yarn version --new-version major --no-git-tag-version
yarn build --display errors-only

Write-Host "Version should be updated"
(Get-Content './src/manifest.json' | ConvertFrom-Json).version | Assert-Null
(Get-Content './package.json' | ConvertFrom-Json).version | Assert-StringEqual -Expected "2.0.0"
(Get-Content './dist/manifest.json' | ConvertFrom-Json).version | Assert-StringEqual -Expected "2.0.0"
