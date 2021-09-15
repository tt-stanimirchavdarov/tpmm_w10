#:::::::::::::
#::TPMM v3.6::
#:::::::::::::


$TPMMPATH="C:\ThinTech"
$USERDRIVE=(Get-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" -Name "Personal").Personal

#::OS detection
$Version="w10"

#::Finds the Users SID
#for /f "Tokens=1-5 delims=," %%a in ('whoami /user /fo csv') do set User=%%~a& SET SID=%%~b

#::Changes the Profile to Mandatory
#echo Windows Registry Editor Version 5.00 >>%temp%\Mandatory.reg
#echo.>>%temp%\Mandatory.reg
#echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\%SID%]>>%temp%\Mandatory.reg
#echo "State"=dword:00000080>>%temp%\Mandatory.reg

#%systemroot%\regedit /s %temp%\Mandatory.reg


#::OPS file saving and copying to Profile Share

cmd /c "$TPMMPATH\tpmm.exe /s $USERDRIVE\MySettings_$Version.ops /i $TPMMPATH\Profile_Settings_$Version.ini" 

#::Get user file type associations
#"%TPMMPATH%\FTAs\GetUserFTA\GetUserFTA.exe" > "%USERDRIVE%\Profile_Settings\SetUserFTA.config"

#::Get Default Browser
#cscript "%TPMMPATH%\VBS\getbrowser.vbs"

#::Creates a backup of the users OPS file
#for /f "Tokens=1-5 delims=/" %%a in ('echo %Date%') do Set dd=%%a& Set mm=%%b& Set yy=%%c

#if /i not exist "%USERDRIVE%\Profile_Settings\Backups" MD "%USERDRIVE%\Profile_Settings\Backups"
#if /i exist "%USERDRIVE%\Profile_Settings\Backups\%dd%%mm%%yy%.ops" GOTO :EOF

#Copy /y "%USERDRIVE%\Profile_Settings\MySettings_%version%.ops" "%USERDRIVE%\Profile_Settings\Backups\%Version%_%dd%%mm%%yy%.ops"

#forfiles -p "U:\Profile_Settings\Backups" -m *.ops -d -3 -c "cmd /c del /q @path"
