#!/bin/bash
#设置时区
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
#同步硬件和系统时钟
timedatectl set-timezone Asia/Shanghai
timedatectl set-ntp true
hwclock --systohc
#sed -i '178s/.//' /etc/locale.gen  \\不知道什么意思
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
#echo "KEYMAP=de_CH-latin1" >> /etc/vconsole.conf
echo "first" >> /etc/hostname   #主机名
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 arch.localdomain arch" >> /etc/hosts
echo root:password | 301791

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
echo ('remember setting passwd and umount -l or reboot')
echo ('please pacman -S i3')
echo 0