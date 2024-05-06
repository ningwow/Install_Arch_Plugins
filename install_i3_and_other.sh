#!/bin/bash

pacman -Syyu
# Configure development environment
pacman -S --noconfirm  gdb jdk-openjdk python python-pip nano code valgrind virtualenv  nodejs npm mysql docker

# install other tools
pacman -S --noconfirm dmenu zsh zsh-completions alacritty qbittorrent p7zip cheese    #gnome相机
pacman -S --noconfirm polkit-gnome polkit #polkit自启动的图形化代理程序，重要，，，程序自启动在i3配置文件中


##安装xorg server
pacman -S --noconfirm xorg xorg-xinit xorg-twm xorg-xclock
#安装输入设备驱动
pacman -S --noconfirm xf86-input-libinput


# 安装显示管理器和窗口管理器
pacman -S --noconfirm i3 lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
systemctl enable lightdm

##安装显卡驱动
#./install_graphics.sh



#切换zsh
chsh -s /bin/zsh rjn
chsh -s /bin/zsh root