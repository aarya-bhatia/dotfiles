syntax on
filetype plugin indent on

let maplocalleader = " "
let mapleader = " "

call plug#begin('~/.nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'kshenoy/vim-signature'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'romainl/vim-qf'
Plug 'ap/vim-css-color'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'preservim/tagbar'
Plug 'wellle/targets.vim'
Plug 'freitass/todo.txt-vim'

" snippets
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'preservim/nerdtree'
Plug 'wellle/targets.vim'

" neovim only
Plug 'stevearc/oil.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'folke/tokyonight.nvim'

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'

call plug#end()

if executable('ag')
  set grepprg=ag\ --vimgrep
  set grepformat=%f:%l:%c:%m
elseif executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat=%f:%l:%c:%m
endif

if isdirectory($HOME . "/vimfiles")

  autocmd BufNewFile *.sh 0r ~/vimfiles/templates/skeleton.sh

  source ~/vimfiles/install-vim-plug.vim
  source ~/vimfiles/vim-keymaps.vim
  source ~/vimfiles/autocommands.vim

  source ~/vimfiles/plugin-config/format.vim
  source ~/vimfiles/plugin-config/quickfix.vim
  source ~/vimfiles/plugin-config/fzf.vim
  source ~/vimfiles/plugin-config/nerdtree.vim
  source ~/vimfiles/plugin-config/vim-airline.vim

  set spellfile=~/vimfiles/spell/en.utf-8.add

endif

if has('nvim')
  set guicursor=""
  set undodir=/tmp/nvim.undo
else
  set nocompatible
  set hidden
  set undodir=~/.vim/undo
endif

set encoding=utf-8
set background=dark
set foldlevel=0 foldmethod=marker
set incsearch ignorecase smartcase hlsearch
set mouse=a
set nowrap linebreak
set number
set scrolloff=0 sidescrolloff=0
set smarttab cindent
set splitright
set ts=2 sts=2 sw=2 et
set tags=tags
set undofile
set completeopt=menuone,noinsert,noselect,preview
set wildmode=longest:list,full wildmenu
set spell spelllang=en_us
set termguicolors
set laststatus=2

hi Normal guibg=NONE ctermbg=NONE

colorscheme gruvbox

source ~/.config/nvim/lua/main.lua

