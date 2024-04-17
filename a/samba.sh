#!/bin/bash

pacman -S --noconfirm samba
#在arco中配置文件可以直接复制，其他系统中若不自动生成配置文件，则在下一行网址有示例，取消注释即可
wget -O /etc/samba/smb.conf https://git.samba.org/samba.git/?p=samba.git;a=blob_plain;f=examples/smb.conf.default;hb=HEAD
#这是samba的示例文件，更改里面的底部的myshare就可以了
# cp  /etc/samba/smb.conf /etc/samba/smb.conf

echo "[share]" >> /etc/samba/smb.conf
echo "   comment = rjn`s share" >> /etc/samba/smb.conf
echo "   path = /home/rjn/Document/.share" >> /etc/samba/smb.conf
echo "   valid users = rjn" >> /etc/samba/smb.conf
echo "   public = no" >> /etc/samba/smb.conf
echo "   writable = yes" >> /etc/samba/smb.conf
echo "   printable = no" >> /etc/samba/smb.conf
echo "   create mask = 0700" >> /etc/samba/smb.conf
systemctl enable --now smb
systemctl enable --now nmb


# -s 选项为不提示输出内容。便于直接print,-a 添加用户
sudo printf "密码\n密码\n"  |  sudo smbpasswd -a -s rjn
#printf "密码\n密码\n"  | sudo -a smbpasswd rjn -s


# 连接方式,[share]，名称看这个
#在程序中开启smb
#\\server\share