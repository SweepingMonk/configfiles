" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible


"if has("vms")
"  set nobackup		" do not keep a backup file, use versions instead
"else
"  set backup		" keep a backup file
"endif
set nobackup        " do not keep a backup file  

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set background=dark "设置背景为深色

if has("gui_running")
	colorscheme tango-morning
	set nowrap
	set guioptions+=b

	set guifont=Monospace\ 12

	set ch=2		" Make command line two lines high

	set mousehide		" Hide the mouse when typing text
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"命令行设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
"""""""""""""""""""""""""""
"搜索设置
"""""""""""""""""""""""""""
set ignorecase      " 忽略大小写
set incsearch		" do incremental searching
set smartcase       " Do smart case matching
set showmatch       "show matching brackets

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")


"""""""""""""""""""""""""""""""""""
"编辑器设置
""""""""""""""""""""""""""""""""""""
set number		"show line number
set tabstop=4		"set tab width as 4
set softtabstop=4
set shiftwidth=4
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set cot=menu

"""""""""""""""""""""""""""""""""
"映射设置
"""""""""""""""""""""""""""""""""
" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>



""""""""""""""""""""""""""""""""""""""""
"文件设置
"""""""""""""""""""""""""""""""""""""""
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set path=.,/usr/include/,/usr/local/include
set autowrite

"Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  set cinoptions=g0
  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"""""""""""""""""""""""""""""""""""""""
"插件设置
"""""""""""""""""""""""""""""""""""""""

"NERDTree Plugin 设置
nmap <silent> <F2> <Esc>:NERDTreeToggle<RETURN>		"NERDTree开关映射F2
let NERDTreeWinSize=28
"Ctags 设置
map <C-F12> :!ctags -R --c++-kinds=+px --fields=+iaS --extra=+q .<CR>
set tags +=/media/BackUp/Workspaces/ctags/tags
" omnicppcomplete 设置
let OmniCpp_SelectFirstItem = 2

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

" javacomplete plugin 设置
if has("autocmd")
	autocmd FileType java setlocal omnifunc=javacomplete#Complete
	autocmd FileType java setlocal completefunc=javacomplete#CompleteParamsInfo
	" autocmd FileType java call javacomplete#SetLogLevel(0)
endif

" mark plugin setting
let g:mwDefaultHighlightingPalette='extended'
let g:mwDefaultHighlightingNum = 9

" autocomplpop plugin setting
"let g:acp_behaviorSnipmateLength = 1

" minibufexplorer plugin 设置
"let g:miniBufExplSplitBelow=0   " 在当前窗口的上方打开新窗口
"let g:miniBufExplSplitToEdge = 1 " 在屏幕边缘打开bufexplorer
"let g:miniBufExplMaxSize = 0     " bufexplorer的最大高度，为0是表示自动
"let g:miniBufExplMinSize = 1     " bufexplorer的最小高度为1
"let g:miniBufExplorerMoreThanOne=3 " 让bufexplorer一直显示
"let g:miniBufExplMapWindowNavVim = 1 " 让mbe可以使用control-m + 方向键来在窗口移动
"let g:miniBufExplMapWindowNavArrows = 1 " 让mbe可以使用control-m + 键盘方向键来在窗口移动
"let g:miniBufExplMapCTabSwitchBufs = 1  
"let g:miniBufExplModSelTarget = 1

"winmanager plugin 设置
"nmap <silent> <M-m> :WMToggle<CR>    "快捷键映射
"let g:persistentBehaviour=0      " 退出其他窗口之后自动退出
"let g:bufExplorerMaxHeight=20    " bufexplorer最大高度
"let g:NERDTree_title="[NERDTree]"
"let g:winManagerWindowLayout="NERDTree|BufExplorer"
"
"function! NERDTree_Start()
"    exec 'NERDTree'
"endfunction
"
"function! NERDTree_IsValid()
"    return 1
"endfunction

