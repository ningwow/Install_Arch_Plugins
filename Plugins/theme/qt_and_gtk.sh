#!/bin/bash

yay -S qt5ct qt6ct lxappearance 
echo "QT_QPA_PLATFORMTHEME=qt5ct" >> /etc/environment

# 指针图标主题
sudo pacman -S xcursor-comix xcursor-themes xcursor-vanilla-dmz xcursor-vanilla-dmz-aa
# 下面的在lxap.。。里检测不到

yay -S xcursor-human thunar-extended xcursor-breeze xcursor-openzone bibata-cursor-theme xcursor-numix