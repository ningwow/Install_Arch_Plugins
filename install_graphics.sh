#!/bin/bash

echo "请选择要安装的显卡驱动类型:"
echo "1. AMD集成显卡/独显"
echo "2. Intel集成显卡"
echo "3. Nvidia独显"
read -p "输入选择（1-3）: " choice

case $choice in
    1)
        Plugins/Graphics-card-driver/install_amd.sh
        ;;
    2)
        Plugins/Graphics-card-driver/install_intel.sh
        ;;
    3)
        Plugins/Graphics-card-driver/install_nvidia.sh
        ;;
    *)
        echo "无效输入，退出程序。"
        exit 1
        ;;
esac

echo "显卡驱动安装完成。"
