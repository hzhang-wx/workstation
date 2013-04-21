#!/bin/bash
# xinitrc

# Merge Xresources file
xrdb -merge ~/.Xresources

# disable screensaver/scree blanking
xset s off
xset dpms 0 0 0

# fcitx
export XMODIFIERS="@im=fcitx"
export QT_IM_MODULE=fcitx
export GTK_IM_MODULE=fcitx
fcitx &

# xmodmap
(sleep 2 && xmodmap ~/.xmodmaprc)&

#awesome
exec awesome -c ~/.config/awesome/rc.lua
