syntax on
filetype plugin indent on

let maplocalleader = " "
let mapleader = " "

let g:targets_nl = 'nl'
let g:todo_done_filename = 'done.txt'

if isdirectory(expand('~/.virtualenvs/neovim'))
  let g:python3_host_prog = expand('~/.virtualenvs/neovim/bin/python')
endif

if !has('gui_running')
  set t_Co=256
endif

" hide mode if status line shows it
set noshowmode

let g:lightline = { 'colorscheme': 'solarized' }

if isdirectory($HOME . "/vimfiles")

  source ~/vimfiles/utils.vim
  source ~/vimfiles/install-vim-plug.vim
  source ~/vimfiles/vim-keymaps.vim
  source ~/vimfiles/vim-grep.vim
  source ~/vimfiles/autocommands.vim

  if isdirectory($HOME . "/vimfiles/plugin-config")
    source ~/vimfiles/plugin-config/quickfix.vim
    source ~/vimfiles/plugin-config/format.vim
    source ~/vimfiles/plugin-config/fzf.vim
    source ~/vimfiles/plugin-config/nerdtree.vim
    source ~/vimfiles/plugin-config/quickfix.vim
    source ~/vimfiles/plugin-config/tagbar.vim
    source ~/vimfiles/plugin-config/vim-easy-align.vim

    if has('nvim')
      source ~/vimfiles/plugin-config/snippy.vim
    endif

  endif

  if isdirectory($HOME . "/vimfiles/spell")
    set spellfile=~/vimfiles/spell/en.utf-8.add
  endif

endif

if has('nvim')
  set guicursor=""
  set undodir=/tmp/nvim-undo
else
  set nocompatible
  set hidden
  set undodir=/tmp/vim-undo
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
set splitright splitbelow
set ts=2 sts=2 sw=2 et
set tags=tags
set undofile
set completeopt=menuone,noinsert,noselect,preview
set wildmode=longest:list,full wildmenu
set termguicolors
set laststatus=2
set spelllang=en_us

hi Normal guibg=NONE ctermbg=NONE

iabbrev @@ aarya.bhatia1678@gmail.com

autocmd BufNewFile */diary/*.md 0r !echo "\# $(date +\%Y-\%m-\%d)"

" remap inbuilt CTRL+i = TAB, to use TAB key for other things...
nnoremap <leader><C-o> <C-i>

if has('vim')
  nnoremap <leader>- :LF<cr>
endif

call plug#begin('~/.nvim/plugged')

Plug 'vimwiki/vimwiki'
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
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'preservim/tagbar'
Plug 'wellle/targets.vim'
Plug 'freitass/todo.txt-vim'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'mileszs/ack.vim'

" Plug 'tpope/vim-abolish'

if has('nvim')
  Plug 'dcampos/nvim-snippy'
  Plug 'stevearc/oil.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'nvim-treesitter/nvim-treesitter-textobjects'
  Plug 'folke/tokyonight.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'

  if executable('java')
    Plug 'mfussenegger/nvim-jdtls'
  endif
endif

call plug#end()

if has('nvim')
  source ~/.config/nvim/lua/main.lua
  colorscheme tokyonight-moon
endif
