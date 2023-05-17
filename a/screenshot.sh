#!/bin/bash

#截图工具
pacman -S --noconfirm flameshot
#记得设置flameshot
echo "bindsym $mod+shift+s exec "flameshot gui"" >> /home/rjn/.config/i3/config
echo "bindsym Print exec "flameshot gui"" >> /home/rjn/.config/i3/config