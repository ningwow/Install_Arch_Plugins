---
# 此项目是作为个人使用的安装arch linux的脚本笔记
---
    正在优化中...
## 准备操作：
    下载：https://archlinux.org/download/
    使用rufus 或者 ventoy 将影像加载到U盘或在虚拟机测试

## 请按照以下流程按顺序执行
---
### 查看是否为efi启动模式
    在启动到arch install 后
```shell
    ls /sys/firmware/efi/efivars
```
### 检查网络连接
```shell
    ip a
```
    建议使用usb网络共享或者网线
    无线网络请使用以下方式连接
```shell
    $ iwctl
    [iwd]### device list
    [iwd]### station wlan0 scan
    [iwd]### station wlan0 get-networks
    [iwd]### station wlan0 connect SSID
    [iwd]### exit

    ping baidu.com 测试
```

### 设置时间
    配置时域为上海
```shell
    timedatectl     查看时间
    timedatectl set-timezone Asia/Shanghai  ###设置时区
```
### 磁盘分区
    efi分区，主分区，swap分区(通常为内存大小或内存大小的一半)
```shell
    lsblk   ###查看磁盘分布
```
    使用cfdisk工具分盘，efi分区大小为1G，UEFI System， / 分区类型为 linux File System
```shell
    cfdisk /dev/...     ###efi分区/home分区/根分区/swap分区
```
    格式化分区
```shell
    mkfs.fat -F 32 /dev/...     ###格式化efi分区
    mkfs.ext4 /dev/...      ###格式化正常分区
    mkswap /dev/...     ###格式花swap分区
```
### 挂载文件系统
    将分好的盘挂在到/mnt中
    这里是将efi分区挂载到/boot中，若对此改变,需要在chroot-install.sh 脚本中同步修改grub安装路径
```shell
    mount /dev/... /mnt     ###挂载普通分区
    mount --mkdir /dev/... /mnt/boot    ###挂载boot引导分区
    swapon /dev/...     ###启用swap分区
```
### 选择mirror镜像    /任选其一
    建议选3
```shell
    1.curl https://archlinux.org/mirrorlist/?country=CN > /etc/pacman.d/mirrorlist    ###然后去掉注释
    2.reflector --country China --protocol https --sort rate --save /etc/pacman.d/mirrorlist
    3.reflector --save /etc/pacman.d/mirrorlist --latest 10 --protocol https --sort rate 
```
### 安装基本包    /important
```shell
    pacstrap -K /mnt base base-devel linux linux-headers linux-firmware git vim wget
```
### 生成fstab文件     important
    genfstab -U /mnt >> /mnt/etc/fstab

### arch-chroot /mnt      /chroot到新系统
    $ arch-chroot /mnt
---
# 在进入到chroot系统后，就可以使用脚本文件简化操作
---
### 对chroot-install.sh 脚本的解释
    若需要对efi挂载路径改变，请确保上方的挂载点与grub路径相同
    默认root密码和新建的用户密码相同
    默认新用户加入wheel组
```shell
    git clone https://github.com/ningwow/Install_Arch_Plugins.git
    cd Install_Arch_Plugins
    chmod +x chroot-install.sh
```
    对于脚本中的选择：默认，quit，*
    默认会执行默认的配置，quit执行脚本退出，
    每输入一步，执行一步操作，若中途退出，请注意脚本执行过程中的以执行的操作
```shell
    使用此命令执行脚本
    ./chroot-install.sh
```