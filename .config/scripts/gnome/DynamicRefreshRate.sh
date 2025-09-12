#!/bin/bash
#
# IMPORTANT REPLACE "username"
# Install gnome-monitor-config

# /etc/systemd/system/dynamic-refresh.service
# [Unit]
# Description=Dynamic Refresh Rate Script
# After=graphical.target
# Wants=graphical.target
#
# [Service]
# Type=oneshot
# User=dantedogdev
# Environment=DISPLAY=:0
# Environment=XAUTHORITY=/home/dantedogdev/.Xauthority
# Environment=DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
# ExecStart=/usr/bin/DynamicRefreshRate.sh

# /etc/udev/rules.d/DynamicRefreshRate.rules
# ACTION=="change", SUBSYSTEM=="power_supply", TAG+="systemd", ENV{SYSTEMD_WANTS}="dynamic-refresh.service"

power_status=$(cat /sys/class/power_supply/ACAD/online 2>/dev/null)
display_info=$(gnome-monitor-config list)
refresh_rate=$(echo "$display_info" | grep CURRENT | grep -oP '\d+x\d+@\K[0-9.]+' | head -n1)
refresh_rate_int=${refresh_rate%%.*}
scale=$(gnome-monitor-config list | grep 'Logical monitor' | grep -o 'scale = [^,]*' | awk '{print $3}')

echo scale: $scale
echo Hz: $refresh_rate_int, Power: $power_status

if [[ "$power_status" == "1" ]]; then
    powerprofilesctl set performance
  if [[ "$refresh_rate_int" == "60" ]]; then
    gnome-monitor-config set -LpM eDP-1 -t normal -m 2880x1800@120.000 -s $scale
    echo Changing Hz to 120
    exit 0
  fi
  echo Hz is already 120
else
    powerprofilesctl set power-saver
  if [[ "$refresh_rate_int" == "120" ]]; then
    gnome-monitor-config set -LpM eDP-1 -t normal -m 2880x1800@60.001 -s $scale
    echo Changing Hz to 60
    exit 0
  fi
  echo Hz is already 60
fi
