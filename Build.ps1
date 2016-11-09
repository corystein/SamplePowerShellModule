#build module script
[cmdletbinding()]
Param(
    [string]$ModuleName = "SampleModule"
    ,
    [switch]$Major
    ,
    [switch]$Minor
    ,
    [switch]$LoadModule
)

$F = $MyInvocation.InvocationName

$ModuleFileName = "$ModuleName.psm1"

Write-Verbose -Message "$f - Modulename is $ModuleName at $PSScriptRoot"

Write-Verbose -Message "$F - Starting build, getting files"

#region Remove Module if found
if (Get-Module -Name $ModuleName)
{
    Write-Verbose "$F - Removing $ModuleName module"
    Remove-Module -Name $ModuleName -Force -ErrorAction SilentlyContinue
}
#endregion

Write-Verbose "Loading module [$ModuleName]..."
Import-Module ./$ModuleName -Force -Verbose -Scope Global

Get-Module -Name $ModuleName 

TestHelperFunc