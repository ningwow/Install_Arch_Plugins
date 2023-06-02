#!/bin/bash

#lightdm及背景设计

pacman -S --noconfirm lightdm-gtk-greeter-settings lightdm-gtk-greeter

echo "greeter-session = lightdm-gtk-greeter" >> /etc/lightdm/lightdm.conf


#使用 sudo lightdm-gtk-greeter-settings，开启图形化管理
#b背景或图片要放在/usr/share/....文件夹