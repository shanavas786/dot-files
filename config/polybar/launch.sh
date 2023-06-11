#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID polybar >/dev/null; do sleep 1; done

# m=$(xrandr --query | grep " connected" | cut -d" " -f1)
# cmd=(env "MONITOR=$m" polybar --reload main)
polybar --reload main 2> "$HOME/polybar-logs/polybar.log" &
