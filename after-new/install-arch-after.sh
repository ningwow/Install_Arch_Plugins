#!/bin/bash

#密钥串及反射器(定时更新mirror)
pacman -S --noconfirm archlinux-keyring reflector 
echo "--country China" >> /etc/xdg/reflector/reflector.conf
##配置自动更新反射器
systemctl enable --now reflector
systemctl enable --now reflector.timer
而系统

##安装xorg服务器
pacman -S --noconfirm xorg xorg-xinit xorg-twm xorg-xclock xterm
##安装窗口管理器和显示管理器
pacman -S --noconfirm i3 lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
systemctl enable lightdm
##如果不使用显示管理器，可以startx启动xorg（简陋）




#配置图形   手动优先
#xrandr --output HDMI-1 --mode 1920x1080 --rate 60
#echo "xrandr --output HDMI-1 --mode 1920x1080 --rate 60" >> /etc/profile
