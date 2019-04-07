@ECHO OFF
//PowerShell.exe -Command "Get-Content DirtyBoot.ps1 | PowerShell.exe -noprofile -"
//PowerShell.exe -ExecutionPolicy Bypass -Command "& '%~dpn0.ps1'"
powershell.exe -ExecutionPolicy Bypass -File DirtyBoot.ps1
PAUSE