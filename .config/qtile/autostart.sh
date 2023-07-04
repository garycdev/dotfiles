#!/bin/sh
notify-send "Bienvenido de nuevo Gary" &

# Fondo de pantalla
feh --bg-fill ~/.pictures/kny2.jpg

# Servicios externos
/usr/lib/xfce4/notifyd/xfce4-notifyd &

# Iconos del sistema
udiskie -t &
nm-applet &
volumeicon &
cbatticon -u 5 &
blueman-applet &
# Configs
picom --config ~/.config/picom/picom.conf &

setxkbmap us &
numlockx on &

# Terminal
# kitty bashtop &
# alacritty --command=calcurse &
alacritty --command=bashtop &
