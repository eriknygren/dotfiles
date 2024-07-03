set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin()

Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'lewis6991/gitsigns.nvim'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'tpope/vim-fugitive'

Plug 'romgrk/barbar.nvim' " tabs

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

Plug 'github/copilot.vim'

" LSP setup from https://github.com/VonHeikemen/lsp-zero.nvim/blob/v2.x/doc/md/configuration-templates.md#vimscript-template
Plug 'neovim/nvim-lspconfig'                           " Required
Plug 'williamboman/mason.nvim', {'do': ':MasonUpdate'} " Optional
Plug 'williamboman/mason-lspconfig.nvim'               " Optional

" Autocompletion
Plug 'hrsh7th/nvim-cmp'         " Required
Plug 'hrsh7th/cmp-nvim-lsp'     " Required
Plug 'L3MON4D3/LuaSnip'         " Required

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v2.x'}
" End of LSP setup

" ALE for formatting
Plug 'dense-analysis/ale'

call plug#end()

"nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

let &inccommand = ""
set guicursor=i:block

lua require('config')


map <Leader>f :ALEFix<CR>

let g:ale_fixers = {
  \   'javascript': [
  \       'eslint',
  \       'prettier',
  \   ],
  \   'typescript': [
  \       'eslint',
  \       'prettier',
  \   ],
  \   'vue': [
  \       'eslint',
  \       'prettier',
  \   ],
  \   'ruby': [
  \       'rubocop',
  \   ],
  \}

let g:ale_disable_lsp = 0

let g:ale_ruby_rubocop_executable = 'bundle'

" copilot settings
imap <silent><script><expr> <C-w> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
