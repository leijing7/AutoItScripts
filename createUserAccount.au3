;Note: you HAVE TO run the build exe app with administrator privilege; otherwwise it won't work
;right click the exe file; then Run as administrator

#include <GUIConstantsEx.au3>

create()

Func create()
    Local $create_button, $cancel_button, $msg

    GUICreate(" Create an Admin Account", 320, 160, @DesktopWidth / 2 - 160, @DesktopHeight / 2 - 45, -1, 0x00000018)
    GUICtrlCreateLabel("User Name", 10, 30)
	$user_account = GUICtrlCreateInput("", 80, 30, 120, 20)
	GUICtrlCreateLabel("Password", 10, 80)
    GUICtrlCreateInput("defaultPassword", 80, 80, 100, 20)

	$create_button = GUICtrlCreateButton("Create", 40, 120, 60, 20)
    $cancel_button = GUICtrlCreateButton("Cancel", 200, 120, 60, 20)

    GUISetState() ; display the gui

    ; Run the GUI until the dialog is closed
    While 1
        $msg = GUIGetMsg()
        Select
            Case $msg = $GUI_EVENT_CLOSE
                ExitLoop
            Case $msg = $create_button
                $str1 = " /c net user /add " & '"' & GUICtrlRead($user_account) & '"' & " marcs"
			    RunWait(@COMSPEC & $str1)
				$str2 = " /c net localgroup administrators " & '"' & GUICtrlRead($user_account) & '"' & " /add"
			    RunWait(@COMSPEC & $str2)
				$str = GUICtrlRead($user_account) & "   account is created with the specified password"
			    MsgBox(4096, "Account", $str)
				ExitLoop
            Case $msg = $cancel_button
                ExitLoop
        EndSelect
    WEnd
 EndFunc