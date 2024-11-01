#!/bin/bash

killall -q polybar

# polybar example 2>&1 | tee -a /tmp/polybar.log & disown

polybar --config=$HOME/.config/bspwm/config.ini 2>&1 | tee -a /tmp/polybar.log & disown
polybar --config=$HOME/.config/bspwm/config2.ini 2>&1 | tee -a /tmp/polybar.log & disown
echo "Polybar launched ..."
