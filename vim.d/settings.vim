" ========================================
" helper functions
" =======================================
" OS detect function
function OS()
	let l:os = ""
	if has("win32") || has("win64")
		let l:os = "windows"
	elseif has("macunix") || has("mac")
		let l:os = "mac"
	else
		let l:os = "linux"
	endif

	return l:os
endfunction


" ==========================================
" file related settings
" ==========================================
filetype plugin indent on

" file encoding setting
if OS() == "windows"
	set encoding=gbk
else
	set encoding=utf-8
endif

set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set path=.,/usr/include/,/usr/local/include
set autowrite
set nobackup        " do not keep a backup file


" ========================================
" editor settings
" ========================================
syntax on
set autoindent

set number		"show line number
set tabstop=4		"set tab width as 4
set softtabstop=4
set shiftwidth=4

" show colorcolumn if having colorcolumn feature
if has('colorcolumn')
	set colorcolumn=100
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set cot=menu

set cinoptions=g0
set cursorline            " highlight current line

" ========================================
" mouse settings
" ========================================
if has('mouse')
	set mouse=a
endif
if has("gui_running")
	set mousehide		" Hide the mouse when typing text
endif

" ========================================
" colorscheme settings
" ========================================
if has("gui_running")
	set background=light
	silent! colorscheme Tomorrow-Night
	set guioptions+=b
	if OS() == "windows"
		set guifont=Consolas:h12
	elseif OS() == "mac"
		set guifont=Inconsolata:h16
	else
		set guifont=Monospace\ 14
	endif
else
	set background=dark
	if &t_Co == 256
		silent! colorscheme Vim-Tomorrow-Night
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

" always display the airline statusline
set laststatus=2
"设置状态栏显示的样式
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ========================================
" search settings
" ========================================
set ignorecase      " ignore case
set incsearch		" do incremental searching
set smartcase       " do smart case matching
set showmatch       "show matching brackets
set hlsearch

" auto change to directory in which current buffer is
if exists('+autochdir')
	set autochdir
endif
