#!/bin/bash
# @author Xein

brightness_file="/sys/class/leds/asus::kbd_backlight/brightness"
max_file="/sys/class/leds/asus::kbd_backlight/max_brightness"

if [[ -f "$brightness_file" && -f "$max_file" ]]; then
  current=$(<"$brightness_file")
  max=$(<"$max_file")
  percent=$(( 100 * current / max ))

  if [[ "$percent" -eq 0 ]]; then
    echo "{\"text\": \"󰌐 \", \"class\": [\"off\"], \"tooltip\": \"Backlight off\"}"
  else
    echo "{\"text\": \"$percent% 󰌌 \", \"class\": [\"on\"], \"tooltip\": \"Backlight at $percent%\"}"
  fi
else
  echo "{\"text\": \" ERROR\", \"class\": [\"error\"], \"tooltip\": \"Could not read backlight\"}"
fi

