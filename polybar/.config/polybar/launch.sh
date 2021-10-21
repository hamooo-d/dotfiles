#!/bin/bash
# More info : https://github.com/jaagr/polybar/wiki

# Install the following applications for polybar and icons in polybar if you are on ArcoLinuxD
# awesome-terminal-fonts
# Tip : There are other interesting fonts that provide icons like nerd-fonts-complete
# --log=error
# Terminate already running bar instances
killall -q polybar

# Wait until the processes havh been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

# if type "xrandr"; then
#   for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
#     MONITOR=$m polybar --reload mainbar-i3  &
#   done
# else
#   polybar --reload mainbar-i3  &
# 
# fi
polybar -q main &
polybar -q main-1 &
