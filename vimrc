"

if has("python3")
	python3 import sys
	python3 import os
	python3 import vim
	python3 sys.argv = [vim.eval("v:progname")] 
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=2		" allow backspacing over everything in insert mode
" set ai
set nobackup		" keep a backup file
set viminfo='20,\"90,h,%,n$HOME/.vim/tmp/viminfo
set history=500
" set ruler		" show the cursor position all the time
" set statusline=%<%f%m%r%y%=%b\ 0x%B\ \ %l,%c%V\ %P
set statusline=%<%f%m%r%y\ %{fugitive#statusline()}\ %=%b\ 0x%B\ \ %l,%c%V\ %P

set laststatus=2  " always a status line

set dir=~/.vim/tmp//
set hidden

set incsearch
set ignorecase
set smartcase

set scrolloff=3

" GUI options that need to be set here first
set guioptions-=T
set guioptions+=t

set encoding=utf-8
set printencoding=utf-8
set popt=paper:letter


" Only do this part when compiled with support for autocommands
if has("autocmd")
  " In text files, always limit the width of text to 75 characters
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost * if line("'\"") | exe "'\"" | endif
endif

" Don't use Ex mode, use Q for formatting
map Q gq
" map <F10> :q
inoremap <C-space> <C-x><C-o>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
  colorscheme kwdcolors
endif

filetype off
call pathogen#infect()
call pathogen#helptags()

filetype on
filetype plugin on
filetype indent on

autocmd FileType * set formatoptions=tcql nocindent comments&

augroup cprog
  autocmd FileType c,cpp  :ru cdev.vim
augroup END

augroup pydev
  autocmd FileType python :ru pydev.vim
  autocmd FileType pyrex  :ru pydev.vim
augroup END

augroup pycopia
  autocmd FileType html		:ru html.vim
  autocmd FileType xhtml	:ru html.vim
  autocmd FileType dtd		:ru xml_dtd.vim
  autocmd FileType xml		:ru xml.vim
  autocmd FileType javascript	:ru jsdev.vim
augroup END

augroup newfile
  au!
  autocmd BufNewFile            *.html  0r      ~/Templates/HTML5.html
  autocmd BufNewFile            *.xhtml 0r      ~/Templates/XHTML.xhtml
  autocmd BufNewFile            *.c     0r      ~/Templates/C.c
  autocmd BufNewFile            *.py    0r      ~/Templates/Python.py
  autocmd BufNewFile            *.rst   0r      ~/Templates/RST.rst
augroup END


if &diff
   nmap ZZ :qall<CR>
endif

if v:progname == "mvim"
	set cursorcolumn
	gui
endif

" Enable menus in console vim
if v:progname == "svim"
        source $VIMRUNTIME/menu.vim
        set wildmenu
        set cpo-=<
        set wcm=<C-Z>
        map <F4> :emenu <C-Z>
       nmap <Esc>[5D :bp<CR>
       nmap <Esc>Od  :bp<CR>
       nmap <Esc>[5C :bn<CR>
       nmap <Esc>Oc  :bn<CR>
       nmap <Esc>[3~ :bd<CR>
       nmap ZZ :bd<CR>
endif

map <Leader>td <Plug>TaskList
map <Leader>g :GundoToggle<CR>
map <Leader>n :NERDTreeToggle<CR>

let g:snips_author = 'Keith Dart'
let g:pyflakes_use_quickfix = 0
let g:pep8_map='<leader>8'


