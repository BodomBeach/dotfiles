- ncspot
- Autokey
- xdotool
- alacritty
- tmux


- sound stutter with spotifyd + spt / ncspot
edit /etc/pulse/default.pa and change 'load-module module-udev-detect' to 'load-module module-udev-detect tsched=0'
actually, removing usb headset from usb c hub solved it


# Troubleshooting


DEPRECATED : bspwm config
- bspwm
- polybar
- polybar-themes (material)
- feh

- if network is inactive (computer with red cross), run
~/networkmanager-dmenu/networkmanager_dmenu &
enable networking

- connect to wifi / VPN :
nmtui or nm-applet

- polybar:
icons : download and extract https://fontawesome.com/download  (Desktop free) to ~/.local/share/fonts
then pick icon and choose "Copy unicode glyph"