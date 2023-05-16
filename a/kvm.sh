#!/bin/bash

#安装及加入组
sudo pacman -S --noconfirm qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat ebtables iptables-nft libguestfs
sudo usermod -a -G libvirt rjn
newgrp libvirt
#配置文件
echo "unix_sock_group = "libvirt"" >> /etc/libvirt/libvirtd.conf
echo "unix_sock_rw_perms = "0770"" >> /etc/libvirt/libvirtd.conf

#默认自动启动默认网络
systemctl enable --now libvirtd
virsh net-autostart --network default
