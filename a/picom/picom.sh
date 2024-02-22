#!/bin/bash

#配置文件路径
#～/.config/picom.conf
#/etc/xdg/picom.conf
#及其难配置
#可配置圆角，阴影，透明，好多

###### 在修该配置文件时，除了对透明程序的指定不用重启
###### 其他配置修改都需要重启picom生效

# 配置中 必须：  backend = "glx";

sudo pacman -S --noconfirm picom
echo "exec picom &" >> ~/.config/i3/config
cp picom.conf /home/rjn/.config/picom.conf
picom &