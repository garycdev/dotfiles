#!/bin/sh
notify-send "Bienvenido de nuevo Gary" &

# Fondo de pantalla
#feh --bg-fill /usr/share/backgrounds/archWallpapers/Arch3.jpg &
#feh --bg-fill ~/Pictures/node_vue.png
feh --bg-fill ~/Pictures/fondos/code1.jpg

# Iconos del sistema
udiskie -t &
nm-applet &
volumeicon &
cbatticon -u 5 &
blueman-applet &

picom --config ~/.config/picom/picom.conf  &
alacritty --command=bashtop &
#alacritty --option font.size=60 --title 7clock --command=7clock &
#alacritty --command=htop &
alacritty &
setxkbmap us &
