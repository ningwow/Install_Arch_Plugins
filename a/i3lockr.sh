#!/bin/bash
#实现模糊锁屏需要配合i3lock和i3lockr。由i3lockr --blur=25模糊屏幕

pacman -S --noconfirm xautolock
wget -P /usr/locale/bin  https://github.com/owenthewizard/i3lockr/releases/download/v1.2.0/i3lockr
chmod +x /usr/locale/bin/i3lockr

#i3配置文件已cp
#echo "exec --no-startup-id xautolock -time 1 -locker 'i3lockr --blur=20'" >> ~/.config/i3/config
#手动配置i3lockr --blur=25到i3config