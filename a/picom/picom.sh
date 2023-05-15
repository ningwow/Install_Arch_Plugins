#!/bin/bash

#配置文件路径
#～/.config/picom.conf
#/etc/xdg/picom.conf
#及其难配置
#可配置圆角，阴影，透明，好多


sudo pacman -S -- noconfirm picom
echo "exec picom &" >> ~/.config/i3/config
cp ./picom.conf ~/.config/picom.conf
exec picom &