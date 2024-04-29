#!/bin/bash
#设置时区
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#时间设置   /设置时域和ntp服务
##chroot模式下无法使用ctl程序
#timedatectl set-timezone Asia/Shanghai
#timedatectl set-ntp true
#hwclock --systohc  \\这是同步硬件时钟，在双启动下不要执行

#编辑语言环境   /设置LANG变量
echo -e "en_US.UTF-8 UTF-8\nzh_CN.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

#设置键盘布局
echo "KEYMAP = us" >> /etc/vconsole.conf

#设置主机名
echo "First" >> /etc/hostname   #主机名

#设置host文件
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.0.1 First" >> /etc/hosts

#初始化文件
mkinitcpio -P

#设置密码   /root密码和创建新用户
echo "root:******" | chpasswd
useradd -m -G wheel  rjn   #创建新用户并设置密码
echo "rjn:******" | chpasswd
echo "%wheel    ALL=(ALL:ALL) ALL" >> /etc/sudoers


#安装引导加载程序   /important
pacman -S --noconfirm grub efibootmgr os-prober
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

#安装基本功能
pacman -S --noconfirm sudo acpi acpid rust go    #安装杂项


pacman -S --noconfirm ntfs-3g intel-ucode   #文件系统实用程序/后续补充
#pacman -S --noconfirm alsa-utils pulseaudio pulseaudio-bluetooth pulseaudio-alsa pulseaudio-jack pulseaudio-lirc sof-firmware alsa-ucm-conf kmix  #声音服务器及其他声音程序
pacman -S --noconfirm alsa-utils pipewire pipewire-pulse pipewire-alsa sof-firmware alsa-ucm-conf kmix  #使用这个，更高级，支持更多，
pacman -S --noconfirm pavucontrol   #音频管理软件，比装，横好用
pacman -S --noconfirm networkmanager network-manager-applet dhcpcd networkmanager-openvpn openvpn     #网络服务程序
systemctl enable NetworkManager

#安装nvidia驱动程序或暂时安装开源驱动程序
#pacman -S xf86-video-nouveau       #开源驱动程序

#安装工具，创建用户下强制创建英文目录
pacman -S --noconfirm xdg-user-dirs
su rjn -c "LC_ALL=C xdg-user-dirs-update --force"
LC_ALL=C xdg-user-dirs-update --force

#现在这是一个只有命令行的arch



