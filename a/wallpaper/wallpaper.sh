#!/bin/bash

#壁纸目录～/Picture/wallpaper/*
#先放入壁纸
pacman -S --noconfirm feh

#i3配置文件已cp
#echo "~/.fehbg &" >> ~/.config/i3/config
cp .fehbg /home/rjn/.fehbg
chmod +x home/rjn/.fehbg