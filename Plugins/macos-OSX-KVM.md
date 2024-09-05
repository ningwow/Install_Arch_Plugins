https://github.com/kholia/OSX-KVM
### 在添加到virt-manajer后启动崩溃


### 这条先执行
 paru -S dmg2img
### 以下是完整命令
sudo pacman -Syu
sudo pacman -S qemu bridge-utils virt-manager git wget libguestfs tesseract p7zip make dmg2img cdrkit vim net-tools screen tesseract-data-eng --needed

# 安装选择顺序
    首先使用方向键选择base system     在这个里面会在线下载mac镜像，会下载很长时间，完成后会重启到引导
    然后选择macos installer     等待加载完成
    重新进入引导后选择之前设置的盘符main
    重新进入引导后再次选择main

### 以下是分开的命令
<!-- sudo pacman -Syu
sudo pacman -S qemu bridge-utils virt-manager git wget libguestfs tesseract p7zip make dmg2img cdrtools vim net-tools screen --needed

sudo pacman -S tesseract-data-eng

sudo pacman -S cdrkit

sudo pacman -S p7zip -->

## 优化参考
    https://github.com/sickcodes/osx-optimizer