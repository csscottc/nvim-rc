syntax on

set nowrap
set smartcase
set scrolloff=8
set number
set incsearch
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nohlsearch
set noerrorbells
set signcolumn=yes
set termguicolors
set colorcolumn=80

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'morhetz/gruvbox'
Plug 'dense-analysis/ale'
call plug#end()

syntax enable
let g:gruvbox_italic=1
autocmd vimenter * ++nested colorscheme gruvbox

let mapleader = " "

nnoremap <C-p> :GFiles<CR> 
nnoremap <leader>pf :Files<CR> 
nnoremap <leader><CR> :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>pv :Vex<CR>
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>

