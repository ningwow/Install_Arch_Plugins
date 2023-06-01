#!/bin/bash

#使用较新的驱动程序libinput
#https://wiki.archlinux.org/title/Libinput




#停滞5秒后隐藏鼠标
pacman -S --noconfirm unclutter

#i3配置文件已复制
# echo "exec unclutter &" >> /home/rjn/.config/i3/config

# 一般不做设置
#设置鼠标加速度（移速越快，鼠标移速越快），
# https://wiki.archlinux.org/title/Mouse_acceleration





# 这一项需要设置，尤其是在hidpi的情况下
#设置鼠标移动速度，使用xinput
# https://wiki.archlinux.org/title/libinput#Via_xinput_on_Xorg
# 使用方法：https://wiki.archlinux.org/title/Xinput
# 设置 touchpad 的 accel speed 属性调高为0.3
# 标识符会改变，名称不会变,所以使用名称
#eg: xinput set-prop "HTIX5288:00 0905:0255 Touchpad" "libinput Accel Speed" 0.3
#eg: xinput set-prop 11 315 0.3
# 记得加入到/etc/profile启动文件中