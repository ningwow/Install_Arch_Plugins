#!/bin/bash

# 初始化变量
input=""
default_value="default"

while true; do
    # 提示用户输入
    echo "Please enter a value (yes/y or no/n), or press Enter for default:"
    read input

    # 处理输入为空的情况，设置默认值
    if [[ -z $input ]]; then
        echo "No input provided. Setting value to default: $default_value"
        # 可以在这里执行一些默认值的操作
        break
    fi

    # 根据输入处理逻辑
    case "${input,,}" in  # 将输入转为小写
        'yes'|'y')
            echo "You entered 'yes'. Performing the YES action..."
            # 插入对应的执行体代码
            break
            ;;
        'no'|'n')
            echo "You entered 'no'. Performing the NO action..."
            # 插入对应的执行体代码
            break
            ;;
        *)
            echo "Invalid input. Please try again."
            ;;
    esac
done

# 这里可以继续执行脚本的其它部分
