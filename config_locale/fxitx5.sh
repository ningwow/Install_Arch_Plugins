#!/bin/bash

# 安装基本字体
sudo pacman -S --noconfirm noto-fonts noto-fonts-cjk noto-fonts-emoji

# 安装fcitx5 输入法
pacman -S --noconfirm fcitx5 fcitx5-configtool fcitx5-material-color fcitx5-qt fcitx5-chinese-addons  fcitx5-gtk fcitx5-pinyin-zhwiki

# kde重启即可