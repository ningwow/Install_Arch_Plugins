#!/bin/bash
# https://wiki.archlinux.org/title/AMDGPU
echo "正在检测AMD显卡类型..."
# 检测是集成显卡还是独立显卡
if lspci | grep -E "VGA|Display" | grep -iq AMD; then
    if lspci | grep -E "VGA|Display" | grep -iq "Radeon"; then
        echo "检测到AMD Radeon独显，安装驱动..."
        sudo pacman -S xf86-video-amdgpu
    else
        echo "检测到AMD集成显卡，安装驱动..."
        sudo pacman -S xf86-video-amdgpu
    fi
else
    echo "未检测到AMD显卡。"
fi
