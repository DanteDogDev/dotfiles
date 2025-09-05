#!/bin/bash

# Screen brightness
screen_percent=$(brightnessctl -c backlight | grep -oP '\(\K[0-9]+(?=%)')

# Icon selection
if [ "$screen_percent" -lt 33 ]; then
  icon="󰃞"
elif [ "$screen_percent" -lt 66 ]; then
  icon="󰃟"
else
  icon="󰃠"
fi

# Keyboard backlight
brightness_file="/sys/class/leds/asus::kbd_backlight/brightness"
max_file="/sys/class/leds/asus::kbd_backlight/max_brightness"

if [[ -f "$brightness_file" && -f "$max_file" ]]; then
  current=$(<"$brightness_file")
  max=$(<"$max_file")
  kbd_percent=$(( 100 * current / max ))

  if [[ "$kbd_percent" -eq 0 ]]; then
    kbd_status="Keyboard Backlight: Off"
  else
    kbd_status="Keyboard Backlight: $kbd_percent%"
  fi
else
  kbd_status="Keyboard Backlight: N/A"
fi

# Tooltip message
tooltip="Screen Backlight: $screen_percent%\n$kbd_status"

# Output for Waybar
echo "{\"text\": \"$screen_percent% $icon\", \"tooltip\": \"$tooltip\"}"
