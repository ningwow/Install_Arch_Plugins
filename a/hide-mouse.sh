#!/bin/bash
#停滞5秒后隐藏鼠标
pacman -S --noconfrim unclutter
echo "unclutter &" >> /home/rjn/.xinitrc