$Private = (Get-ChildItem -Path (Join-Path $PSScriptRoot 'Private') -Filter *.ps1 -Recurse)
$Public = (Get-ChildItem -Path (Join-Path $PSScriptRoot 'Public') -Filter *.ps1 -Recurse)


foreach ($Script in $Public) {
    . $Script.FullName
    Export-ModuleMember $Script.BaseName
}

foreach ($Script in $Private) {
    . $Script.FullName
}