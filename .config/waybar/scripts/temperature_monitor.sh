#!/bin/bash

# This script currently does not work due to the fact that
# hwmon numbers change on reboot.
# Possible fix:
# https://github.com/polybar/polybar/issues/2078

# https://www.mankier.com/5/waybar-custom

# Coretemp (hwmon7)
temp1="$(cat /sys/class/hwmon/hwmon7/temp1_input)"
temp2="$(cat /sys/class/hwmon/hwmon7/temp2_input)"
temp3="$(cat /sys/class/hwmon/hwmon7/temp3_input)"
temp4="$(cat /sys/class/hwmon/hwmon7/temp4_input)"
temp5="$(cat /sys/class/hwmon/hwmon7/temp5_input)"
temp6="$(cat /sys/class/hwmon/hwmon7/temp6_input)"
temp7="$(cat /sys/class/hwmon/hwmon7/temp7_input)"
temp8="$(cat /sys/class/hwmon/hwmon7/temp8_input)"
temp9="$(cat /sys/class/hwmon/hwmon7/temp9_input)"

# GPU (hwmon5)
gpu_temp="$(cat /sys/class/hwmon/hwmon5/temp1_input)"
gpu_fan="$(cat /sys/class/hwmon/hwmon5/fan1_input)"

# Wifi (hwmon3)
wifi_temp="$(cat /sys/class/hwmon/hwmon3/temp1_input)"

text=${temp1::-3}°

tooltip="
Coretemp\n
temp1: ${temp1::-3}°\n
temp2: ${temp2::-3}°\n
temp3: ${temp3::-3}°\n
temp4: ${temp4::-3}°\n
temp5: ${temp5::-3}°\n
temp6: ${temp6::-3}°\n
temp7: ${temp7::-3}°\n
temp8: ${temp8::-3}°\n
temp9: ${temp9::-3}°\n
\n
GPU\n
temp: ${gpu_temp::-3}°\n
fan: ${gpu_fan}\n
\n
Wifi\n
temp: ${wifi_temp::-3}°
"

echo "{\"text\":\""$text"\", \"tooltip\":\""$tooltip"\"}"

exit 0