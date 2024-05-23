#!/bin/bash

killall -q polybar

# polybar example 2>&1 | tee -a /tmp/polybar.log & disown

polybar --config=$HOME/.config/bspwm/rices/emilia/config.ini 2>&1 | tee -a /tmp/polybar.log & disown
polybar --config=$HOME/.config/bspwm/rices/emilia/config2.ini 2>&1 | tee -a /tmp/polybar.log & disown
echo "Polybar launched ..."
