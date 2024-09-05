# github: https://github.com/fwupd/fwupd



If you have a device with firmware supported by fwupd, this is how you can check for updates and apply them using fwupd's command line tools.
如果您的设备具有 fwupd 支持的固件，则可以通过以下方式检查更新并使用 fwupd 的命令行工具应用它们。

# fwupdmgr get-devices

This will display all devices detected by fwupd.
这将显示 fwupd 检测到的所有设备。

# fwupdmgr refresh

This will download the latest metadata from LVFS.
这将从 LVFS 下载最新的元数据。

# fwupdmgr get-updates

If updates are available for any devices on the system, they'll be displayed.
如果系统上的任何设备有可用更新，则会显示它们。

# fwupdmgr update

This will download and apply all updates for your system.
这将为您的系统下载并应用所有更新。

Updates that can be applied live will be done immediately.
可以实时应用的更新将立即完成。
Updates that run at bootup will be staged for the next reboot.
启动时运行的更新将在下次重新启动时暂存。
You can find more information about the update workflow in the end users section of the fwupd website.
您可以在fwupd 网站的最终用户部分找到有关更新工作流程的更多信息。