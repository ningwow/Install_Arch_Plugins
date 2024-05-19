"插件设置
"指定插件保存位置
call plug#begin('~/.vim/bundle')
""插件列表

"智能标签行
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

"浏览目录结构并查找文件
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let g:fzf_preview_window = 'right:50%'
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6  }  }
"theme
Plug 'morhetz/gruvbox'
Plug 'rakr/vim-one'
let g:airline_theme='one'
Plug 'whatyouhide/vim-gotham'
call plug#end()




" 检测正在使用的文件类型.
filetype on
" 为检测到的文件类型启用及加载插件.
filetype plugin on
" 为检测到的文件加载缩进文件
filetype indent on
" 语法高亮
set t_Co=256
syntax on
"智能命令
set comments=sl:/*,mb:\ *,elx:\ */
" 显示行号
set number
" 突出光标所在的行和列
set cursorline
"set cursorcolumn
" 将移位宽度设置为 4 个空格。
set shiftwidth=4
" 将制表符宽度设置为 4 列。
set tabstop=4
" 使用空格字符而不是制表符
set expandtab
" 不保存备份文件。
"set nobackup
" 滚动时不要让光标滚动到 N 行以下或以上。
set scrolloff=10
" 不要换行。允许长线尽可能地延伸。
"set nowrap
" 在搜索文件时，会在您键入时逐渐突出显示匹配的字符。
set incsearch
" 搜索时忽略大写字母。
set ignorecase
" 如果搜索大写字母，则覆盖 ignorecase 选项。
" 这将允许您专门搜索大写字母。
set smartcase
" 显示您在屏幕最后一行键入的部分命令。
set showcmd
" 显示你在最后一行的模式。
set showmode
" 在搜索过程中显示匹配的词。
set showmatch
" 进行搜索时使用突出显示。
set hlsearch
" 设置要保存在历史记录中的命令默认数量为 20。
set history=1000
"wildmenu 自动补全功能
"按 TAB 后启用自动完成菜单。
set wildmenu
"使 wildmenu 的行为类似于 Bash 补全。
set wildmode=list:longest
"有些文件我们永远不想用 Vim 编辑。
"Wildmenu 将忽略具有这些扩展名的文件。
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

"""高亮显示配色方案
"""自定义配色目录~/.vim/colors
set background=dark
"colorscheme moonfly 
"colorscheme one 
colorscheme gruvbox 
"colorscheme gotham256
"colorscheme spaceduck 
"default, blue, darkblue, delek, desert, elford, evening, industry, 
"koehler, morning, murphy, pablo, peachpuff, ron, shine, slate, torte, 

"zellner
""状态栏配置
" 重新加载 vimrc 时清除状态行。
set statusline=
" 状态行左侧。
set statusline+=\ %F\ %M\ %Y\ %R
" 使用分隔线将左侧与右侧分开。
set statusline+=%=
" 状态行右侧。因智能化插件，此设置被覆盖
set statusline+=\--------:\ row:\ %l\ col:\ %c\ percent:\ %p%%
" 在倒数第二行显示状态。
set laststatus=2
"使用上一行的缩进
set autoindent
"为c使用智能缩进
set smartindent


