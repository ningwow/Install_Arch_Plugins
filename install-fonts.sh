#!/bin/bash

pacman -Syy  fontmanager wqy-microhei wqy-microhei-lite wqy-bitmapfont wqy-zenhei ttf-arphic-ukai ttf-arphic-uming adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts noto-fonts-cjk ttf-dejavu ttf-liberation noto-fonts



#刷新字体
fc-cache
echo '可以在aur中安装字体管理器:font-manager'
sleep 5
echo '让我们在安装yay吧'
sudo git clone https://aur.archlinux.org/yay.git
cd yay
echo '现在请使用普通用户执行'makepkg -si',然后yay就安装成功了,你可以删除yay目录了,此脚本结束。'
