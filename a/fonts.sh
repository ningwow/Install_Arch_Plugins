#!/bin/bash

pacman -Syy wqy-microhei wqy-microhei-lite wqy-bitmapfont wqy-zenhei ttf-arphic-ukai ttf-arphic-uming adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts noto-fonts-cjk ttf-dejavu ttf-liberation noto-fonts



#刷新字体
fc-cache
echo 'please install font-manager used yay'
echo 0
exit 0