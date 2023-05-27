#!/bin/bash

# 手动.zshrc 文件中的 export ZSH=/usr/share/oh-my-zsh/
# 设置主题为zsh_THEME="gnzh"

# 安装差件的时候
#自动补全
git clone https://github.com/zsh-users/zsh-autosuggestions /usr/share/oh-my-zsh/custom/plugins/zsh-autosuggestions

cp ./zshrc /home/rjn/.zshrc
#zsh-autosuggestions加入到git中
#sudo，忘记sudo.按两次esc键
#web-search，使用google ... 在终端中快捷搜索
#copyfile，复制文件所有内容
#history，命令历史记录，h
#jsontools，让json输出更整齐



cp /home/rjn/.zshrc /root/.zshrc
# 
