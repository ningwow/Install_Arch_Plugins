#!/bin/bash

#壁纸目录～/Picture/wallpaper/*
#先放入壁纸
pacman -S --noconfirm feh
echo "~/.fehbg &" >> ~/.xinitrc
cp ./.fehbg ~/.fehbg