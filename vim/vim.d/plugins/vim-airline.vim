" ===========================
" vim-airline
" ===========================

if exists('g:plug_register_plugins')
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	finish
endif

" ==============================
" configurations
" ==============================
let g:airline_left_sep = '>'
let g:airline_right_sep = '<'

" let g:airline#extensions#bufferline#enabled = 1
" let g:airline_theme = 'solarized' " using solarized theme
let g:airline#extensions#tabline#enabled = 1 " enable tabline
