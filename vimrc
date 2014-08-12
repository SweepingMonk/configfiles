" settings of SweepingMonk
" Vundle 设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This must be first, because it changes other options as a side effect.
set nocompatible


filetype off "vundle required

if has("win32") || has("win64")
	set rtp+=$VIM/vimfiles/bundle/vundle
	let path='$VIM/vimfiles/bundle'
	call vundle#begin(path)
else
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
endif


"let vundle manage vundle, required
Plugin 'gmarik/Vundle.vim'

"plugins list
"original repos on github
"Plugin 'SirVer/ultisnips' 
Plugin 'bling/vim-airline'
Plugin 'Raimondi/delimitMate'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
"Plugin 'hynek/vim-python-pep8-indent'
Plugin 'tomasr/molokai'
Plugin 'majutsushi/tagbar'

call vundle#end()            " required
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"文件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on "自动检测文件类型并加载相应的插件和自动缩进

if has("win32") || has("win64")
	set encoding=gbk
else
	set encoding=utf-8
endif
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set path=.,/usr/include/,/usr/local/include
set autowrite
set nobackup        " do not keep a backup file  
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"编辑器设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number		"show line number
set tabstop=4		"set tab width as 4
set softtabstop=4
set shiftwidth=4
autocmd FileType python set expandtab  "文件类型为python时，将tab扩展为空格

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set cot=menu

syntax on     "语法高亮

set autoindent		" 自动对齐
set cinoptions=g0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"鼠标设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('mouse')
	set mouse=a
endif
if has("gui_running")
	set mousehide		" Hide the mouse when typing text
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"颜色主题设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark "设置背景为深色

if has("gui_running")
	colorscheme molokai
	set guioptions+=b
	if has("win32") || has("win64")
		set guifont=Consolas:h12
	else
		set guifont=Monospace\ 11
	endif
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"命令行和状态栏设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
if has("gui_running")
	set ch=1
endif

"设置状态行一直显示
set laststatus=2
"设置状态栏显示的样式
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"搜索设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase      " 忽略大小写
set incsearch		" do incremental searching
set smartcase       " Do smart case matching
set showmatch       "show matching brackets
set hlsearch
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"自定义映射
"""""""""""""""""""""""""""""""""
" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
" 保存需要超级用户权限的文件
cmap w!! %!sudo tee > /dev/null %

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
	command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
				\ | wincmd p | diffthis
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERDTree Plugin 设置
nmap <silent> <F2> <Esc>:NERDTreeToggle<RETURN>		"NERDTree开关映射F2
let NERDTreeWinSize=28

"youcomplteme 设置
let g:ycm_key_list_select_completion=["<c-n>", "<Down>"]
let g:ycm_key_list_previous_completion=["<c-p>", "<Up>"]

"Syntastic 设置
let g:syntastic_python_checkers=['pylint']

"ultisnips 设置
let g:UltiSnipsSnippetsDir="~/.vim/myultisnips/"
let g:UltiSnipsSnippetDirectories=["UltiSnips", "myultisnips"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"Tagbar Plugin 设置
nmap <silent> <F3> <Esc>:TagbarToggle<CR> 
let g:tagbar_autoclose=1           " 跳转到指定的tag后自动关闭窗口
let g:tagbar_left=0                " 是否显示在左边
let g:tagbar_width=30              " 宽度
let g:tagbar_autofocus=1           " 是否自动获得焦点
let g:tagbar_compact = 1           " 紧凑布局
let g:tagbar_autoshowtag = 1       " 自动显示标记

"BufExplorer plugin 设置
noremap <silent> <F4> <Esc>:BufExplorer<CR>
noremap <silent> <M-F4> <Esc>:BufExplorerHorizontalSplit<CR>
noremap <silent> <C-F4> <Esc>:BufExplorerVerticalSplit<CR>

let g:bufExplorerSortBy='number'     " Sort by the buffer's number.
let g:bufExplorerShowDirectories=0   " Don't show directories.
let g:bufExplorerDefaultHelp=0       " Do not show default help.
autocmd BufWinEnter \[BufExplorer\] :setlocal nonumber 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
