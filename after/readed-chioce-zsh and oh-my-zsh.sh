#!/bin/bash

#arco中oh-my-zsh在/usr/share/oh-my-zsh,year,它是预装的
#这是安装脚本，你可以在每个用户下都运行依次，让他们都有。或者将它安装到/usr/bin/oh-my-zsh
#只需要更改 .zshrc 文件中的 export ZSH=/usr/share/oh-my-zsh/
wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh
