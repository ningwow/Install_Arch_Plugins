#!/bin/bash

#https://wiki.archlinux.org/title/Touchpad_Synaptics
#测试成功
#这是触摸板配置
echo '#' >> /etc/X11/xorg.conf.d/30-touchpad.conf
echo '#' >> /etc/X11/xorg.conf.d/30-touchpad.conf
echo 'Section "InputClass"' >> /etc/X11/xorg.conf.d/30-touchpad.conf
echo '    Identifier "touchpad"' >> /etc/X11/xorg.conf.d/30-touchpad.conf
echo '        Driver "libinput"' >> /etc/X11/xorg.conf.d/30-touchpad.conf
echo '        MatchIsTouchpad "on"' >> /etc/X11/xorg.conf.d/30-touchpad.conf
echo '        Option "Tapping" "on"' >> /etc/X11/xorg.conf.d/30-touchpad.conf
echo '        Option "NaturalScrolling" "true"' >> /etc/X11/xorg.conf.d/30-touchpad.conf
echo '#       Option "TappingButtonMap" "lmr"   #这一行开启时双指是另一种功能。关闭时和win一样' >> /etc/X11/xorg.conf.d/30-touchpad.conf
echo 'EndSection' >> /etc/X11/xorg.conf.d/30-touchpad.conf