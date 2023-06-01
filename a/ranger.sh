#!/bin/bash

#基于文本的文件管理器，终端运行
pacman -S --noconfirm ranger w3m

#启动图片预览
echo "set preview_images true" >> /home/rjn/.config/ranger/rc.conf
echo "set preview_images_method w3m >> /home/rjn/.config/ranger/rc.conf
