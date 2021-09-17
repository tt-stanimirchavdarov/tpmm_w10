#Logoff script setup Machine part
copy-item "C:\temp\scripts.ini" "C:\Windows\System32\GroupPolicy\User\Scripts\scripts.ini"
copy-item "C:\temp\logoff.cmd" "C:\Windows\System32\GroupPolicy\User\Scripts\Logoff\logoff.cmd"
