;You don't have to run this with the admin privilege

#include <Constants.au3>

Local $foo = Run(@COMSPEC & " /c net user", @SystemDir, @SW_HIDE, $STDERR_CHILD + $STDOUT_CHILD)
Local $line
While 1
    $line = StdoutRead($foo)
    If @error Then ExitLoop
    If (StringLen($line) >0) Then MsgBox(0, "STDOUT read:", $line )
WEnd

While 1
    $line = StderrRead($foo)
    If @error Then ExitLoop
    MsgBox(0, "STDERR read:", $line)
WEnd