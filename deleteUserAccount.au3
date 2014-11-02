; this script will delete TEMP user
; You have to run it with the admin priviledge

RunWait(@COMSPEC & ' /c net user TEMP /del')