#!/bin/bash
# 注意。需要给root和rjn都安装配置
cp .vimrc ~/.vimrc
su rjn -c "cp .vimrc ~/.vimrc"
#自定义配色文件
mkdir ~/.vim
su rjn -c "mkdir ~/.vim"

cp -r ./colors ~/.vim/colors
su rjn -c "cp -r ./colors ~/.vim/colors"

#插件管理器安装目录
mkdir ~/.vim/autoload
su rjn -c "mkdir ~/.vim/autoload"
#cp ./plug.vim ~/.vim/auteload

#插件安装目录
mkdir ~/.vim/bundle
su rjn -c "mkdir  ~/.vim/bundle"
#手动安装插件


#vim 启动   ：PlugStatus #查看插件状态  ：PlugInstall #安装之前在配置文件中声明的插件

#安装插件管理工具
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
su rjn -c "curl -fLo ~/.vim/autoload/plug.vim --create-dirs \https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"