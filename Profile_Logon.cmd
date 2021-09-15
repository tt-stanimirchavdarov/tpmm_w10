:::::::::::::
::TPMM v3.6 W10::
:::::::::::::

@echo off

SET TPMMPATH=\\%userdomain%\Netlogon\TPMM
SET USERDRIVE=U:
SET SevenZipDir=\\%userdomain%\Netlogon\TPMM\7-ZipPortable\App\7-Zip64

Set Version=w10

::Loads the users custom settings
Copy /Y "%USERDRIVE%\Profile_Settings\MySettings_%version%.ops" "%Temp%\MySettings_%version%.ops"
if /i exist "%temp%\MySettings_%version%.ops" "%TPMMPATH%\TPMM.exe" /r "%Temp%\MySettings_%version%.ops" /q

::Load FileType assocs
::"%TPMMPATH%\FTAs\SetUserFTA\SetUserFTA.exe" "%USERDRIVE%\Profile_Settings\SetUserFTA.config"

::Load Default Browser
::cscript "%TPMMPATH%\VBS\setbrowser.vbs"

::Enable ClearType
"%TPMMPATH%\ClearType\ClearTypeSwitch.exe" s+ c+
