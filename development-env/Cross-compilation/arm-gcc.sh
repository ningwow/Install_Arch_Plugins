# yay -S arm-linux-gnueabihf-gcc arm-Linux-gnueabihf-gcc-stage1 arm-Linux-gnueabihf-gcc-stage2

#多阶段编译过程解释
# 1. 第一阶段（Stage 1）
# 目的：构建一个初步的交叉编译器。这个初步编译器通常是使用宿主机的原生编译器（如 x86 上的 GCC）构建的。它能够编译简单的代码，但可能不包含所有的优化和目标平台的特性。
# 操作：在你的例子中，这个阶段的编译器被称为 arm-linux-gnueabihf-gcc-stage1，并且你已经完成了这个阶段的删除，可能是为了升级或替换为更高级的编译器版本。
# 2. 第二阶段（Stage 2）
# 目的：使用第一阶段构建的交叉编译器来构建一个更完整、更优化的交叉编译器。这个阶段的编译器通常能够利用更多的目标平台特性进行自我编译，进一步优化生成的代码。
# 操作：在你的例子中，这称为 arm-linux-gnueabihf-gcc-stage2，这是正在安装的部分。这个阶段的编译器将替代或升级之前的编译器，提供更高效的编译能力。