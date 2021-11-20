syntax on

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
set incsearch
set noswapfile
set nowrap
set colorcolumn=80
set noerrorbells
set signcolumn=yes 
set nohlsearch

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'

"LSP Requirements
Plug 'neovim/nvim-lspconfig'

"Telescope Requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"Telescope
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
call plug#end()

syntax enable
let g:gruvbox_italic=1
autocmd vimenter * ++nested colorscheme gruvbox

let mapleader = " "
" Telescope Remaps
nnoremap <C-p> :Telescope git_files<CR> 
nnoremap <leader>pf :Telescope find_files<CR> 
nnoremap <leader>rg :Telescope live_grep<CR>
nnoremap <leader><C-d> :Telescope lsp_definitions<CR>
nnoremap <leader><C-r> :Telescope lsp_references<CR>

nnoremap <leader><CR> :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>pv :Vex<CR>

" Quickfix list Remaps
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>

nnoremap <leader><C-f> :ALEFix prettier<CR>
nnoremap <leader><C-l> :ALEFix eslint<CR>

" Git remaps
nnoremap <leader>gs :G<CR>
nnoremap <leader>gh :0Gclog<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>

" Telescope config
lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            }
        }
    }
}
EOF


" LSP Configuration
lua << EOF
require'lspconfig'.gopls.setup{}
require'lspconfig'.tsserver.setup{}
-- require'lspconfig'.rome.setup{}
EOF
