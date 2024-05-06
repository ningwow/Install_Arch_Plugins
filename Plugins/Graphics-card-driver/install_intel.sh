#!/bin/bash
# https://wiki.archlinux.org/title/intel_graphics
echo "正在检测Intel集成显卡..."
if lspci | grep -E "VGA|Display" | grep -iq Intel; then
    echo "安装Intel集显驱动..."
    sudo pacman -S xf86-video-intel
else
    echo "未检测到Intel集成显卡。"
fi
