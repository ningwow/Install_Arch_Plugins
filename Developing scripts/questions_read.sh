#!/bin/bash

# 定义一个函数，它接收一个参数并执行一些操作
# 此函数可以根据需要进行扩展或修改以执行实际的业务逻辑
perform_action() {
    local input_value=$1  # 使用 local 关键字定义局部变量，它只在此函数内有效
    echo "Performing action with value: $input_value"
    # 在这里，你可以添加更多的代码来处理 input_value，比如数据库操作、文件处理等

    ##这里输入核心处理代码 这里设置时区为 input_value
    eg：ln -sf /usr/share/zoneinfo/$input_value /etc/localtime


}

#### 主循环，负责处理用户输入并根据输入调用函数
while true; do
    # 提示用户输入值或直接按回车键选择默认操作
    echo "Please enter a value (or leave blank for default operation):"
    read input

    # 检查输入是否为空，若为空执行默认操作并退出循环
    if [[ -z "$input" ]]; then
        echo "No input provided. Performing default operation..."
        # 默认操作代码，可以根据需要进行修改
        break  # 退出 while 循环
    elif [[ "$input" == "quit" ]]; then
        # 提供了一个退出脚本的选项，当用户输入 "quit" 时，脚本将结束
        echo "Exiting program."
        exit 0
    else
        # 如果提供了非空输入，调用 perform_action 函数并传递输入
        perform_action "$input"

######## 在操作执行后请求确认是否继续 //二重确认体 //一般操作不需要
        while true; do
            echo "Are you sure you want to continue? (yes/y or no/n)"
            read confirmation

            # 将确认输入转换为小写并通过 case 语句处理
            case "${confirmation,,}" in
                'yes'|'y')
                    # 如果用户确认继续，则输出消息并跳出两层循环
                    echo "Continuing with the rest of the script..."
                    break 2  # 跳出两层循环：内部的确认循环和外部的主输入循环
                    ;;
                'no'|'n')
                    # 如果用户不希望继续，输出消息并重新开始主循环
                    echo "Restarting input..."
                    continue 2  # 继续外层的主循环，忽略以下代码，重新开始输入处理
                    ;;
                *)
                    # 如果输入既不是 yes/y 也不是 no/n，提示错误并再次请求输入
                    echo "Invalid input, please answer yes/y or no/n."
                    ;;
            esac
        done
    fi
done

# 这里添加脚本剩余部分的代码
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