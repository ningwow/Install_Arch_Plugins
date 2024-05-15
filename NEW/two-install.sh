#!/bin/bash

# 开发环境
pacman -S --noconfirm  make gcc gdb code python python-pip
# 实用工具
pacman -S --noconfirm thunar gvfs-mtp gvfs-smb zsh zsh-completions alacritty qbittorrent p7zip cheese    #gnome相机
# 系统工具
pacman -S --noconfirm archlinux-keyring gnome-keyring reflector polkit-gnome polkit

#密钥串及反射器(定时更新mirror)
pacman -S --noconfirm archlinux-keyring gnome-keyring reflector

# 配置自动更新反射器
sed -i 's/--sort age/--sort rate/g' /etc/xdg/reflector/reflector.conf
systemctl enable --now reflector
systemctl enable --now reflector.timer

chsh -s /bin/zsh rjn
chsh -s /bin/zsh root



# 安装 xorg服务器
# pacman -S --noconfirm xorg-server xorg-xinit xorg-server-utils xorg-fonts xorg-twm xorg-xclock

# 安装 wayland协议包 及 wayland显示服务器
pacman -S --noconfirm wayland weston

# 安装 适合wayland的窗口管理器sway （类i3窗口管理器）
pacman -S --noconfirm sway swaylock swayidle waybar

# 安装显示管理器
pacman -S --noconfirm  lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
systemctl enable lightdm


