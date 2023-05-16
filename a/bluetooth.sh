#!/bin/bash

#基本和图形化管理程序带状态栏图标
pacman -S --noconfirm bluez-utils blueberry
systemctl enable bluetooth
echo "exec blueberrt-tray &" >> ~/.config/i3/config