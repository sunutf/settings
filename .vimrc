call plug#begin('~/.vim/plugged')
Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
call plug#end()

execute pathogen#infect()

" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background = 233
colo seoul256

" seoul256 (light):
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253
"let g:seoul256_background = 256
"colo seoul256-light

"set paste

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-syntastic/syntastic'
Plugin 'tommcdo/vim-lion'
call vundle#end()            " required
filetype plugin indent on    " required

set tags=/data/tags


" <F2> Switch Window
map <F2> <C-w><C-w> 
" <F3> NERDTree 
map <F3> :NERDTreeToggle<cr>
map <F4> :IndentLinesToggle<cr>
map <F5> :w<cr>:SyntasticCheck<cr>
map <F6> :!git diff % <cr>
map <F7> :!git blame % <cr>
map <F10> :PymodeLintAuto<cr>

inoremap <C-S> :wq<CR>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

" Pymode Settings
let pymode_lint_checkers = ['pep8', 'mccabe']
let g:pymode_lint_on_write = 1
let g:pymode_lint_message = 1
let g:pymode_lint_cwindow = 0
let g:pymode_lint_signs = 1


"let g:gitgutter_override_sign_column_highlight = 1
"highlight SignColumn guibg=bg
"highlight SignColumn ctermbg=bg

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pyflakes']

" NERDTree
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

let g:indentLine_color_gui = '#385900'
let g:indentLine_color_term = 100
let g:indentLine_char = '¦'
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 0
let g:indentLine_enabled = 0
let g:indentLine_fileTypeExclude = ['help', 'nerdtree', 'text', 'sh']
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']
let g:indentLine_maxLines = 3000
nnoremap \il :IndentLinesToggle

set nu
set mouse=a
set ts=4
set sw=1
set autoindent
set cindent
set smartindent
set smarttab
set cursorline
set modeline
set paste
set shiftwidth=4
set title

set backspace=2

set hlsearch
set showmatch
syntax on
set ruler
set cc=80
highlight ColorColumn ctermbg=blue
"highlight Comment cterm=bold
highlight CursorLine cterm=bold term=none

set smartcase

set laststatus=2 " 상태바 표시를 항상한다
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

au BufReadPost *
   \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \ exe "norm g`\"" |
   \ endif

