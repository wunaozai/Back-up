"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""		    使用办法
"" 1: git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"" 2: vim foo
"" 3: :BundleUpdate
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 1: gui全屏的时候会有一点小问题
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Date: 2014年 03月 17日 星期一 09:35:03 CST
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"设置行号
:set nu
"自动缩进
:set autoindent
"设置缩进为4个字符，默认为8个
set softtabstop=4
set shiftwidth=4
"增加自动补齐路径
set path=.,/usr/include,/usr/include/c++/4.4.4
"打开语法高亮
syntax on
syntax enable
"设置背景颜色
set background=dark
"深色主题 对保护视力有一定的帮助
colorscheme delek
colorscheme evening
" 设置注释为绿色
highlight Comment ctermfg=red guifg=green
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
"help new-omni-completion help compl-omni "help ft-c-omni
"有一点要注意一下, 切记, 关於omni的设定要写在 filetype plugin ... on, 的后面
"autocmd FileType * set omnifunc=syntaxcomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complete


"if has("autocmd") && exists("+omnifunc")
"     autocmd Filetype *
"   \ if &omnifunc == "" |
"   \   setlocal omnifunc=syntaxcomplete#Complete |
"   \ endif
"endif

"查看制表符
set list
set listchars=tab:>-,trail:-

" 让左右箭头可以智能的上下左右
set whichwrap=b,s,<,>,h,l

" ctags 索引文件 
set tags+=/usr/include/tags
set tags+=/usr/include/c++/4.4.4/tags
" 增加自动补齐路径
set path=.,/usr/include,/usr/include/c++/4.4.4

set cindent

"map<F5>  :w<Enter> :!make<Enter>
map <F5> <esc>:w<cr><esc>:make<cr>:cw<cr><c-w>j
map <cr> <cr>:cclose<cr>
map<F6>  :!make run<Enter>
"map<F6>  : !clear && ./%< <Enter>

nnoremap <space> @=((foldclosed(line('.'))<0)? 'zc':'zo') <cr>
set foldmethod=indent

"设置行高亮
set cursorline
"hi cursorline guibg=Grey40 guifg=red term=BOLD

"窗口之间的快速跳转
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l

"设置<leader>为逗号比较好，因为不同的键盘\按键会有不一样的位置
let mapleader=','






"下面是Vundle插件
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

"============================================================
"vim分屏执行shell
"使用的命令是 ConqueTermSplit <command> , ConqueTermVSplit <command>
Bundle 'vim-scripts/Conque-Shell'


"============================================================
"对不同的filetype进行注释
"使用的方法是 gc{motion} , {visual}gc , gcu 撤销
"	      \\{motion} , {visual}\\ 
Bundle 'tpope/vim-commentary'


"============================================================
"类似vc中的workspace，列出文件中的所有宏，所有全局变量，函数名
Bundle 'taglist.vim'
"下面是配置
let Tlist_Ctags_Cmd='/usr/bin/ctags -R'
let Tlist_OnlyWindow=1
let Tlist_Sort_Type='name'
let Tlist_Auto_Open=1
let Tlist_WinHeight=10
"let Tlist_WinWidth=10
let Tlist_Use_Horiz_Window=0
let Tlist_Exit_OnlyWindow=1
"使用TlistToggle命令打开


"============================================================
"Winanager 管理各个窗口
Bundle 'winmanager'
"下面是配置
let g:persistentBehaviour=0 "只剩下一个窗口时退出
let g:winManagerWidth=20
let g:defaultExplorer=1
let g:winManagerWindowLayout='FileExplorer,Taglist|BufExplorer'
"使用WMToggle命令打开

"============================================================
"BufExplorer
Bundle 'bufexplorer.zip'

"============================================================
"NERD_tree 显示一棵目录树 与默认的FileExplorer类似
Bundle 'scrooloose/nerdtree'
"下面是配置
let g:NERDTree_title="[目录树]"
"使用NERDTreeToggle命令打开


"============================================================
"OmniCppComplete 自动补全加智能感应
"进入要补全的源代码目录执行 ctags -R --c++-kinds=+p
"				     --fields=+iaS
"				     --extra=+q
"				     选项太多的话，会卡顿
"下面是配置
Bundle 'OmniCppComplete'
set tags+=~
let OmniCpp_NamespaceSearch=1
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_ShowAccess=1
let OmniCpp_ShowPrototypeInAbbr=1   "显示参数列表
let OmniCpp_MayCompleteDot=1	    "输入.自动补全
let OmniCpp_MayCompleteArrow=1	    "输入->自动补全
let OmniCpp_MayCompleteScope=1	    "输入::自动补全
let OmniCpp_DefaultNamespaces=["std","_GLIBCXX_STD"]
set completeopt=menu,longest
au CursorMovedI,InsertLeave * if pumvisible()==0 | silent!pclose | endif
"弹出下拉类别的颜色
"hi Pmenu ctermbg=2 ...
"hi PmenuSel ctermbg=5 ...


"============================================================
"SuperTab 加速补全
"Bundle 'SuperTab'
"就两个参数
"let g:SuperTabRetainCompletionType=2
"let g:SuperTabDefaultCompletionType="<c-x><c-o>"
"imap <tab> <c-x><c-o>


"============================================================
"Visual-Mark 高亮书签
"Bundle 'vim-scripts/Visual-Mark'
"使用 mm 高亮


"============================================================
"Mark,vim 对选中的单词进行高亮
Bundle 'vim-scripts/Mark--Karkat'
"let mapleader="\"
"用法 
"<leader>m 标记/取消		 <leader>
"<leader>n 关闭			 <leader>r 正值表达式标记
"<leader>* 同组标记的下一个	 <leader># 同组标记的上一个
"<leader>/ 全部标记的下一个	 <leader>? 全部标记的上一个
"高亮颜色
"hi MarkWord1 ctermbg=...
"hi MarkWord.
"hi MarkWord6 ctermbg=...


"============================================================
"vim-multiple-cursors 多光标选择
Bundle 'vim-multiple-cursors'
let g:multi_cursor_next_key='<c-n>'
let g:multi_cursor_prev_key='<c-p>'
let g:multi_cursor_skip_key='<c-x>'
let g:multi_cursor_quit_key='<esc>'
"用法
"使用c-n选择 c,s 两个字母来替换   i,a 两个用来修改
"用Visul 模式下选择多行然后进行正值表达式匹配
" :'<,'> MultipleCursorsFind 


"============================================================
"vim-airline 修改状态条的颜色等信息 其实
Bundle 'bling/vim-airline'
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'
"let g:airline_section_a=
let g:airline_section_b='%{getcwd()}'
"let g:airline_section_c=
let g:airline_section_x=airline#section#create(['mode',' ','branch',' ','ffenc'])
let g:airline_section_y='%{FileType}'
let g:airline_section_z='%{strftime("%H:%M")}'
"使用AirlineToggle打开 
"AirlineTheme ... 来选择配色


"============================================================
"EasyMotion 快速定位移动
Bundle 'EasyMotion'
"let g:EasyMotion_leader_key='<leader><leader>'
"用法
" <leader><leader>{motion} 
" \\fo  表示向下查找所有o字母
let g:EasyMotion_keys='abcdefghijklmnopqrstuvwxyz'
let g:EasyMotion_do_shade=1  " 1表示背景有高亮
" hi EasyMotionTarget ctermbg=...
" hi EasyMotionShade ctermbg=...
" hi link EasyMotionShade Comment


"============================================================
"css-color.vim 对css中颜色的值进行高亮，需要Gui
Bundle 'css-color.vim'


"============================================================
"AutoComplPop Acp自动弹出
Bundle 'AutoComplPop'
let g:acp_enableAtStartup=0
"下面这个是设置只是对前端起作用，因为对其他支持不是很好
autocmd FileType html,css,htm,xml,jsp,php exec "AutoComplPopEnable"


"============================================================
"Javascript.vim 对js代码高亮
Bundle 'javascript.vim'
setlocal foldlevel=3  "折叠的层数
let b:javascript_fold=1
let javascript_enable_domhtmlcss=1 "对dom,html,css支持


"============================================================
"Emmet 插件  标签框架自动生成
Bundle 'mattn/emmet-vim'
let g:user_emmet_mode='niv'   "表示insert,normal,visual模式
let g:user_emmet_install_global=0
autocmd FileType html,css,jsp,php,htm EmmetInstall  "只对网页启用
let g:user_emmet_leader_key='<c-y>'  "默认是<c-y>
"使用的方法
" ul>li*4 然后 <c-y>,


"============================================================

