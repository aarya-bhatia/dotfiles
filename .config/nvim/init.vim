syntax on
filetype plugin indent on

let maplocalleader = " "
let mapleader = " "

let g:vimwiki_list = [{'path': '~/wiki/', 'syntax': 'markdown', 'ext': 'md' }]
let g:vimwiki_table_mappings=0

call plug#begin('~/.nvim/plugged')

"Plug 'preservim/vim-markdown'
Plug 'vimwiki/vimwiki'

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

if !exists('*MKDir')
  function MKDir(path)
    silent execute '!mkdir '.a:path.' > /dev/null 2>&1'
  endfunction
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

colorscheme gruvbox

source ~/.config/nvim/lua/main.lua

iabbrev @@ aarya.bhatia1678@gmail.com

if isdirectory($HOME . "/vimfiles")
    set runtimepath+=~/vimfiles
endif

"autocmd BufNewFile */diary/*.md 0r !echo "\# $(date)"

let g:todo_done_filename = 'done.txt'

" remap inbuilt CTRL+i = TAB, to use TAB key for other things...
nnoremap <leader><C-o> <C-i>
