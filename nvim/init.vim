"Source this from ./config/nvim/init.vim,
"so it becomes easier to manage with gnu stow
"
"

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-tree/nvim-web-devicons' " optional, for file icons
Plug 'nvim-tree/nvim-tree.lua'

call plug#end()

let &inccommand = ""
set guicursor=i:block

inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

lua require('lua/config')
