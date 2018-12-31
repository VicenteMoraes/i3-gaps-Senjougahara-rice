

"""""""""""""""""""""""""""""""""""""""""""""
"				PLUGINS															"
"""""""""""""""""""""""""""""""""""""""""""""
	call plug#begin('~/.vim/plugged')
		Plug 'dylanaraps/wal.vim'	
		Plug 'PotatoesMaster/i3-vim-syntax'
		"Plug 'davidhalter/jedi-vim', {'for': 'python'}
		Plug 'Valloric/YouCompleteMe'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""
"				SETTINGS														"
"""""""""""""""""""""""""""""""""""""""""""""

	filetype plugin on
	set tabstop=2
	set softtabstop=4
	set shiftwidth=4
	set noexpandtab
	set spell
	set spelllang=pt_br
	syntax on
	set number relativenumber
	set nocompatible
	colorscheme wal
	" Disables automatic commenting on newline:
	autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

	"Autocomplete
		let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py' 

"""""""""""""""""""""""""""""""""""""""""""""
"					QOL																"
"""""""""""""""""""""""""""""""""""""""""""""

"Run xrdb when .Xresources or .Xdefaults are updated
		autocmd BufWritePost ~/.Xresources !xrdb -merge .Xresources

"Restart i3 when i3 config is updated
		autocmd BufWritePost .config/i3/config !i3-msg restart

"""""""""""""""""""""""""""""""""""""""""""""
"				MACROS															"
"""""""""""""""""""""""""""""""""""""""""""""

"Goto 
		inoremap		<Space><Space>		<Esc>/<++><Enter>"_c4l
	
"Sets macro
		inoremap		;c					#############################################<Enter>#<Tab><Tab><Tab><Tab><Tab><++><Tab><Tab><Tab><Tab><Tab>#<Enter>#############################################<Enter><Tab><++><Esc>3k0i

"Autoclose
		inoremap		(						()<Left>
		inoremap		"						""<Left>
		inoremap		'						''<Left>
		inoremap		{						{}<Left>
		inoremap		[						[]<Left>

"""""""""""""""""""""""""""""""""""""""""""""
"					PYTHON														"
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
"					TEX																"
"""""""""""""""""""""""""""""""""""""""""""""
augroup tex
		autocmd BufNewFile	 *.tex	0r ~/Templates/Tex/basic.tex
		autocmd BufWritePost *.tex	call Build_Compile()
		autocmd FileType tex		colorscheme desert
		autocmd FileType tex		set background=light
		autocmd FileType tex		set tabstop=2
		autocmd FileType tex		inoremap		<c-a>			<Esc>ggDG0r ~/Templates/Tex/abnt.tex
augroup END

function Build_Compile()
		!latexmk -pdf %
		!~/.scripts/latex-clean.sh %
endfunction

"""""""""""""""""""""""""""""""""""""""""""""
"					C/C++															"
"""""""""""""""""""""""""""""""""""""""""""""
augroup c
		autocmd BufNewFile	 *.c  0r ~/Templates/C/basic.c
		autocmd BufWritePost *.c	!gcc -Wall -ansi %
		autocmd BufWritePost *.h	!g++ %
		autocmd FileType c	inoremap ;s			struct{<Enter><++>;<Enter>}<++>;
augroup END
