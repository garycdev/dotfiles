#!/bin/bash

# Archivo de configuración de Alacritty
ALACRITTY_CONFIG="$HOME/.config/alacritty/alacritty.toml"
# Ruta al archivo de configuración de rofi
ROFI_CONFIG="$HOME/.config/rofi/config.rasi"

# Verifica si 'WhiteSur-Light' está presente en .gtkrc-2.0
if grep -q 'WhiteSur-Light' "$HOME/.gtkrc-2.0"; then
    sed -i 's|import = \[.*|import = ["~/.config/alacritty/rice-colors.toml", "~/.config/alacritty/fonts.toml"]|' "$ALACRITTY_CONFIG"
    sed -i 's|@theme .*|@theme "/home/garycdev/.config/rofi/themes/spotlight.rasi"|' "$ROFI_CONFIG"
		nitrogen --set-auto Pictures/Backgrounds/14.jpg

else
    sed -i 's|import = \[.*|import = ["~/.config/alacritty/rice-colors-dark.toml", "~/.config/alacritty/fonts.toml"]|' "$ALACRITTY_CONFIG"
    sed -i 's|@theme .*|@theme "/home/garycdev/.config/rofi/themes/spotlight-dark.rasi"|' "$ROFI_CONFIG"
		nitrogen --set-auto Pictures/Backgrounds/13.jpg
fi


