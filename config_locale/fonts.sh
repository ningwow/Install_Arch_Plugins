#!/bin/bash

pacman -S --confirm wqy-microhei wqy-zenhei adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts adobe-source-han-sans-tw-fonts adobe-source-han-sans-hk-fonts adobe-source-han-serif-tw-fonts adobe-source-han-serif-hk-fonts

#状态栏取药使用的字体(i3blocks)
pacman -S --noconfirm ttf-font-awesome

#刷新字体
fc-cache