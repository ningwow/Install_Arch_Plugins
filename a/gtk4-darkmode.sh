#!/bin/sh

#黑暗模式只需安装theme文件和修改配置文件

#（貌似无用）黑暗主题设置,需要gtk守护程序
pacman -S --noconfirm xfce4-settings
#安装gnome主题
pacman -S gnome-themes-extra
#安装arc-gtk-theme，听说这个最好
pacman -S --noconfirm arc-ftk-theme



#theme存储位置=/usr/share/theme/*
#配置文件名称需与存储文职名称完全相同
#第一种方法，全局文件/usr/share/gtk-*
#第二种方法
#~/.gtkrc-2.0
#~/.config/gtk-3.0/settings.ini