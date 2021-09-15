#deploy tpmm via powershell
#Stan Chavdarov - Thintech Sep 2021

$tpmm_exe_Url = "https://github.com/tt-stanimirchavdarov/tpmm_w10/raw/99dcd234cd1b88bad00fbc1e55f2445e25f0eeb3/TPMM.exe"
$tpmm_exe_Target = "$env:APPDATA\TPMM.exe"

$ctxhide_Url = "https://raw.githubusercontent.com/tt-stanimirchavdarov/tpmm_w10/99dcd234cd1b88bad00fbc1e55f2445e25f0eeb3/ctxhide.exe"
$ctxhide_Target = "$env:APPDATA\ctxhide.exe"

$plogon_Url = "https://raw.githubusercontent.com/tt-stanimirchavdarov/tpmm_w10/99dcd234cd1b88bad00fbc1e55f2445e25f0eeb3/Profile_Logon.cmd"
$plogon_Target = "$env:APPDATA\Profile_Logon.cmd"

$plogoff_Url = "https://raw.githubusercontent.com/tt-stanimirchavdarov/tpmm_w10/99dcd234cd1b88bad00fbc1e55f2445e25f0eeb3/Profile_Logoff.cmd"
$plogoff_Target = "$env:APPDATA\Profile_Logoff.cmd"

$pini_Url = "https://raw.githubusercontent.com/tt-stanimirchavdarov/tpmm_w10/99dcd234cd1b88bad00fbc1e55f2445e25f0eeb3/Profile_Settings_w10.INI"
$pini_Target = "$env:APPDATA\Profile_Settings_w10.INI"



Invoke-WebRequest $tpmm_exe_Url -OutFile $tpmm_exe_Target
Invoke-WebRequest $ctxhide_Url -OutFile $ctxhide_Target
Invoke-WebRequest $plogon_Url -OutFile $plogon_Target
Invoke-WebRequest $plogoff_Url -OutFile $plogoff_Target
Invoke-WebRequest $pini_Url -OutFile $pini_Target

#Start-Process -FilePath $tpmm_exe_Target -Wait 


#Prepare logoff script:

$path = "$env:SystemRoot\system32\GroupPolicy\User\Scripts\Logoff"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}


Copy-Item $plogoff_Target -Destination "$env:SystemRoot\system32\GroupPolicy\User\Scripts\Logoff"