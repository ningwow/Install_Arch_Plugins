#!/bin/bash
#停滞5秒后隐藏鼠标
pacman -S --noconfirm unclutter
echo "exec unclutter &" >> /home/rjn/.config/i3/config