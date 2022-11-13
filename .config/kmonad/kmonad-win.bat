:: Starts the kmonad binary with the .kbd configuration as the arg.
:: 	(find the exe binary here: https://github.com/kmonad/kmonad/releases)
:: Update to your local binary and .kbd path.
:: Terminal is hidden after starting.
:: Don't forget to add this .bat to your antivirus exceptions, as it might detect it as a false positive.
:: Put a shortcut to this in shell:startup.

powershell "start C:\Users\catki\Documents\dotfiles\.config\kmonad\kmonad-win.exe -Args \"C:\Users\catki\Documents\dotfiles\.config\kmonad\colemakdh_extended_windows.kbd" -WindowStyle Hidden"
