#!/bin/bash

#安装jack需要删除jack2。手动确认或
pacman -R jack2
pacman -S --noconfirm pipewire pipewire-docs wireplumber pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack qpwgraph
#安装之后不好删