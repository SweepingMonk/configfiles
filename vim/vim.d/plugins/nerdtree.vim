" Nerdtree plugin settings

if exists('g:plug_register_plugins')
	Plug 'scrooloose/nerdtree'
	finish
endif


" ============= settings ====================

if has('autocmds')
	" open nerdtree automatically when vim starts up on opening a directory
	autocmd StdinReadPre * let s:std_in = 1
	autocmd VimEnter * 
				\if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") 
				\| exec 'NERDTree' argv()[0] 
				\| wincmd p | ene 
				\| endif
endif


" key map for nerdtree
map <C-n> :NERDTreeToggle<CR>
