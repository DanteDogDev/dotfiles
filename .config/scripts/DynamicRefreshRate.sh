#!/bin/bash

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

display_info=$(gnome-monitor-config list)
refresh_rate=$(echo "$display_info" | grep CURRENT | grep -oP '\d+x\d+@\K[0-9.]+' | head -n1)
refresh_rate_int=${refresh_rate%%.*}

if [[ "$power_status" == "1" ]]; then
  if [[ "$refresh_rate_int" == "60" ]]; then
    gnome-monitor-config set -LpM eDP-1 -t normal -m 2880x1800@120.000 -s 1.25
  fi
else
  if [[ "$refresh_rate_int" == "120" ]]; then
    gnome-monitor-config set -LpM eDP-1 -t normal -m 2880x1800@60.001 -s 1.25
  fi
fi
