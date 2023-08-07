#!/bin/bash

#时间设置   /设置时域和ntp服务
timedatectl set-timezone Asia/Shanghai
timedatectl set-ntp true
#hwclock --systohc  \\这是同步硬件时钟，在双启动下不要执行
systemctl enable dhcpcd

pacman -S --noconfirm base-devel make gcc thunar gvfs-mtp gvfs-smb  #gvfs-*都是thunar的插件
#密钥串及反射器(定时更新mirror)
pacman -S --noconfirm archlinux-keyring gnome-keyring reflector linux-headers
echo "--country China" >> /etc/xdg/reflector/reflector.conf
##配置自动更新反射器
#systemctl enable --now reflector
#systemctl enable --now reflector.timer


##安装xorg服务器
pacman -S --noconfirm xorg xorg-xinit xorg-twm xorg-xclock xterm
##安装窗口管理器和显示管理器
pacman -S --noconfirm i3 dmenu lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
systemctl enable lightdm
##如果不使用显示管理器，可以startx启动xorg（简陋）

#安装yay
cd /home/rjn
su rjn -c "git clone https://aur.archlinux.org/yay.git"
cd yay
#su rjn -c "makepkg -si"    需要等待输入必须手动

#开发环境
pacman -S --noconfirm gdb code

#安装杂项
pacman -S --noconfirm zsh zsh-completions alacritty qbittorrent p7zip

#切换zsh
chsh -s /bin/zsh rjn
chsh -s /bin/zsh root
#cd /home/rjn
#su rjn -c "sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)""
#cp -r /home/rjn/.oh-my-zsh /usr/share/oh-my-zsh
#手动.zshrc 文件中的 export ZSH=/usr/share/oh-my-zsh/
#   sudo cp /home/rjn/.zshrc /root/.zshrc
#../a/clash.sh

#配置图形   手动优先
#xrandr --output HDMI-1 --mode 1920x1080 --rate 60
#echo "xrandr --output HDMI-1 --mode 1920x1080 --rate 60" >> /etc/profile
