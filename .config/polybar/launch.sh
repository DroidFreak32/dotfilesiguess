#!/usr/bin/env sh

# Terminate already running bar instances
pkill polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
# polybar top &
if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --config="$HOME/.config/polybar/config" base &
        sleep 1
    done
else
	polybar --config="$HOME/.config/polybar/config" base &
fi
echo "Bars launched..."
