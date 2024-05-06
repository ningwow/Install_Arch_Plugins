#!/bin/bash
# https://wiki.archlinux.org/title/NVIDIA
echo "正在检测Nvidia独立显卡..."
if lspci | grep -E "VGA|Display" | grep -iq Nvidia; then
    echo "安装Nvidia独显驱动..."
    sudo pacman -S nvidia nvidia-utils
else
    echo "未检测到Nvidia独立显卡。"
fi
