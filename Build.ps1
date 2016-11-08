#build module script
[cmdletbinding()]
Param(
    [string]$ModuleName = "PowerPlan"
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
    Remove-Module $ModuleName -Verbose:$false -ErrorAction SilentlyContinue
}
#endregion