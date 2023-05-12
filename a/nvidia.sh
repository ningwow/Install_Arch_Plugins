#!/bin/bash

#2060可以使用nvidia-open/亮度控制正常（echo 5> /sys/class/backlight/nvidia_0/brightness），快捷键不正常
pacman -S --nocomfirm nvidia-open nvidia-utils nvidia-settings lib32-nvidia-utils
#将‘nomodeset’参数添加到grub默认条目，然后grub-mkconfig

#亮度控制参考arch wiki --> "https://wiki.archlinux.org/title/Acpid#Enabling_volume_control"
