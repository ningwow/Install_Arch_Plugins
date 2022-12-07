#!/bin/bash

pacman -S --noconfirm samba
#在arco中配置文件可以直接复制，其他系统中若不自动生成配置文件，则在下一行网址有示例，取消注释即可
#wget -O /etc/samba/smb.conf https://git.samba.org/samba.git/?p=samba.git;a=blob_plain;f=examples/smb.conf.default;hb=HEAD
#这是samba的示例文件，更改里面的底部的myshare就可以了
cp  /etc/samba/smb.conf.arcolinux /etc/samba/smb.conf

#[myshare]  \\示例
#   comment = rjn`s share
#   path = /home/rjn/.share
#   valid users = rjn
#   public = no
#   writable = yes
#   printable = no
#   create mask = 0700
systemctl enable --now smb
systemctl enable --now nmb

echo 'smbpasswd -a rjn and enable win10 smb'
