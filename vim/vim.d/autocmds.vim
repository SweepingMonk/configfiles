" ==================================================
" auto commands
" ==================================================
fun! RemoveTrailingWhitespace()
	let l = line(".")
	let c = col(".")
	%s/\s\+$//e
	call cursor(l, c)
endfun

if has('autocmd')
	augroup NonPluginAutoCommands

		" clear the auto command group so we don't define it multiple times
		autocmd!

		" when editing a file, always jump to the last cursor position.
		" this must be after the uncompress commands.
		autocmd BufReadPost *
					\ if line("'\"") > 1 && line ("'\"") <= line("$") |
					\   exe "normal! g`\"" |
					\ endif

		" auto expend tab to spaces while file type is python
		autocmd FileType python set expandtab

		" auto removing trailing whitespace
		autocmd BufWritePre * :call RemoveTrailingWhitespace()
	augroup END
endif

