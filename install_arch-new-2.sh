#!/bin/bash
#设置时区
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

#时间设置   /设置时域和ntp服务
timedatectl set-timezone Asia/Shanghai
timedatectl set-ntp true
#hwclock --systohc  \\这是同步硬件时钟，在双启动下不要执行

#编辑语言环境   /设置LANG变量
echo -e "en_US.UTF-8 UTF-8\nzh_CN.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

#设置键盘布局
echo "KEYMAP = de-latin1" >> /etc/vconsole.conf

#设置主机名
echo "First" >> /etc/hostname   #主机名

#设置host文件
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 First" >> /etc/hosts

#初始化文件
mkinitcpio -P

#设置密码   /root密码和创建新用户
echo "root:301791" | chpasswd
useradd -m -G wheel  rjn   #创建新用户并设置密码
echo "rjn:301791" | chpasswd


#安装引导加载程序   /important
pacman -S --noconfirm grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

#安装基本功能
pacman -S --noconfirm sudo      #安装杂项
echo "%wheel    ALL=(ALL:ALL) ALL" >> /etc/sudoers

pacman -S --noconfirm ntfs-3g   #文件系统实用程序/后续补充
pacman -S --noconfirm pulseaudio pulseaudio-bluetooth pulseaudio-alsa pulseaudio-jack pulseaudio-lirc kmix  #声音服务器及其他声音程序
pacman -S --noconfirm networkmanager network-manager-applet dhcpcd      #网络服务程序
systemctl enable NetworkManager

#安装nvidia驱动程序或暂时安装开源驱动程序
#pacman -S xf86-video-nouveau       #开源驱动程序

#现在这是一个只有命令行的arch新系统了


















# You can add xorg to the installation packages, I usually add it at the DE or WM install script
# You can remove the tlp package if you are installing on a desktop or vm

pacman -S  grub efibootmgr networkmanager network-manager-applet btrfs-progs amd-ucode lightdm lightdm-gtk-greeter dialog wpa_supplicant os-prober mtools dosfstools base-devel linux-headers avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils firefox dmenu dnsutils bluez bluez-utils cups hplip alsa-utils pipewire pipewire-alsa pipewire-pulse pipewire-jack bash-completion openssh rsync reflector acpi acpi_call tlp virt-manager qemu qemu-arch-extra edk2-ovmf bridge-utils dnsmasq vde2 openbsd-netcat iptables-nft ipset firewalld flatpak sof-firmware nss-mdns acpid os-prober ntfs-3g terminus-font alacritty

# pacman -S --noconfirm xf86-video-amdgpu
# pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB #change the directory to /boot/efi is you mounted the EFI partition at /boot/efi

grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable cups.service
systemctl enable sshd
systemctl enable lightdm
systemctl enable avahi-daemon
systemctl enable tlp # You can comment this command out if you didn't install tlp, see above\\笔记本节能工具很有用：https://wiki.archlinux.org/title/TLP
systemctl enable reflector.timer
systemctl enable fstrim.timer
systemctl enable libvirtd
systemctl enable firewalld
systemctl enable acpid

useradd -m rjn
echo rjn:password | 301791
usermod -aG libvirt rjn

echo "rjn ALL=(ALL) ALL" >> /etc/sudoers.d/ermanno


#printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"   \\不知道啥意思
echo 'remember setting passwd and umount -l or reboot'
echo 'please pacman -S i3'
echo 'remeber execed = sudo virsh net-autostart  --network default'
timedatectl | grep local

echo 0