' Stan Chavdarov Oct 2018
' Set default browser

Const ForReading = 1
Set oShell = Wscript.CreateObject("Wscript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objTextFile = objFSO.OpenTextFile _
    ("u:\profile_settings\defaultbrowser.ini", ForReading)

Do Until objTextFile.AtEndOfStream
    strNextLine = objTextFile.Readline
    arrServiceList = Split(strNextLine , ",")
'    Wscript.Echo "Server name: " & arrServiceList(0)
if arrServiceList(0) = "chrome" then oShell.run "\\tmbc.local\netlogon\tpmm\ftas\setdefaultbrowser\setdefaultbrowser.exe chrome"
if arrServiceList(0) = "Chrome" then oShell.run "\\tmbc.local\netlogon\tpmm\ftas\setdefaultbrowser\setdefaultbrowser.exe chrome"
if arrServiceList(0) = "ie" then oShell.run "\\tmbc.local\netlogon\tpmm\ftas\setdefaultbrowser\setdefaultbrowser.exe ie"


    For i = 1 to Ubound(arrServiceList)
        Wscript.Echo "Service: " & arrServiceList(i)
    Next
Loop