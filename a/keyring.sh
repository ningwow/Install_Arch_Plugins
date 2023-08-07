#!/bin/bash

#gnome-keyring i3环境配置(/etc/profile)
dbus-update-activation-environment --all
gnome-keyring-daemon --start --components=secrets




#vscode需要指定密钥环，在code启动文件中中(/usr/bin/code)加入 "--password-store="gnome""
#钥匙环gui
pacman --noconfirm -S seahorse  #giu管理程序
