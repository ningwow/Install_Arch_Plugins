eg() {
    local input_value=$1  # 使用 local 关键字定义局部变量，它只在此函数内有效
    # 在这里，你可以添加更多的代码来处理 input_value，比如数据库操作、文件处理等

}


#设置..
input=""
while true; do
    # 提示用户输入值或直接按回车键选择默认操作
    echo ":"
    read input

    # 检查输入是否为空，若为空执行默认操作并退出循环
    if [[ -z "$input" ]]; then
        echo "No input provided. default"
        # 默认操作代码，可以根据需要进行修改
        
        break  # 退出 while 循环
    elif [[ "$input" == "quit" ]]; then
        # 提供了一个退出脚本的选项，当用户输入 "quit" 时，脚本将结束
        echo "Exiting program."
        exit 0
    else
        # 如果提供了非空输入，调用 perform_action 函数并传递输入
         "$input"
    fi
done