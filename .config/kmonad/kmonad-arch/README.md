Autostart kmonad as a systemd service (before login)

https://github.com/kmonad/kmonad/blob/master/startup/kmonad.service
Create symbolic link to kmonad.service in /etc/systemd/system.
    cd /etc/systemd/system
    ln -s /home/catkins/.config/kmonad/kmonad-arch/kmonad.service .
    systemctl status kmonad.service
    sudo systemctl enable kmonad.service
    sudo systemctl start kmonad.service
This will start kmonad with the specified config at boot (before login).

If you make changes to the .kbd, reload with:
    sudo systemctl restart kmonad.service