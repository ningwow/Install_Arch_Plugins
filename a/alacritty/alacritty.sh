#!/bin/bash
sudo pacman -S --noconfirm alacritty
#配置文件难找
su rjn -c "mkdir -p /home/rjn/.config/alacritty/"
su rjn -c "cp ./alacritty.yml > /home/rjn/.config/alacritty/alacritty.yml"


#手动配置
# 颜色配置参考 https://github.com/alacritty/alacritty-theme

#透明配置，需要picom合成器启动才能生效，及其重要