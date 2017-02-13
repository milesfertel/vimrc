set nocompatible
" Vundle stuff
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-repeat'
Plugin 'vim-scripts/Command-T'
Plugin 'vim-scripts/a.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'sjl/gundo.vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'jcf/vim-latex'
Plugin 'roman/golden-ratio'
Plugin 'rhysd/vim-clang-format'

call vundle#end()            " required
filetype plugin indent on
" End Vundle stuff

runtime macros/matchit.vim

" disable annoying beep on errors
set visualbell t_vb=

noremap - ,
let mapleader=","

set nohidden
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set pastetoggle=<F2>
set scrolloff=5
set colorcolumn=80

set expandtab

"set virtualedit=all

inoremap jk <esc>

nnoremap k gk
nnoremap j gj
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>/ :nohlsearch<CR>
nnoremap <leader>w :FixWhitespace<CR>
nnoremap <leader>g :GundoToggle<CR>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Formatting
let g:clang_format#code_style='webkit'
let g:clang_format#detect_style_file = 1
let g:clang_format#command = "/usr/bin/clang-format-3.5"

" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <C-i> gt

command! WQ wq
command! Wq wq
"command Q q
cabbrev W w

" repoen a file at the same line it was on when previously closed
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif

" store all swp files here
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
set undodir=~/.vim/tmp
set viewdir=~/.vim/tmp

" use confirm instead of aborting an action
set confirm

" automatically save and open views (folds)
"set viewoptions-=options

augroup vimrc
    autocmd BufWritePost *
    \   if expand('%') != '' && &buftype !~ 'nofile'
    \|      mkview
    \|  endif
    autocmd BufRead *
    \   if expand('%') != '' && &buftype !~ 'nofile'
    \|      silent loadview
    \|  endif
augroup END

set foldmethod=indent
set foldlevel=999999
set textwidth=120
set undofile
set undolevels=1000
set history=1000
set laststatus=2

scriptencoding utf-8
set encoding=utf-8
set t_Co=256
colorscheme smyck
syntax on
