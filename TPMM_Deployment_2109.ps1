#deploy tpmm via powershell - to be run as an admin from Intune
#Stan Chavdarov - Thintech Sep 2021

#1 deployment script to download and set as logoff scheduled tasks - run as admin - this one!!

#2 profile_logon from my docs. with a script to check and wait until the OPS is downloaded


#prepare ThinTech folder on C:
$path = "c:\Thintech"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}

#download TPMM into the folder
$tpmm_exe_Url = "https://github.com/tt-stanimirchavdarov/tpmm_w10/raw/99dcd234cd1b88bad00fbc1e55f2445e25f0eeb3/TPMM.exe"
$tpmm_exe_Target = "$path\TPMM.exe"

$ctxhide_Url = "https://raw.githubusercontent.com/tt-stanimirchavdarov/tpmm_w10/99dcd234cd1b88bad00fbc1e55f2445e25f0eeb3/ctxhide.exe"
$ctxhide_Target = "$path\ctxhide.exe"

$plogon_Url = "https://raw.githubusercontent.com/tt-stanimirchavdarov/tpmm_w10/99dcd234cd1b88bad00fbc1e55f2445e25f0eeb3/Profile_Logon.cmd"
$plogon_Target = "$path\Profile_Logon.cmd"

$plogoff_Url = "https://raw.githubusercontent.com/tt-stanimirchavdarov/tpmm_w10/99dcd234cd1b88bad00fbc1e55f2445e25f0eeb3/Profile_Logoff.ps1"
$plogoff_Target = "$path\Profile_Logoff.ps1"

$pini_Url = "https://raw.githubusercontent.com/tt-stanimirchavdarov/tpmm_w10/99dcd234cd1b88bad00fbc1e55f2445e25f0eeb3/Profile_Settings_w10.INI"
$pini_Target = "$path\Profile_Settings_w10.INI"



Invoke-WebRequest $tpmm_exe_Url -OutFile $tpmm_exe_Target
Invoke-WebRequest $ctxhide_Url -OutFile $ctxhide_Target
Invoke-WebRequest $plogon_Url -OutFile $plogon_Target
Invoke-WebRequest $plogoff_Url -OutFile $plogoff_Target
Invoke-WebRequest $pini_Url -OutFile $pini_Target

#Start-Process -FilePath $tpmm_exe_Target -Wait 

#set the logoff script
cmd.exe /c "schtasks /create /sc minute /mo 60 /tn TPMM_Logoff /tr $plogoff_Target"
