:: Starts the kmonad binary with the .kbd configuration as the arg.
:: 	(find the exe binary here: https://github.com/kmonad/kmonad/releases)
:: Update to your local binary and .kbd path.
:: Terminal is hidden after starting.
:: Don't forget to add this .bat to your antivirus exceptions, as it might detect it as a false positive.
:: Create a Basic Task in Computer Management > Task Scheduler > Create Basic Task.
:: Point it to the .bat file, modify the rest of the settings as desired.

taskkill /IM kmonad-win.exe /F

start "C:\Users\catki\Documents\dotfiles\.config\kmonad\kmonad-win.exe" "C:\Users\catki\Documents\dotfiles\.config\kmonad\colemakdh_extended_windows.kbd"