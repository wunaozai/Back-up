" 设置行号
:set nu

" 自动缩进
:set autoindent
" 设置缩进为4个字符，默认为8个字符
set softtabstop=4
set shiftwidth=4

" 设置自动载入折叠
:loadview

" 增加自动补齐路径
set path=.,/usr/include,/usr/include/c++/4.4.4

" 打开语法高亮
syntax on
syntax enable

" 设置背景颜色
" set background=dark
" 深色主题 对保护视力有一定的帮助
colorscheme delek 
" 设置注释为绿色
highlight Comment ctermfg=green guifg=green
" 设置自动补齐窗口配色
highlight Pmenu guibg=lightgrey ctermbg=lightgrey guifg=black ctermfg=black
highlight PmenuSel guibg=lightgrey ctermbg=blue guifg=blue ctermfg=red

" 右下角显示完整命令
set showcmd

" 打开智能识别
" 自动识别文件类型
" 用文件类型plugin脚本
" 使用缩进定义文件
filetype plugin indent on

" 查看制表符
set list
set listchars=tab:>-,trail:-

" 让左右箭头可以智能的上下左右
set whichwrap=b,s,<,>,h,l


:map <F5> :w<Enter> :!make <Enter>
":map <F5> :!w<Enter> :!gcc % <Enter>
":map <F4> :!chmod +x  %<
:map <F6> :!./%<  <Enter>
":map <F7> :!%< <Enter>
:map <F7> :!make clean <Enter>


" 插件配置
set nocp
" ctags 索引文件 (根据已经生成的索引文件添加即可, 这里我额外添加了 hge 和 curl 的索引文件) 
set tags+=/usr/include/c++/4.4.4/tags
" set tags+=D:/ctags/tags/hge 
" set tags+=D:/ctags/tags/curl " OmniCppComplete 
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1 
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表 
let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全 
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全 
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" 自动关闭补全窗口 
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif 
set completeopt=menuone,menu,longest






" 当创建一个新的c cpp文件时自动调用 SetComment函数
autocmd BufNewFile *.c,*.cpp exec ":call SetComment_C()"

" 当创建一个新的sh 文件时自动调用 SetComment函数
autocmd BufNewFile *.sh exec ":call SetComment_SH()"




" 函数实现过程
func SetComment_C()
    call setline(1,"/****************************************")
    call append(line(".")," * Copyright (C) 2013-".strftime("%Y")." All rights reserved.")
    call append(2," * @Version: 1.0")
    call append(3," * @Created: " . strftime("%Y-%m-%d %H:%M"))
    "call append(4," * @Author: 无脑仔的小明 -- wunaozai@gmail.com")
    call append(4," * @Author: 林明晓 -- 563804489@qq.com")
    call append(5," * @Description: ")
    call append(6," * @GitHub: https://github.com/wunaozai/Linux_Zhanyuan")
    call append(7," *")
    call append(8," * @History: ")
    call append(9," ****************************************/")
" 增加自动补齐路径
set path=.,/usr/include,/usr/include/c++/4.4.4
endfunc

func SetComment_SH()
    call setline(1,"#!/bin/bash")
    call append(line("."),"##################################################")
    call append(2,"# Program:")
    call append(3,"# ")
    call append(4,"# History")
    call append(5,"# Created: " . strftime("%Y-%m-%d %H:%M"))
    call append(6,"# Author: 无脑仔的小明 -- wunaozai@gmail.com")
    call append(7,"##################################################")
    call append(8,"PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin")
    call append(9,"export PATH")
    call append(10,"")
endfunc
