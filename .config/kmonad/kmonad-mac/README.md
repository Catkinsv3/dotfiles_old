Building, running and autostarting kmonad on MacOS

https://github.com/kmonad/kmonad/blob/master/doc/installation.md#installing-the-dext

We must install using the dext (not kext), as we are using macos >11.
Dext is faster anyway, with less dependencies.

Check your dext version:
defaults read /Applications/.Karabiner-VirtualHIDDevice-Manager.app/Contents/Info.plist CFBundleVersion

If the version is higher or lower than 1.15, we must install 1.15 (more recent versions have breaking changes):
cd ~
mkdir kmonad
cd kmonad/
git clone --recursive https://github.com/kmonad/kmonad.git
cd kmonad/
open c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/dist/Karabiner-DriverKit-VirtualHIDDevice-1.15.0.pkg
/Applications/.Karabiner-VirtualHIDDevice-Manager.app/Contents/MacOS/Karabiner-VirtualHIDDevice-Manager activate

If activation failed (e.g. because a newer version is already installed), replace activate in the above command with forceActivate and try again.

Builld kmonad using dext:
(don't do stack init, we already have stack initialised from git)
stack build --flag kmonad:dext --extra-include-dirs=c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/include/pqrs/karabiner/driverkit:c_src/mac/Karabiner-DriverKit-VirtualHIDDevice/src/Client/vendor/include

Kmonad binary will now be installed to somewhere like:
/Users/christopheratkinson/kmonad/kmonad/.stack-work/install/aarch64-osx/ac3c61d15f02cd084bf651524811be0f38ffca7adac6cedf1ee60cfbac7c7fcc/8.10.7/bin/kmonad
We can copy this binary and put it wherever we like.
(Remember to update Input Monitoring permissions for the kmonad binary if you move it)

We can activate our .kbd (sudo is required):
sudo path/to/kmonad path/to/config.kbd

We can now autorun kmonad with our config on startup using a launch daemon:
https://github.com/kmonad/kmonad/issues/105
Create a /Library/LaunchDaemons/local.kmonad.plist file with this content (update paths):
<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>local.kmonad</string>
    <key>Program</key>
    <string>/path/to/kmonad</string>
    <key>ProgramArguments</key>
    <array>
      <string>/path/to/kmonad</string>
      <string>/path/to/keymap.kbd</string>
    </array>
    <key>RunAtLoad</key>
    <true />
    <key>StandardOutPath</key>
    <string>/tmp/kmonad.stdout</string>
    <key>StandardErrorPath</key>
    <string>/tmp/kmonad.stderr</string>
  </dict>
</plist>

We can check /tmp/kmonad.stderr if it's not working.

Give Input Monitoring permission to:
path/to/kmonad
/bin/launchctl
(karabiner_grabber and karabiner_observer should also have these permissions)
(your terminal may also need this permission)
NOTE: To find the install location of any package, use `which package_name`.
NOTE: Press Cmd+Shift+. to show hidden files/folders in finder.

All done, your kmonad layout should now be applied automatically on boot.

Confirm kmonad is in the launchd service list:
sudo launchctl list | grep kmonad
(launchctl list without sudo shows the user's services, not root services)

Start service manually:
sudo launchctl load -w /Library/LaunchDaemons/local.kmonad.plist

Stop service manually:
sudo launchctl unload /Library/LaunchDaemons/local.kmonad.plist

Restart running service:
sudo launchctl kickstart -k /Library/LaunchDaemons/local.kmonad.plist

TODO: make symlink to plist in dotfiles directory.
TODO: Currently activates *after* login. Need to figure out how to activate on boot. /System/Library/LaunchDaemons?
TODO: Modify layout for builtin keyboard.
TODO: Separate layout per input device (can this work on macos?)
TODO: https://github.com/kmonad/kmonad/blob/master/doc/faq.md#q-how-to-use-the-special-features-printed-on-apple-function-keys
TODO: https://github.com/kmonad/kmonad/blob/master/keymap/template/apple.kbd

https://github.com/Catkinsv3/dotfiles/blob/master/.config/kmonad/tutorial.kbd