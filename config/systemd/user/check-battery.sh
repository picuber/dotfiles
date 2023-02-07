#!/bin/bash

level=$(cat /sys/class/power_supply/BAT0/capacity)
state=$(cat /sys/class/power_supply/BAT0/status)

LOW=15
CRITICAL=5
ACTION=2
FULL=90

if [ "$state" == "Discharging" ]; then
	if  [ "$level" -le "$ACTION" ]; then
		notify-send -u critical "Battery about to die. Suspending..."
		systemctl suspend
	elif [ "$level" -le "$CRITICAL" ]; then
		notify-send -u critical "Battery CRITICAL: $level%"
	elif  [ "$level" -le "$LOW" ]; then
		notify-send -u critical "Battery low: $level%"
	fi
elif [ "$state" == "Charging" ]; then
	if [ "$level" -ge "$FULL" ]; then
		notify-send -u critical "Battery full: $level%"
	fi
fi
exit 0
