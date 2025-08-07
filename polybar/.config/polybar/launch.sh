#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
killall -q polybar

# Launch bar
echo "---" | tee -a /tmp/polybar1.log
polybar bar 2>&1 | tee -a /tmp/polybar1.log &
disown

# Launch bar for second monitor (may have multiple names)
if [[ $(xrandr -q | grep 'DP-4 connected') ]]; then
    polybar bartwo &
fi

echo "Bars launched..."
