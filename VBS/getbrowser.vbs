' wscript.echo browser
' Indentify default web browser
' By Jørgen Bigom 
' Updated Oct. 2015
' Updated and amended Stan Chavdarov Oct 2018

Set objFSO=CreateObject("Scripting.FileSystemObject")
		outFile="u:\Profile_settings\defaultbrowser.ini"
		set objFile = objFSO.CreateTextFile(outFile,True)
		objFile.Write browser
		objFile.close 

Function Browser
	Const HKEY_CURRENT_USER = &H80000001
	Const strKeyPath = "Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice"
	Const strValueName = "Progid"
	Dim strValue, objRegistry, i
' Browser list:
	Dim blist(6,1)
	blist(0,0) = "ie"	: blist(0,1) = "ie"
	blist(1,0) = "Edge"					: blist(1,1) = "appxq0fevzme2pys62n3e0fbqa7peapykr8v"
	blist(2,0) = "Firefox"				: blist(2,1) = "firefox"
	blist(3,0) = "Chrome"				: blist(3,1) = "chrome"
	blist(4,0) = "Safari"				: blist(4,1) = "safari"
	blist(5,0) = "Avant"				: blist(5,1) = "browserexeurl"
	blist(6,0) = "Opera"				: blist(6,1) = "opera"
	Set objRegistry = GetObject("winmgmts:\\.\root\default:StdRegProv")
	objRegistry.GetStringValue HKEY_CURRENT_USER,strKeyPath,strValueName,strValue
		
	If IsNull(strValue) Then
	    browser = "ie": Exit Function
	Else
	    For i = 0 To Ubound (blist, 1)
	    	If Instr (1, strValue, blist(i,1), vbTextCompare) Then browser = blist(i,0) & "" : Exit Function
		
	    Next
	End If

	browser = "Unknown web browser! (signature: '" & strValue & "')"
End Function