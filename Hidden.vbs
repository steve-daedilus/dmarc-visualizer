' //***************************************************************************
' // ***** Script Header *****
' // =======================================================
' // Silently launch a process
' // =======================================================
' //
' // File:      Hidden.vbs
' //
' // Purpose:   To provide a method of launching applications silently
' //
' //
' // ***** End Header *****
' //***************************************************************************
 
Set objShell = CreateObject("Shell.Application")
Set objWshShell = WScript.CreateObject("WScript.Shell")
Set objArgs = Wscript.Arguments
 
If (WScript.Arguments.Count >= 1) Then
    strFlag = WScript.Arguments(0)
    If (strFlag = "") OR (strFlag="help") OR (strFlag="/h") OR (strFlag="\h") OR (strFlag="-h") _
        OR (strFlag = "\?") OR (strFlag = "/?") OR (strFlag = "-?") OR (strFlag="h") _
        OR (strFlag = "?") Then
        DisplayUsage
        WScript.Quit
    Else
    ReDim args(WScript.Arguments.Count-1)
    For i = 0 To WScript.Arguments.Count-1
      If InStr(WScript.Arguments(i), " ") > 0 Then
        args(i) = Chr(34) & WScript.Arguments(i) & Chr(34)
      Else
        args(i) = WScript.Arguments(i)
      End If
    Next
 
    objWshShell.Run Join(args, " "),0   
    End If
Else
    DisplayUsage
    WScript.Quit
End If
 
Sub DisplayUsage
 
    WScript.Echo "Silently launch a process" & vbCrLf & _
                 "" & vbCrLf & _
                 "Purpose:" & vbCrLf & _
                 "------------" & vbCrLf & _
                 "To provide a method of launching applications silently" & vbCrLf & _
                 "" & vbCrLf & _
                 "Usage:   " & vbCrLf & _
                 "--------" & vbCrLf & _                 
                 "" & vbCrLf & _
                 "hidden.vbs application <arguments>" & vbCrLf & _
                 "" & vbCrLf & _
                 "" & vbCrLf & _
                 "Sample usage:" & vbCrLf & _
                 "-------------------" & vbCrLf & _              
                 "" & vbCrLf & _
                 "Hidden.vbs Powershell.exe -ExecutionPolicy Unrestricted -File C:\IT\PowerShell\PDF_Fix.ps1" & vbCrLf & _
                 "" & vbCrLf & _
                 "Hidden.vbs Install.bat" & vbCrLf & _
                 "" & vbCrLf & _
                 "" & vbCrLf
 
End Sub