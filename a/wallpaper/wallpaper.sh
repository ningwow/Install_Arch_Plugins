#!/bin/bash

#壁纸目录～/Picture/wallpaper/*
#先放入壁纸
pacman -S --noconfirm feh
echo "~/.fehbg &" >> ~/.config/i3/config
cp ./.fehbg ~/.fehbg
chmod +x ~/.fehbg