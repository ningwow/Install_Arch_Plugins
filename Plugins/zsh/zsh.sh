#!/bin/bash

# 手动.zshrc 文件中的 export ZSH=/usr/share/oh-my-zsh/
# 设置主题为zsh_THEME="gnzh"
chsh -s /bin/zsh
sudo chsh -s /bin/zsh
# 跟换shell

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# 安装oh-my-zsh
su
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# 给root安装oh-my-zsh

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
# 安装主题

# 安装差件的时候
#自动补全
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions.git \
  ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions

cp .zshrc /home/rjn/.zshrc
#zsh-autosuggestions加入到git中
#sudo，忘记sudo.按两次esc键
#web-search，使用google ... 在终端中快捷搜索
#copyfile，复制文件所有内容
#history，命令历史记录，h
#jsontools，让json输出更整齐



cp /home/rjn/.zshrc /root/.zshrc
# 
