set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin()

Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'
Plug 'tpope/vim-fugitive'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

" LSP setup from https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/configuration-templates.md#vimscript-template
Plug 'neovim/nvim-lspconfig'                           " Required
Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'} " Optional
Plug 'williamboman/mason-lspconfig.nvim'               " Optional

" Autocompletion
Plug 'hrsh7th/nvim-cmp'         " Required
Plug 'hrsh7th/cmp-nvim-lsp'     " Required
Plug 'L3MON4D3/LuaSnip'         " Required

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}
Plug 'jose-elias-alvarez/null-ls.nvim'
" End of LSP setup

call plug#end()

"nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

let &inccommand = ""
set guicursor=i:block

lua require('config')
