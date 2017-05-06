" =================================================
" plugin settings
" =================================================


for file in split(glob(g:vimdir . '/plugins/*.vim'), '\n')
	exe 'source' fnameescape(file)
endfor
