---
# 此项目是作为个人使用的安装arch linux的脚本笔记
# 部分参考：https://sspai.com/post/78916
---
    正在优化中...
## 准备操作：
    pacman -Qe >> list.txt 此命令可以输出所有手动安装的包名
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
---

---
### btrfs 文件系统

    第一步：
    使用cfdisk /dev/nvme*** 最少分boot分区(1g),和主分区

    第二步：
    然后进行格式化
```shell
    mkfs.fat -F 32 /dev/sda1    # 格式化 boot 分区
    mkswap /dev/sda2        # 格式化主分区
    mkfs.btrfs /dev/sda3    # 格式化 swap 分区
```
    第三步：
    然后是挂载分区，btrfs 分区的挂载比较复杂，首先挂载整个 btrfs 分区到 /mnt，这样才可以创建子卷：
```shell
    mount /dev/sda3 /mnt    # 挂载分区
    # 创建子卷
    btrfs subvolume create /mnt/@
    btrfs subvolume create /mnt/@home
    btrfs subvolume create /mnt/@etc
    btrfs subvolume create /mnt/@usr
    btrfs subvolume create /mnt/@log
    btrfs subvolume create /mnt/@pkg
    umount /dev/sda3    # 卸载分区
```
    第四步：
    一定先卸载分区，再重新挂载
    关于子卷的划分，使用 Timeshift 来管理快照，而 Timeshift 只支持 Ubuntu 类型的子卷布局，也就是根目录挂载在 @ 子卷上，/home 目录挂载在 @home 子卷上；另外我还打算使用 grub-btrfs 来为快照自动创建 grub 目录，grub-btrfs 要求 /var/log 挂载在单独的子卷上；还有 @pkg 子卷挂载在 /var/cache/pacman/pkg 目录下，这个目录下保存的是下载的软件包缓存，也没什么保存快照的必要，所以也单独划分了个子卷。
    接下来就是挂载子卷了，使用 subvol 挂载选项来指定挂载的子卷：
```shell
    # 挂载根目录
    mount /dev/sda3 /mnt -o subvol=@,noatime,discard=async,compress=zstd
    # 挂载家目录
    mkdir /mnt/home
    mount /dev/sda3 /mnt/home -o subvol=@home,noatime,discard=async,compress=zstd
    # 挂载 /var/log 目录
    mkdir -p /mnt/var/log
    mount /dev/sda3 /mnt/var/log -o subvol=@log,noatime,discard=async,compress=zstd
    # 挂载 /var/cache/pacman/pkg 目录
    mkdir -p /mnt/var/cache/pacman/pkg
    mount /dev/sda3 /mnt/var/cache/pacman/pkg -o subvol=@pkg,noatime,discard=async,compress=zstd
```
    subvol=@：这个选项告诉挂载命令要挂载名为@的Btrfs子卷。
    noatime：这个选项防止文件系统更新文件被读取的访问时间属性。这可以通过减少写操作来提高性能。
    discard=async：这个选项启用异步TRIM操作，适用于SSD，帮助管理存储，通过释放不再使用的块来优化空间。
    compress=zstd：这个选项启用Zstandard（zstd）算法进行压缩，可以提高存储效率和性能。

除了 subvol 选项用来指定挂载的子卷，我还添加了其他的挂载选项用于优化 btrfs 文件系统的性能：noatime 选项可以降低数据读取和写入的访问时间；discard=async 选项可以在闲时释放磁盘中未使用的区块，也就是 TRIM，另外也可以不添加这个选项，而是在系统安装完成后启用 fstrim.timer 服务从而定时执行 TRIM，可以根据自己的喜好选择；compress 选项可以在数据写入前进行压缩，减少磁盘的写入量，增加磁盘寿命，在某些场景下还能优化一些性能，支持的压缩算法有 zlib、lzo 和 zstd，zstd 算法是最快的。关于更多的挂载选项，可以看这里。在系统安装完成后也可以编辑 /etc/fstab 文件修改挂载选项。

    因为 /var/log 和 /var/cache/pacman/pkg 在将来并不会被保存快照，也可以选择为这两个目录禁用写时复制：

    chattr +C /mnt/var/log
    chattr +C /mnt/var/cache/pacman/pkg
    接下来挂载其他分区：

    # 挂载 boot 分区
    mkdir /mnt/boot
    mount /dev/sda1 /mnt/boot
    # 启用 swap 分区
    swapon /dev/sda2
    接下来便可以继续接下来的安装步骤了。

### 关于btrfs的快照

btrfs 文件系统最吸引人的特性之一就是快照，通过快照可以方便地回滚系统，虽然我们也可以在命令行手动创建快照，但多少有些麻烦，为了更好地创建和管理快照，可以借助一些其他工具，我使用的是 LinuxMint 团队开发的 Timeshift，注意 Timeshift 只支持 Ubuntu 类型的子卷布局，这在之前的分区过程中已经搞定了。只需从 AUR 安装，之后打开按照向导一路设置就好了，记得要启用 cronie 服务，sudo systemctl enable cronie.service --now，以保证 Timeshift 能够定时创建快照。此外也可以安装 timeshift-autosnap，这个包添加了一个 pacman hook，可以在每次系统升级前自动创建快照。
```shell
接下来安装 grub-btrfs，这个软件可以在每次重新生成 grub 配置文件时添加快照的入口，可以在不恢复快照的情况下直接启动进入快照，方便故障排查。若是觉得每次创建快照后都要手动运行 grub-mkconfig 过于麻烦，这个包还提供了一个 systemd 服务 grub-btrfsd.service，需先安装 grub-btrfs 的可选依赖 inotify-tools，然后启用这个服务 sudo systemctl enable grub-btrfsd.service --now 就可以在每次创建快照后自动生成 grub 配置文件了，

```
不过这个服务默认监视的快照路径在 /.snapshots，而 Timeshift 创建的快照是一个动态变化的路径，想要让它监视 Timeshift 的快照路径需要编辑 service 文件。一般情况下不推荐直接编辑位于 /usr/lib/systemd/system/ 下的 service 文件，因为软件包升级会将编辑后的文件覆盖掉，还好 systemd 提供了解决方案，运行 sudo systemctl edit --full grub-btrfsd，这个命令会将 /usr/lib/systemd/system/grub-btrfsd.service 文件复制到 /etc/systemd/system/grub-btrfsd.service，再用系统默认的文件编辑器打开，这样编辑后的文件就不会被覆盖掉了，找到下面这一行：
```shell
ExecStart=/usr/bin/grub-btrfsd --syslog /.snapshots
修改为：

ExecStart=/usr/bin/grub-btrfsd --syslog --timeshift-auto
这样 grub-btrfs 就会监视 Timeshift 创建的快照了。
```
Timeshift 创建的快照默认是可读写的，但若用其他的快照管理程序，创建的快照可能是只读的，这种情况下，直接启动进入快照可能会发生错误，这种情况 grub-btrfs 也提供了解决方案，grub-btrfs 提供了一个 grub-btrfs-overlayfs 钩子，编辑 /etc/mkinitcpio.conf，找到 HOOKS 一行，在括号最后添加 grub-btrfs-overlayfs，比如这样：

HOOKS=(base udev autodetect modconf block filesystems keyboard fsck grub-btrfs-overlayfs)
然后重新生成 initramfs，sudo mkinitcpio -P。在这之后创建的只读快照，将会以 overlayfs 的形式启动进入，所有的改动将会存储在内存里，重启后都会消失，逻辑和大多数系统的 live-cd 安装镜像差不多。
---

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
### 修改mkinitcpio.conf文件
```shell
vim /etc/mkinitcpio.conf
在MODULES=(btrfs) 中加上btrfs
```
---
# 在进入到chroot系统后，就可以使用脚本文件简化操作
---
### 对chroot-install.sh 脚本的解释
    若需要对efi挂载路径改变，请确保上方的挂载点与grub路径相同
    默认root密码和新建的用户密码相同
    默认新用户加入wheel组
    可选项：时域，语言，键盘映射，主机名，新建用户明，密码
    其余配置请更改脚本
### 克隆本项目
```shell
    git clone https://github.com/ningwow/Install_Arch_Plugins.git
    cd Install_Arch_Plugins
    chmod +x chroot-install.sh
```
### 脚本选项
    对于脚本中的选择：默认，quit，*
    默认会执行默认的配置，quit执行脚本退出，
    每输入一步，执行一步操作，若中途退出，请注意脚本执行过程中的以执行的操作
### 执行脚本
```shell
    使用此命令执行脚本
    ./chroot-install.sh
```
# 之后的脚本并未测试，推荐手动安装显卡驱动
# Pulgins中包含安装好之后的一些小配置
