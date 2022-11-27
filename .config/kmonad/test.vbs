Set oShell = CreateObject ("Wscript.Shell")
Dim strArgs
strArgs = "cmd /c C:\Users\catki\Documents\dotfiles\.config\kmonad\kmonad-win.bat"
oShell.Run strArgs, 0, false
