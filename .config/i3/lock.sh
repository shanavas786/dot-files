#!/bin/bash

i3lock -i $HOME/.config/i3/lock.png

# If still locked after 20 seconds, turn off screen.
sleep 20 && pgrep i3lock && xset dpms force off
