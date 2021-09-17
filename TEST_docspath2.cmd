pause
powershell -Command "[Environment]::GetFolderPath('MyDocuments') | Out-File 'docspath.tmp' -Encoding ascii"
set /p DOCSPATH=< docspath.tmp
del docspath.tmp
echo %DOCSPATH%
pause