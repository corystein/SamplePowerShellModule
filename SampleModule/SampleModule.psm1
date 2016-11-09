$Private = (Get-ChildItem -Path (Join-Path $PSScriptRoot 'Private') -Filter *.ps1 -Recurse)
$Public = (Get-ChildItem -Path (Join-Path $PSScriptRoot 'Public') -Filter *.ps1 -Recurse)


foreach ($Script in $Public) {
    . $Script.FullName
    #Write-Host "Loading public function [$($Script.FullName)]..."
    Export-ModuleMember $Script.BaseName
}

foreach ($Script in $Private) {
    #Write-Host "Sourcing private files [$($Script.FullName)]..."
    . "$($Script.FullName)"
}

