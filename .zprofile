if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
  # exec sway -V > /home/catkins/swaylog.txt 2>&1
  exec sway;
fi
