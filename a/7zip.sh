#!/bin/bash

#7zip的linux版
pacman -S --noconfirm p7zip

#7z x file_name     直接解压到原名目录
#7z x -o new_name file_name     解压到新目录

#7z a archive_nanme file_name file_name2 ...        将文件目录添加到文档
#7z u archive_name new_filw_name        更新文档内容或添加新文件