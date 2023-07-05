set shell=/bin/sh

" For Vundle
" -------------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-rails'

Plugin 'ntpeters/vim-better-whitespace'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

Plugin 'ervandew/supertab'

Plugin 'godlygeek/tabular'
Plugin 'https://github.com/airblade/vim-gitgutter.git'

Plugin 'terryma/vim-expand-region'

Plugin 'mileszs/ack.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'mattn/emmet-vim'
Plugin 'leafOfTree/vim-vue-plugin'

Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'jpo/vim-railscasts-theme'
Plugin 'morhetz/gruvbox'

call vundle#end()
filetype plugin indent on

" -------------------------

let mapleader = ','

execute pathogen#infect()

set termguicolors
let g:airline_theme='gruvbox'
"let g:gruvbox_contrast_light = 'hard'
"set background=light
colorscheme gruvbox
"colorscheme railscasts
au BufReadPost *.html+mobile set syntax=html

syntax enable

set noswapfile
set nobackup
set nowrap

set autowriteall

set mouse=a

set number

set incsearch
set hlsearch
set autoindent
set copyindent
set showmatch

set expandtab                 " Use spaces not tabs
set tabstop=2                 " Set indentation to 2 spaces
set shiftwidth=2              " Set indentation to 2 spaces
set backspace=indent,eol,start

set clipboard=unnamed

set laststatus=2
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.DS_Store$']

if executable('rg')
  set grepprg=rg\ --color=never
endif

let g:endwise_no_mappings = 1

let g:user_emmet_mode='i'
let g:user_emmet_leader_key='<C-L>'

map <C-n> :NvimTreeToggle<CR>  " Maps Nvimtree to Ctrl-n

runtime macros/matchit.vim

" Mapping for pane navigation
" --------------------------
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-j> <C-w>j

nnoremap <C-Q> :RuboCop<ENTER>

" Save from whatevur mode you want
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>
vnoremap <c-s> <Esc>:w<CR>

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

map <C-p> :Telescope find_files<CR>
map <C-a> :Telescope live_grep<CR>

" Mapping screen splitting
map <Leader>v :vsp<ENTER>
map <Leader>c :sp<ENTER>


" Map formatter command
map <Leader>f :LspZeroFormat timeout=10000<CR>

map <Leader>i  gg=G'' " auto indent whole file

map <F12> :syntax sync fromstart<cr>


" Clear last search pattern
map <Leader>C :let @/ = ""<ENTER> :call coc#float#close_all()<ENTER>

" Some performance tweaks
set ttyfast
set lazyredraw

autocmd FileType ['javascript', 'html', 'ruby']
autocmd BufWritePre <buffer> StripWhitespace
autocmd BufNewFile,BufRead *.js.jsx set ft=javascript.jsx

let g:ackprg = 'rg --vimgrep --no-heading -F'

cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack
cnoreabbrev ack Ack

" Airline template
"let g:airline_theme='dark'
let g:airline_powerline_fonts = 1

