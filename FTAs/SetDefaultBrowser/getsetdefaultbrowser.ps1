 #Stan Chavdarov 2018 #remember default browser
 Param(
  [string]$action
  )
 
 #$action="set"
 $profilelocation="U:"
 $setdefaultbrowserpath="\\tmbc.local\netlogon\TPMM\FTAs\SetDefaultBrowser"

 if ($action -eq "get"){
      
     $defbrowser=(Get-ItemProperty HKCU:\Software\Microsoft\windows\Shell\Associations\UrlAssociations\http\UserChoice).Progid
 
     Write-Host $defbrowser
     gci "$profilelocation\*.tt" | Remove-Item
     if ($defbrowser -eq "ChromeHTML") {$defbrowsername="Chrome"}
     if ($defbrowser -eq "IE.http") {$defbrowsername="ie"}
     #if ($defbrowser -eq "ChromeHTML") {$defbrowsername="Chrome"}
     New-Item "$profilelocation\$defbrowsername.tt" -type file
}

 if ($action -eq "set"){

     
     $defbrowser=(Get-ItemProperty HKCU:\Software\Microsoft\windows\Shell\Associations\UrlAssociations\http\UserChoice).Progid
     $setdefbrowser = gci "$profilelocation\*.tt"
     $setbrowsername=$setdefbrowser.Name
     $setbrowsername
     if ($setbrowsername -eq "ie.tt") {$defbrowsername="ie"}
     if ($setbrowsername -eq "Chrome.tt") {$defbrowsername="Chrome"}
     Write-Host "Setting $defbrowsername as default browser"
     start-process -filepath "$setdefaultbrowserpath\SetDefaultBrowser.exe" -ArgumentList $defbrowsername
     
}
