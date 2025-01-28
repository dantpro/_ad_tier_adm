# posh 1/2 - & "$(Split-Path $MyInvocation.MyCommand.Path)\myScript.ps1"
# posh 3   - & "$PSScriptRoot\myScript.ps1"

& "$PSScriptRoot\01-Create-Structure.ps1"
& "$PSScriptRoot\02-Create-Groups.ps1"
& "$PSScriptRoot\03-Add-MemberstoGroups.ps1"
& "$PSScriptRoot\04-Create-PSOs.ps1"
& "$PSScriptRoot\05-Create-GPOs.ps1" "$PSScriptRoot\gpo-list.csv"
#& "$PSScriptRoot\06-Create-ACEs.ps1"
& "$PSScriptRoot\06-Create-ACEs.ps1" LIVE
& "$PSScriptRoot\07-Create-Users.ps1"




           