#全文参考：https://www.nishantnadkarni.tech/posts/arch_installation/ and ：https://www.youtube.com/watch?v=HIXnT178TgI&t=289s

# 查看网络连接
	ip a
	
	连接wlan
	iwctl			\\有时会连不上

	devices list
	station wlan0 connect <wlan_name>

# 对磁盘分区
	lsblk
	
#### gdisk /dev/disk_name
	或者使用cfdisk
	
	n(创建新表)
	enter区间编号（default'1'）
	enter(defaule)(第一个扇区开始)
	+512M (efi分区)
	“Hex code or GUID:efoo”(ef00是efi分区的代码)
	
	n(创建第二个分区)
	enter
	开始扇区
	结束扇区（default=‘最大’）
	“Hex code or GUID:enter”（默认）
	 
	 w(write)
	 y
	 
	 lsblk

## 格式化分区
##### 格式化efi分区
	mkfs.fat -F32 /dev/efi
##### 格式化主分区
	mkfs.btrfs /dev/what  *现在还没搞懂*	\\格式化到ctrfs后，在执行mkinitcpio前，需要该文件
##### 格式化swap分区
	mkswap /dev/what


# reflector（更新镜像源）

	update mirror with command reflector
	让我们检索前 20 个最新的镜像，并按下载率对镜像列表进行排序，并/etc/pacman.d/mirrorlist使用命令将它们保存在文件中：

	$ sudo reflector --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist
	请注意，这将用新镜像替换现有镜像。

### 让我们分解上面的命令，看看每个选项的作用。

	--latest 20-获取最近同步的服务器
	--protocol https-检索https启用的镜像
	--sort rate-根据下载率排序镜像列表
	--verbose- 打印比正常情况更多的信息。
	--country 'china'- 我的首选镜像位置。
	--l 5 --age 12 - 检索国家12个小时内同步过的前五名镜子。
	--age 12 -12个小时同步过的
	-f 5  -最快的5个镜像
	--save /etc/pacman-d/mirrorlist.
	
#### 示例

	中国和美国下载率前5名https保存到/etc/pacman-d/mirrorlist	
	
	$ sudo reflector --country 'China,United States' -l 5 --sort rate --protocol https  --save /etc/pacman-d/mirrorlist
		
#### 获取所有按国家地区排名的镜像	
	$ sudo curl -o /etc/pacman.d/mirrorlist https://archlinux.org/mirrorlist/all/ 或Chian
	然后在/etc/pacman.d/mirrorlist取消注释你需要的镜像
	
## 在安装之前，mount，一定要和脚本相呼应
### ext4文件系统挂载
	mount /dev/disk_name /mnt
	mount /dev/efi_name /mnt/boot		\\boot或efi都行
	onswap /dev/swap	\\启用
### btrfs挂载	"https://www.nishantnadkarni.tech/posts/arch_installation/"
	步骤 8：挂载分区和子卷
	现在我们必须挂载刚刚创建的分区（交换分区除外，因为它不用于存储静态文件）。

	mount /dev/sda3 /mnt
	现在我们已经安装了根子卷，我们必须为 btrfs 创建子卷。

	我们创建子卷以更好地组织我们的数据并将它们从 btrfs 快照中排除。此外，如果您为单个操作系统使用多个磁盘（例如，Windows C: 和 D: 驱动器位于不同的磁盘上），子卷使您甚至可以将系统文件存储在另一个目录中。在我的个人设置中，我的 HDD 上有 @var 和 @tmp 子卷，以节省安装 Arch 的 SSD 上的空间。

	btrfs su cr /mnt/@
	btrfs su cr /mnt/@home
	btrfs su cr /mnt/@var
	btrfs su cr /mnt/@opt
	btrfs su cr /mnt/@tmp
	btrfs su cr /mnt/@.snapshots
	umount /mnt
	这些子卷主要以具有特定功能的系统目录命名：

	@ - 这是主根子卷，所有子卷都将安装在其上。
	@home - 这是主目录。这包括您的大部分数据，包括桌面和下载。
	@var - 包含日志、临时文件。文件、缓存、游戏等
	@opt - 包含第三方产品
	@temp - 包含某些临时文件和缓存
	@.snapshots - 用于存储 snapper 快照的目录（如果您计划使用 Timeshift 则可以排除此目录）
	现在挂载这些分区：

	mount -o noatime,commit=120,compress=zstd,space_cache,subvol=@ /dev/sda3 /mnt
	# You need to manually create folder to mount the other subvolumes at
	mkdir /mnt/{boot,home,var,opt,tmp,.snapshots}

	mount -o noatime,commit=120,compress=zstd,space_cache,subvol=@home /dev/sda3 /mnt/home

	mount -o noatime,commit=120,compress=zstd,space_cache,subvol=@opt /dev/sda3 /mnt/opt

	mount -o noatime,commit=120,compress=zstd,space_cache,subvol=@tmp /dev/sda3 /mnt/tmp

	mount -o noatime,commit=120,compress=zstd,space_cache,subvol=@.snapshots /dev/sda3 /mnt/.snapshots

	mount -o subvol=@var /dev/sda3 /mnt/var
	# Mounting the boot partition at /boot folder
	mount /dev/sda1 /mnt/boot
	Btrfs 选项：

	noatime - 没有访问时间。通过在访问文件时不写入时间来提高系统性能。
	commit - 数据同步到永久存储的周期间隔（以秒为单位）。
	compress - 选择压缩算法。我设置了 zstd，因为它具有良好的压缩级别和速度。
	space_cache - 使内核能够知道磁盘上的空闲空间块在哪里，从而使其能够在文件创建后立即写入数据。
	subvol - 选择要挂载的 subvol。
	您可以在此处阅读有关 btrfs 挂载选项的更多信息：https://btrfs.wiki.kernel.org/index.php/Manpage/btrfs(5)


# 安装	
## 使用pacstrap命令安装
	
	$ pacstrap /mnt base linux linux-firmware	#最少安装
	$ pacstrap /mnt base linux linux-firmware git vim amd-ucode \\推荐安装，其他可以arch-chroot后安装

## 生成fstab文件
	genfstab -U /mnt >> /mnt/etc/fstab

## chroot到新系统
	arch-chroot /mnt
	
## 修改文件
	vim /etc/mkinitcpio.conf
	在DULES=(btrfs)	\\如果使用btrfs，maybe

## mkinitcpio
	mkinitcpio -p linux \\因为我们安装的是linxu内核，如果是linux-lts，则加linux-lts，不知到这个命令是干啥的，反正是个重要的


## 更改子字体
	vim /etc/locale.gen
	取消注释需要的字体（en_US,zh_CN）
	locale-gen 生成语言环境

# 现在，使用脚本（以下忽略）

	install_arch-1.sh	安装基本系统，然后exit推出chroot且umount -l、然后重启了
	重启完成后
	输入301791密码登录
	使用sudo
	接下载，安装字体和yay
	然后安装输入法

	使用rjn
	安装yay,chrome
	安装声音控制其器
## 声音方面
	alsamixer
	pipewire套件或者pulse audio(前者在虚拟机上似乎不行)











####### 设置时区
	ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
	
	将系统时钟设置为硬件失踪-并更行/etc/adjtime 中的时间戳	#看是否需要，双系统也许需要额外设置
	$ hwclock --systohc
	
	
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
