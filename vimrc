" settings of SweepingMonk
" Vundle 设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This must be first, because it changes other options as a side effect.
set nocompatible

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

filetype off "vundle required

if OS() == "windows"
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
if has("python") || has("python3")
    Plugin 'SirVer/ultisnips' 
	Plugin 'honza/vim-snippets'
endif
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'bling/vim-airline'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'pangloss/vim-javascript'
Plugin 'jlanzarotta/bufexplorer'
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
if exists("+colorcolumn")
    set colorcolumn=80
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set cot=menu

syntax on     "语法高亮

set autoindent		" 自动对齐
set cinoptions=g0
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
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
if &t_Co == 256
	colorscheme molokai
else
	set background=dark "设置背景为深色
endif

if has("gui_running")
	colorscheme molokai
	set guioptions+=b
	if OS() == "windows"
		set guifont=Consolas:h12
	elseif OS() == "mac"
		set guifont=Monaco:h13
	else
		set guifont=Monospace\ 14
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
" tabline setting
if has('gui')
	set guioptions-=e
endif
if exists("+showtabline")
	function MyTabLine()
		let s = ''
		let t = tabpagenr()
		let i = 1
		while i <= tabpagenr('$')
			let buflist = tabpagebuflist(i)
			let winnr = tabpagewinnr(i)
			let s .= '%' . i . 'T'
			let s .= (i == t ? '%1*' : '%2*')
			let s .= ' '
			let s .= i . ':'
			let s .= winnr . '/' . tabpagewinnr(i,'$')
			let s .= ' %*'
			let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
			let bufnr = buflist[winnr - 1]
			let file = bufname(bufnr)
			let buftype = getbufvar(bufnr, 'buftype')
			if buftype == 'nofile'
				if file =~ '\/.'
					let file = substitute(file, '.*\/\ze.', '', '')
				endif
			else
				let file = fnamemodify(file, ':p:t')
			endif
			if file == ''
				let file = '[No Name]'
			endif
			let s .= file
			let i = i + 1
		endwhile
		let s .= '%T%#TabLineFill#%='
		let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
		return s
	endfunction
	set stal=2
	set tabline=%!MyTabLine()
	map    <C-Tab>    :tabnext<CR>
	imap   <C-Tab>    <C-O>:tabnext<CR>
	map    <C-S-Tab>  :tabprev<CR>
	imap   <C-S-Tab>  <C-O>:tabprev<CR>
endif


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
let g:UltiSnipsEditSplit="vertical"

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


" vim-airline plugin settings
let g:airline#extensions#bufferline#enabled = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
