syntax on
filetype plugin indent on

let maplocalleader = " "
let mapleader = " "

let g:vimwiki_list = [{'path': '~/wiki/', 'syntax': 'markdown', 'ext': 'md' }]
let g:vimwiki_table_mappings=0

" let g:vsnip_snippet_dir=[$HOME."/vimfiles/snippets"]

let g:targets_nl = 'nl'

if isdirectory(expand('~/.virtualenvs/neovim'))
  let g:python3_host_prog = expand('~/.virtualenvs/neovim/bin/python')
endif

set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
" hide mode if status line shows it
set noshowmode
" See :h g:lightline.colorscheme
let g:lightline = { 'colorscheme': 'solarized' }


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
Plug 'ap/vim-css-color'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'preservim/tagbar'
Plug 'wellle/targets.vim'
Plug 'freitass/todo.txt-vim'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

" Plug 'vim-scripts/a.vim'
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
  Plug 'mfussenegger/nvim-jdtls'
endif

call plug#end()

if executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat=%f:%l:%c:%m
elseif executable('ag')
  set grepprg=ag\ --vimgrep\ --ignore\ tags
  set grepformat=%f:%l:%c:%m
endif

if isdirectory($HOME . "/vimfiles")

  autocmd BufNewFile *.sh 0r ~/vimfiles/templates/skeleton.sh

  source ~/vimfiles/install-vim-plug.vim
  source ~/vimfiles/vim-keymaps.vim
  source ~/vimfiles/autocommands.vim
  source ~/vimfiles/utils.vim

  source ~/vimfiles/plugin-config/snippy.vim
  source ~/vimfiles/plugin-config/quickfix.vim
  source ~/vimfiles/plugin-config/format.vim
  source ~/vimfiles/plugin-config/fzf.vim
  source ~/vimfiles/plugin-config/nerdtree.vim
  source ~/vimfiles/plugin-config/quickfix.vim
  source ~/vimfiles/plugin-config/tagbar.vim
  source ~/vimfiles/plugin-config/vim-airline.vim
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
  call MKDir('~/.vim/undo')
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

colorscheme default

source ~/.config/nvim/lua/main.lua

iabbrev @@ aarya.bhatia1678@gmail.com

if isdirectory($HOME . "/vimfiles")
    set runtimepath+=~/vimfiles
endif

"autocmd BufNewFile */diary/*.md 0r !echo "\# $(date)"

let g:todo_done_filename = 'done.txt'

" remap inbuilt CTRL+i = TAB, to use TAB key for other things...
nnoremap <leader><C-o> <C-i>

if has('vim')
  nnoremap <leader>- :LF<cr>
endif

" close all buffers except current
nnoremap <leader>bo :%bd\|e#<cr>

" [o]pen work [t]asks
nnoremap <leader>ot :e ~/Nextcloud/wiki/work.md<cr>
