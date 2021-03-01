call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'neoclide/coc.nvim'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'mattn/emmet-vim'

call plug#end()

nnoremap <SPACE> <Nop>
let mapleader=" "

syntax enable
set clipboard=unnamed
set number
set relativenumber
set termguicolors
set bg=dark
colorscheme gruvbox

set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab


" escape easy
imap jj <esc>
imap jk <esc>

nmap <Leader>w :w<CR> " save file
nmap <Leader>q :q<CR> " close
nmap <Leader>x :bd<CR> " close buffer

noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" automatically remove all trailing spaces
autocmd BufWritePre * %s/\s\+$//e

