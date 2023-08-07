#!/bin/bash

#gnome-keyring i3环境配置(/etc/profile)
dbus-update-activation-environment --all
gnome-keyring-daemon --start --components=secrets




#vscode需要指定密钥环
#新建启动文件，code --password-store="gnome" >> /usr/bin/vscode

#钥匙环gui
pacman --noconfirm -S seahorse  #giu管理程序
