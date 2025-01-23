syntax on
filetype plugin indent on

let maplocalleader = " "
let mapleader = " "

let g:vimwiki_key_mappings = {}
let g:vimwiki_key_mappings.table_mappings = 0

call plug#begin('~/.vim/plugged')

Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'kshenoy/vim-signature'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'romainl/vim-qf'
Plug 'wellle/targets.vim'
Plug 'vim-scripts/a.vim'
Plug 'tpope/vim-abolish'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'preservim/tagbar'
Plug 'morhetz/gruvbox'
Plug 'freitass/todo.txt-vim'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
" Plug 'dense-analysis/ale'

call plug#end()

if isdirectory($HOME . "/vimfiles")

  autocmd BufNewFile *.sh 0r ~/vimfiles/templates/skeleton.sh

  source ~/vimfiles/install-vim-plug.vim
  source ~/vimfiles/vim-grep.vim
  source ~/vimfiles/vim-keymaps.vim
  source ~/vimfiles/autocommands.vim

  source ~/vimfiles/plugin-config/ale.vim
  source ~/vimfiles/plugin-config/format.vim
  source ~/vimfiles/plugin-config/fzf.vim
  source ~/vimfiles/plugin-config/nerdtree.vim
  source ~/vimfiles/plugin-config/quickfix.vim
  source ~/vimfiles/plugin-config/tagbar.vim
  source ~/vimfiles/plugin-config/vim-easy-align.vim
  source ~/vimfiles/plugin-config/vimwiki.vim

  set spellfile=~/vimfiles/spell/en.utf-8.add

endif

if has('nvim')
  set guicursor=""
  set undodir=/tmp/nvim.undo
else
  set nocompatible
  set hidden
  set undodir=~/.vim/undo
  set directory=~/.vim/swap
endif

set background=dark
set completeopt=menuone,noinsert,noselect,preview
set cursorline
set encoding=utf-8
set foldlevel=0 foldmethod=marker
set incsearch ignorecase smartcase hlsearch
set laststatus=2
set mouse=a
set nowrap linebreak
set number
set path+=**
set scrolloff=0 sidescrolloff=0
set smarttab cindent
set spell spelllang=en_us
set splitright
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set tags=tags
set termguicolors
set ts=2 sts=2 sw=2 et
set undofile

set wildmode=longest:list,full wildmenu
hi Normal guibg=NONE ctermbg=NONE

colorscheme gruvbox

map <leader>id :put =strftime('%Y-%m-%d')<CR>
map <leader>it :put =strftime('%Y-%m-%d %H:%M:%S%z')<CR>
