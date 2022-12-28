" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim

" Use the internal diff if available.
" Otherwise use the special 'diffexpr' for Windows.
if &diffopt !~# 'internal'
	set diffexpr=MyDiff()
endif
function MyDiff()
	let opt = '-a --binary '
	if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
	if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
	let arg1 = v:fname_in
	if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
	let arg1 = substitute(arg1, '!', '\!', 'g')
	let arg2 = v:fname_new
	if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
	let arg2 = substitute(arg2, '!', '\!', 'g')
	let arg3 = v:fname_out
	if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
	let arg3 = substitute(arg3, '!', '\!', 'g')
	if $VIMRUNTIME =~ ' '
		if &sh =~ '\<cmd'
			if empty(&shellxquote)
				let l:shxq_sav = ''
				set shellxquote&
			endif
			let cmd = '"' . $VIMRUNTIME . '\diff"'
		else
			let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
		endif
	else
		let cmd = $VIMRUNTIME . '\diff'
	endif
	let cmd = substitute(cmd, '!', '\!', 'g')
	silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
	if exists('l:shxq_sav')
		let &shellxquote=l:shxq_sav
	endif
endfunction
set clipboard=unnamedplus
set number
colorscheme molokai
"colorscheme borland
"colorscheme PaperColor
"colorscheme apprentice
"colorscheme nibble 
"colorscheme alabaster 
set t_Co=256
set background=light
set autoindent
set ts=2
set sw=2
set smartindent
syntax enable
filetype on
filetype indent on
set guifont=Fira_Code:h14:qDRAFT
"set guifont=Perfect DOS VGA 437 Win
"=========================================================
" my cpp settings
"=========================================================
cd N:\cpp\

"map <C-b>!g++ -g % -o %:r <CR>
"map <C-n>!g++ -g % -o %:r && %:r <CR>
map <C-a> gg V G
map <C-c> "+y
map <C-v> "+p
autocmd BufNewFile *.cc 0r N:\cpp\temp\CC.cc | 5
autocmd filetype cpp nnoremap <F9> :w <bar>!cls && g++ -std=c++14 -O2 -Wall % -o %:r && %:r.exe <CR>
" vim-plug
call plug#begin()
Plug 'github.com/907th/vim-auto-save'
Plug 'preservim/nerdtree'
Plug 'NLKNguyen/papercolor-theme'
call plug#end()
"let g:auto_save = 1
"let g:auto_save_events = ["InsertLeave", "TextChanged"]





