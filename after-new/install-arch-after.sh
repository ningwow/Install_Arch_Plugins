#!/bin/bash

pacman -S --noconfirm base-devel make gcc go 
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

#安装yay
cd /home/rjn
su rjn -c "git clone https://aur.archlinux.org/yay.git"
cd yay
#su rjn -c "makepkg -si"    需要等待输入必须手动

#安装杂项
pacman -S zsh zsh-completions alacritty  
chsh -s /bin/zsh rjn
chsh -s /bin/zsh root
cd /home/rjn
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
su rjn -c "chmod +x install.sh"
su rjn -c "./install.sh"
pacman -S thunar

#配置图形   手动优先
#xrandr --output HDMI-1 --mode 1920x1080 --rate 60
#echo "xrandr --output HDMI-1 --mode 1920x1080 --rate 60" >> /etc/profile
