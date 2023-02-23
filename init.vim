set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set nu
set nowrap
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
" set noshowmode
set signcolumn=yes
set isfname+=@-@
" set ls=0

" Give more space for displaying messages.
set cmdheight=1

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set colorcolumn=80


call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'

"LSP Requirements
Plug 'neovim/nvim-lspconfig'

"Telescope Requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"Telescope
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
call plug#end()

syntax enable
let g:gruvbox_italic=1

colorscheme carbonfox
let mapleader = " "
" Telescope Remaps
nnoremap <C-p> :Telescope git_files<CR>
nnoremap <leader>pf :Telescope find_files<CR>
nnoremap <leader>rg :Telescope live_grep<CR>
nnoremap <leader><C-d> :Telescope lsp_definitions<CR>
nnoremap <leader><C-i> :Telescope lsp_implementationss<CR>
nnoremap <leader><C-r> :Telescope lsp_references<CR>
nnoremap <leader><C-s> :Telescope lsp_document_symbols<CR>

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

lua require('plugins')

" LSP Configuration
lua << EOF
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldmethod = "expr"

require'lspconfig'.tsserver.setup{}
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>a', vim.lsp.buf.hover, { buffer = 0 })
vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action)

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

local lsp_installer = require('nvim-lsp-installer')
lsp_installer.on_server_ready(function(server)
  local opts = {}
  server:setup(opts)
end)

EOF
