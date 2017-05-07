" ==================================
" python mode
" =================================
 
if exists('g:plug_register_plugins')
	Plug 'klen/python-mode'
	finish
endif


" ==================================
" python mode configurations
" =================================

let g:pymode_rope_goto_definition_bind = '<C-]>'

let g:pymode_lint_ignore = 'E501,W'
