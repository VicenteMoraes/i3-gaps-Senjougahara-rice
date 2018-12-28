"""""""""""""""""""""""""""""""""""""""""""""
"				PLUGINS						"
"""""""""""""""""""""""""""""""""""""""""""""
	call plug#begin('~/.vim/plugged')
		Plug 'dylanaraps/wal.vim'	
		Plug 'PotatoesMaster/i3-vim-syntax'
		Plug 'davidhalter/jedi-vim', {'for': 'python'}
	call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""
"				SETTINGS					"
"""""""""""""""""""""""""""""""""""""""""""""

	filetype plugin on
	set tabstop=2
	set softtabstop=4
	set shiftwidth=4
	set noexpandtab
	syntax on
	set number relativenumber
	set nocompatible
	colorscheme wal
	" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"""""""""""""""""""""""""""""""""""""""""""""
"					QOL						"
"""""""""""""""""""""""""""""""""""""""""""""

"Run xrdb when .Xresources or .Xdefaults are updated
	autocmd BufWritePost ~/.Xresources !xrdb -merge .Xresources

"Restart i3 when i3 config is updated
	autocmd BufWritePost .config/i3/config !i3-msg restart

"""""""""""""""""""""""""""""""""""""""""""""
"				MACROS						"
"""""""""""""""""""""""""""""""""""""""""""""

"Goto 
	inoremap	<Space><Space>		<Esc>/<++><Enter>"_c4l
	
"Sets macro
	inoremap	;c					#############################################<Enter>#<Tab><Tab><Tab><Tab><Tab><++><Tab><Tab><Tab><Tab><Tab>#<Enter>#############################################<Enter><Tab><++><Esc>3k0i

"""""""""""""""""""""""""""""""""""""""""""""
"					PYTHON					"
"""""""""""""""""""""""""""""""""""""""""""""
augroup python 	
"List Comprehension
		autocmd FileType python inoremap ;l [<Space>for<Space><++><Space>in<Space><++>]<Space><++><Esc>F[li

"Checks syntax
		autocmd BufWritePost *.py call Check_Syntax()
augroup END

function Check_Syntax()
		!python -m py_compile %
		!rm -r __pycache__
endfunction

"""""""""""""""""""""""""""""""""""""""""""""
"					TEX						"
"""""""""""""""""""""""""""""""""""""""""""""
augroup tex
	autocmd FileType tex		colorscheme desert
	autocmd FileType tex		set background=light
	autocmd FileType tex		set tabstop=2
	autocmd BufWritePost *.tex	call Build_Compile()
augroup END

function Build_Compile()
	!latexmk -pdf %
	!latexmk -c
endfunction

"""""""""""""""""""""""""""""""""""""""""""""
"					C/C++					"
"""""""""""""""""""""""""""""""""""""""""""""
	augroup c
	autocmd BufWritePost *.c	!gcc -Wall -ansi %
	autocmd BufWritePost *.h	!g++ %
	augroup END
