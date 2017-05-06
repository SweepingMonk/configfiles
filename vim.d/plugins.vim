" ----------------------------------------
" Using vim-plug to manage all plugins
" ----------------------------------------

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Source all the plugins with a global variable set that ensures only the
" Plugin 'name' code will be called.
let g:plug_register_plugins = 1

for file in split(glob(g:vimdir . '/plugins/*.vim'), '\n')
	exe 'source' fnameescape(file)
endfor

unlet g:plug_register_plugins

" initialize plugin system
call plug#end()

" auto install missing plugins
if has('autocmd')
	augroup PluginAutoCommands
		autocmd VimEnter *
					\  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
					\|   PlugInstall --sync | q
					\| endif
	augroup END
endif
