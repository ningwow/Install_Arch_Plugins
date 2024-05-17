### 安装yay
```bash
cd /home/rjn
su rjn -c "git clone https://aur.archlinux.org/yay.git"
cd yay
#su rjn -c "makepkg -si"    需要等待输入必须手动
```

### 安装Hyprland(基于sway的窗口管理器)
```bash


```
### 切换zsh
```bash
cd /home/rjn

su rjn -c "sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)""

cp -r /home/rjn/.oh-my-zsh /usr/share/oh-my-zsh

# 修改插件目录
sed -i 's/export ZSH=export ZSH=\/usr\/share\/oh-my-zsh\//g' /home/rjn/.zshrc

sudo cp /home/rjn/.zshrc /root/.zshrc
sed -i 's/export ZSH=export ZSH=\/usr\/share\/oh-my-zsh\//g' /root/.zshrc
```

### 配置图形   手动优先
```bash
#xrandr --output HDMI-1 --mode 1920x1080 --rate 60
#echo "xrandr --output HDMI-1 --mode 1920x1080 --rate 60" >> /etc/profile
```

### iptables ufw 配置允许端口转发
```bash

```