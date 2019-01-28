"My first vimrc for real


"PLUGINS

call plug#begin('~/.vim/plugged')
		Plug 'dylanaraps/wal.vim'	
		Plug 'PotatoesMaster/i3-vim-syntax'
		Plug 'Valloric/YouCompleteMe'
		Plug 'tpope/vim-fugitive'
		Plug 'lervag/vimtex'
		Plug 'vim-scripts/java_getset.vim'
call plug#end()

"SETTINGS

filetype plugin on
set tabstop=2
set softtabstop=4
set shiftwidth=4
set noexpandtab
set spell
set spelllang=pt_br,en_gb
syntax on
set number relativenumber
set nocompatible
set encoding=utf-8
autocmd BufNewFile BufRead *.bib	setfiletype bib
autocmd BufNewFile BufRead *.h		setfiletype c
colorscheme wal
"Disables automatic commenting on newline:
		autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"Autocomplete
		let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py' 
"Set splits
		set splitbelow
		set splitright

"MACROS

"Bash Shabang
		autocmd BufNewFile *.sh 0r ~/Templates/Bash/Shabang.sh
"Jump shortcut
		inoremap ;;	<++>
"Run xrdb when .Xresources or .Xdefaults are updated
		autocmd BufWritePost ~/.Xresources !xrdb -merge .Xresources
"Restart i3 when i3 config is updated
		autocmd BufWritePost .config/i3/config !i3-msg restart
"		my bib bindings
		autocmd FileType bib inoremap ;b @book{,<Return>title<Space>=<Space>"<++>",<Return>author<Space>=<Space>"<++>",<Return>year<Space>=<Space>"<++>",<Return>publisher<Space>=<Space>"<++>"<Return>}<Esc>%<Right>i
		autocmd Filetype bib inoremap ;a @article{,<Return>title<Space>=<Space>"<++>",<Return>author<Space>=<Space>"<++>",<Return>year<Space>=<Space>"<++>",<Return>journal<Space>=<Space>"<++>",<Return>volume<Space>=<Space>"<++>"<Return>}<Esc>%<Right>i
"Shows pdfs
		nnoremap			''	:!~/.scripts/showpdf.sh %<Return>
"Goto 
		inoremap		<Space><Space>		<Esc>/<++><Return>"_c4l
		nnoremap		<Space><Space>		<Esc>/<++><Return>"_c4l
"Sets macro
		inoremap		;c					##<Space>
"Autoclose
		inoremap		(						()<Left>
		inoremap		"						""<Left>
		inoremap		'						''<Left>
		inoremap		{						{}<Left>
		inoremap		[						[]<Left>
"Splits
		nnoremap <C-h> <c-w>h
		nnoremap <C-j> <c-w>j
		nnoremap <C-k> <c-w>k
		nnoremap <C-l> <c-w>l
"Nerdtree
		nnoremap <Tab>r	:NERDTreeFocus<Return>
		nnoremap <Tab>f	:NERDTreeFind<Space>
"Folds
		augroup remember_folds
				autocmd BufWritePost * mkview
				autocmd BufRead			 * silent loadview
		augroup END
		vnoremap <Return>		za<Esc>
		nnoremap ff					V/^$<Return>/^$<Return>zf
"Deletes all whitespace in file
		nnoremap d<Space>		:g/^\s*$/d<home>
"PYTHON

augroup python 	
		autocmd FileType python inoremap ;l			[<Space>for<Space><++><Space>in<Space><++>]<Space><++><Esc>F[li
		autocmd Filetype python inoremap if			if():<Left><Left>
		autocmd FileType python inoremap for		for<Space><Space><Space>in<Space><++><Esc>BB<Left><Left>i
augroup END

"TEX

augroup tex
		autocmd BufNewFile	 *.tex	0r ~/Templates/Tex/basic.tex
		autocmd BufWritePost *.tex	call Build_Compile()
		autocmd FileType tex		set tabstop=2
		autocmd FileType tex		inoremap		;fl			\begin{flushleft}<Return><Return>\end{flushleft}<Up>
		autocmd FileType tex		inoremap		PP			\par
		autocmd FileType tex		inoremap		LL			\large
		autocmd FileType tex		inoremap		CC			\begin{citacao}<Return>\cite{<++>}<Return>\end{citacao}<Up><Esc>I<Space><Left>
		autocmd FileType tex		inoremap		BB			\textbf{}<Esc>%<Right>i
		autocmd FileType tex		inoremap		II			\textit{}<Esc>%<Right>i
		autocmd FileType tex		inoremap		EE			\emph{}<Esc>%<Right>i
		autocmd FileType tex		inoremap		UU			\underline{}<Esc>%<Right>i
		autocmd FileType tex		inoremap		SS			\section{}<Esc>%<Right>i
		autocmd FileType tex		inoremap		NN			\newpage
		autocmd FileType tex		inoremap		IT			\begin{itemize}<Return><Return>\end{itemize}<Up>
		autocmd FileType tex		inoremap		;fr			\begin{flushright}<Return><Return>\end{flushright}<Up>
		autocmd FileType tex		inoremap		;fc			\begin{center}<Return><Return>\end{center}<Up>
		autocmd FileType tex		inoremap		\(			\(\)<Left><Left>
		autocmd FileType tex		inoremap		;b			\begin{name}<Return><Return>\end{name}<Esc>V2k:s/name//g<Left><Left>
		autocmd Filetype tex		inoremap		;fp			\begin{lstlisting}[language=Java, caption=Célula Simples, tabsize=2, breaklines=true, columns=flexible, numbers=left, numberstyle=\tiny]<Return><Return>\end{lstlisting}<Up>
augroup END
function Build_Compile()
		!latexmk -pdf %
		!~/.scripts/latex-clean.sh %
endfunction

"C/C++

augroup c
		autocmd BufNewFile	 *.c  0r ~/Templates/C/basic.c
		autocmd BufWritePost *.c	!gcc -Wall -ansi %
		autocmd BufWritePost *.h	!g++ %
		autocmd FileType c	inoremap ;s			struct{<Return><Return>}<++>;<Return><Up><Up><Tab>
augroup END

"JAVA

augroup java
		autocmd BufNewFile	 *.java					exe "normal 0ipublic class " . expand('%:t:r') . "{\n\n\<Esc>1G"
		autocmd BufNewFile	 *.java					exe "normal Oimport java.util.*;\n\<Esc>\<Up>"
		autocmd BufWritePost *.java					!javac %
		autocmd FileType java inoremap print		System.out.println();<Left><Left>
		autocmd FileType java inoremap if				if(){<Return><++><Return>}<++><Esc>0%<Left>i
		autocmd Filetype java inoremap main			public<Space>static<Space>void<Space>main(String[] args){<Return><Return>}<Up><Tab><Tab>
		autocmd Filetype java inoremap while		while(){<Return><++><Return>}<++><Esc>0%<Left>i
		autocmd Filetype java inoremap for			for(;<++>;<++>){<Return><++><Return>}<++><Esc>0%<Left>%a
augroup END

