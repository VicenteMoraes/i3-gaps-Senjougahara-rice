"""""""""""""""""""""""""""""""""""""""""""""
"				PLUGINS						"
"""""""""""""""""""""""""""""""""""""""""""""
	call plug#begin('~/.vim/plugged')
		Plug 'dylanaraps/wal.vim'	
		Plug 'davidhalter/jedi-vim', {'for': 'python'}
	call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""
"				SETTINGS					"
"""""""""""""""""""""""""""""""""""""""""""""
	filetype plugin on
	set tabstop=4
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
	set tabstop=4
augroup END
"""""""""""""""""""""""""""""""""""""""""""""
"					TEX						"
"""""""""""""""""""""""""""""""""""""""""""""
augroup tex
	autocmd FileType tex 	colorscheme desert
	autocmd FileType tex	set background=light
	autocmd FileType tex	set tabstop=2
augroup END

"""""""""""""""""""""""""""""""""""""""""""""
"					C/C++					"
"""""""""""""""""""""""""""""""""""""""""""""
	augroup c

	augroup END
