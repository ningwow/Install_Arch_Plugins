#!/bin/bash

#install chinese input

#echo 'LANG=en_US.UTF-8' >/etc/locale.conf

#echo 'en_US.UTF-8 UTF-8' >>/etc/locale.gen
#echo 'zh_CN.UTF-8 UTF-8' >>/etc/locale.gen



pacman -Syy --noconfirm fcitx5 fcitx5-configtool fcitx5-material-color fcitx5-qt fcitx5-chinese-addons  fcitx5-gtk fcitx5-pinyin-zhwiki

cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo '##chinese setting' >> /home/rjn/.xinitrc
echo 'export LANG=zh_CN.UTF-8' >> /home/rjn/.xinitrc
echo 'export LANGUAGE=zh_CN:en_US' >> /home/rjn/.xinitrc
echo 'export LC_CTYPE=en_US.UTF-8' >> /home/rjn/.xinitrc
echo '#' >> /home/rjn/.xinitrc
echo '#' >> /home/rjn/.xinitrc
echo '#' >> /home/rjn/.xinitrc
echo '##fcitx5-input' >> /home/rjn/.xinitrc
echo 'export GTK_IM_MODULE="fcitx"' >> /home/rjn/.xinitrc
echo 'export QT_IM_MODULE="fcitx"' >> /home/rjn/.xinitrc
echo 'export XMODIFIERS="@im=fcitx"' >> /home/rjn/.xinitrc
echo 'export XIM_PROGRAM="fcitx"' >> /home/rjn/.xinitrc
echo 'export XIM="fcitx"' >> /home/rjn/.xinitrc
echo '#' >> /home/rjn/.xinitrc
echo '#' >> /home/rjn/.xinitrc
echo '#' >> /home/rjn/.xinitrc
echo '##' >> /home/rjn/.xinitrc
echo '#export LIBVA_DRIVER_NAME='vdpau'    \\视频硬件加速，' >> /home/rjn/.xinitrc
echo '#export LIBVA_DRIVERS_PATH='/usr/lib/dri/'   \\视频硬件加速地址,详看https://wiki.archlinux.org/title/Hardware_video_acceleration' >> /home/rjn/.xinitrc
echo '#export VDPAU_DRIVER=nvidia  \\有关视频硬件加速详看上一条' >> /home/rjn/.xinitrc
echo '#' >> /home/rjn/.xinitrc
echo '#' >> /home/rjn/.xinitrc
echo '#' >> /home/rjn/.xinitrc
echo '#--gnome密钥环;   \\gnome密钥环还不懂,略过' >> /home/rjn/.xinitrc
echo '#eval "$(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)"' >> /home/rjn/.xinitrc
echo '#export SSH_AUTH_SOCK' >> /home/rjn/.xinitrc
echo '#' >> /home/rjn/.xinitrc
echo '#' >> /home/rjn/.xinitrc
echo '#exec dbus-launch i3' >> /home/rjn/.xinitrc
echo '#exec i3  \\因为此文件是x服务初始化读取的文件,不需要启动i3,好像吧' >> /home/rjn/.xinitrc
##
echo '#' >> /home/rjn/.xprofile
echo '#' >> /home/rjn/.xprofile
echo '#' >> /home/rjn/.xprofile
echo '##chinese settiing' >> /home/rjn/.xprofile
echo 'export LANG=zh_CN.UTF-8' >> /home/rjn/.xprofile
echo 'export LANGUAGE=zh_CN:en_US' >> /home/rjn/.xprofile
echo 'export LC_CTYPE=en_US.UTF-8' >> /home/rjn/.xprofile
echo '#' >> /home/rjn/.xprofile
echo '#' >> /home/rjn/.xprofile
echo '#' >> /home/rjn/.xprofile
echo 'export LC_MESSAGES=zh_CN.UTF-8' >> /home/rjn/.xprofile
echo 'export LC_TIME=zh_CN.UTF-8' >> /home/rjn/.xprofile

echo '##chinese input fcitx5' >> /home/rjn.xprofile
echo 'export GTK_IM_MODULE="fcitx"' >> /home/rjn/.xprofile
echo 'export QT_IM_MODULE="fcitx"' >> /home/rjn/.xprofile
echo 'export XMODIFIERS="@im=fcitx"' >> /home/rjn/.xprofile
echo 'export XIM_PROGRAM="fcitx"' >> /home/rjn/.xprofile
echo '#下面这一行能让telegram输入中文' >> /home/rjn/.xprofile
echo 'export INPUT_METHOD="fcitx"' >> /home/rjn/.xprofile
echo 'export SDL_IM_MODULE="fcitx"' >> /home/rjn/.xprofile
echo 'export XIM="fcitx"' >> /home/rjn/.xprofile
echo 'export SDL_IM_MODULE DEFAULT="fcitx"' >> /home/rjn/.xprofile
echo '#' >> /home/rjn/.xprofile
echo '#' >> /home/rjn/.xprofile
echo '#' >> /home/rjn/.xprofile
echo '#export LIBVA_DRIVER_NAME='vdpau' \\\\视频硬件加速,详看https://wiki.archlinux.org/title/Hardware_video_acceleration' >> /home/rjn/.xprofile
echo '#export LIBVA_DRIVERS_PATH='/usr/lib/dri/'' >> /home/rjn/.xprofile
echo '#export VDPAU_DRIVER='nvidia'' >> /home/rjn/.xprofile

echo '#--gnome密钥环;   \\gnome密钥环还不懂,略过' >> /home/rjn/.xprofile
echo '#eval "$(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)"' >> /home/rjn/.xprofile
echo '#export SSH_AUTH_SOCK' >> /home/rjn/.xprofile

echo '#exec dbus-launch i3' >> /home/rjn/.xprofile
echo '#exec i3   \\这个文件应该启用i3,考虑不一定用i3,先略过,发现启用i3后lightdm无法进入i3' >> /home/rjn/.xprofile
echo '' >> /home/rjn/.xprofile
echo '' >> /home/rjn/.xprofile
echo '' >> /home/rjn/.xprofile
echo '' >> /home/rjn/.xprofile

fcitx5
echo 'exec --no-startup-id fcitx5' >> /home/rjn/.config/i3/config
#手动操作
#echo 'please:1.stop fcitx5  2.vim .config/fcitx5/conf/pinyin.conf PreeditInApplication=False '
exit