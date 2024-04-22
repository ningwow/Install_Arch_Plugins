#!/bin/bash

# 函数定义，接收一个参数并执行相关操作
perform_action() {
    local input_value=$1
    echo "Performing action with value: $input_value"
    # 实际操作逻辑在这里定义
}

# 主循环，处理输入并调用函数
while true; do
    echo "Please enter a value (or leave blank for default operation):"
    read input

    # 检查输入是否为空
    if [[ -z "$input" ]]; then
        echo "No input provided. Performing default operation..."
        # 执行默认操作
        break
    elif [[ "$input" == "quit" ]]; then
        echo "Exiting program."
        exit 0
    else
        # 使用输入值调用函数
        perform_action "$input"

        # 确认是否继续
        while true; do
            echo "Are you sure you want to continue? (yes/y or no/n)"
            read confirmation

            case "${confirmation,,}" in  # 将输入转换为小写
                'yes'|'y')
                    echo "Continuing with the rest of the script..."
                    break 2  # 跳出两层循环，继续脚本
                    ;;
                'no'|'n')
                    echo "Restarting input..."
                    continue 2  # 跳回到外层循环的开始
                    ;;
                *)
                    echo "Invalid input, please answer yes/y or no/n."
                    ;;
            esac
        done
    fi
done

# 此处添加脚本的其他部分
echo "Executing remaining part of the script..."



# 函数定义：
# perform_action 是一个简单的函数，接收一个参数并显示一条消息。你可以在此函数中加入更复杂的逻辑，比如处理文件、数据库操作等。
# 主循环：
# 这是脚本的核心部分，用于接收和处理用户输入。
# 如果用户输入为空，执行默认操作并退出循环。
# 如果用户输入 "quit"，脚本将退出。
# 否则，将调用 perform_action 函数处理输入。
# 确认循环：
# 在执行任何操作后，用户需要确认是否继续。
# 根据用户的响应，脚本可以继续执行、重新开始输入处理或输出错误消息并要求重新确认。
# 脚本的其余部分：
# 确认后，脚本将继续执行其余的部分。
# 特性和注意事项
# 使用 break 2 和 continue 2 来控制嵌套循环。
# 处理用户输入时转换为小写，以使确认步骤不区分大小写。
# 通过外部循环确保即使发生输入错误，用户也有机会重新输入。