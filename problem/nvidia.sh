#!/bin/bash

pacman -S --noconfirm nvidia nvidia-utils nvidia-settings

echo ('set nomodeset on grub boot')
echo ('请将nomodeset参数加到grub里')
echo ('grub界面按e,加到linux那一行最后面,ctrl+x重新引导')
echo ('在/etc/default/grub中,将nonodeset加到default一行里面')