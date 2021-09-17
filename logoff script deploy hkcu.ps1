#Logoff script setup User part
New-Item –Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Group Policy\Scripts" –Name "Logoff"
New-Item –Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Group Policy\Scripts\Logoff" –Name "0"
New-ItemProperty -Path "HKCU:\Microsoft\Windows\CurrentVersion\Group Policy\Scripts\Logoff\0" -Name "GPO-ID" -Value ”LocalGPO”  -PropertyType "String"

New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Group Policy\Scripts\Logoff\0" -Name "SOM-ID" -Value ”Local”  -PropertyType "String"
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Group Policy\Scripts\Logoff\0" -Name "FileSysPath" -Value ”C:\WINDOWS\System32\GroupPolicy\User”  -PropertyType "String"
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Group Policy\Scripts\Logoff\0" -Name "DisplayName" -Value ”Local Group Policy”  -PropertyType "String"
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Group Policy\Scripts\Logoff\0" -Name "GPOName" -Value ”Local Group Policy”  -PropertyType "String"
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Group Policy\Scripts\Logoff\0" -Name "PSScriptOrder" -Value 1  -PropertyType "dword"

New-Item –Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Group Policy\Scripts\Logoff\0" –Name "0"
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Group Policy\Scripts\Logoff\0\0" -Name "Script" -Value ”C:\temp\Profile_logoff.cmd”  -PropertyType "String"
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Group Policy\Scripts\Logoff\0\0" -Name "Parameters" -Value ””  -PropertyType "String"
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Group Policy\Scripts\Logoff\0\0" -Name "IsPowershell" -Value 0  -PropertyType "dword"

New-Item –Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Group Policy\Scripts" –Name "Logon"



